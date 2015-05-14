/*
 * Copyright (c) 2009 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */



/*
 * helloworld.c: Reed Solomon (255, 239) Encoder for Cortex A9 and
 * Microblaze Heterogeneous platform
 *
 * Fs = 312500 Hz
 * FSL-0 Length = 4096 samples
 * FSL-1 Length = 4096 samples
 *
 * Adler32 @ 256 bytes (32 samples) = 9.0525 us
 * Sampling time of 32 samples = 32/FS = 102.4 us
 *
 * Time benchmark of RS 239, 255: 590033 CPU cycles from Microblaze. 4ms is too long.
 * Created on August 16, 2014, 10:32 PM
 *
 */



#include <stdio.h>
#include <xil_io.h>
#include <xil_cache.h>
#include <xparameters.h>
#include <xil_exception.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <xil_types.h>
#include <xil_assert.h>
#include <xstatus.h>

#include "xtmrctr.h"
#include "platform.h"





//resource for adler32 checksum
#define BASE 65521 // largest prime smaller than 65536
#define NMAX 5552  // NMAX is the largest n such that 255n(n+1)/2 + (n+1)(BASE-1) <= 2^32-1

#define DO1(buf)  {s1 += *buf++; s2 += s1;}
#define DO2(buf)  DO1(buf); DO1(buf);
#define DO4(buf)  DO2(buf); DO2(buf);
#define DO8(buf)  DO4(buf); DO4(buf);
#define DO16(buf) DO8(buf); DO8(buf);


//resource for inter-processor communication
#define COMM_VAL   (*(volatile u32 *)(0xFFFC0000))    // OCM memory used to communicate with CPU0
volatile u32 * Ocm = NULL;  //shared memory pointer


//resource for the timer
XTmrCtr TimerCounter; /* The instance of the timer counter */
u32 TimerCount1 = 0;
u32 TimerCount2 = 0;
u8 TmrCtrNumber = 0;


//resource for the application
static uint8_t x[255];      //polynomial division working buffer [x^254 x^253 x^252 ... x^16   x^15 ... x^2 x^1 x^0]







//function prototypes
u32 adler32(u32 adler, u8 * buf, u32 len) {

    u32 s1 = adler & 0xffff;
    u32 s2 = (adler >> 16) & 0xffff;
    s32 k;

    while (len > 0) {
    	k = len < NMAX ? len : NMAX;
    	len -= k;
    	while (k >= 16) {
    		DO16(buf);
    		k -= 16;
    	}
    	if (k != 0) do {
    		DO1(buf);
    	} while (--k);
    	s1 %= BASE;
    	s2 %= BASE;
    }
    return (s2 << 16) | s1;
}















/****************************************************************************
* This function is the main function for the Microblaze in the AMP PS/MB xapp
* It is responsible for initializing the irq generator device, setting up
* interrupts, communicating with the PS via OCM, and writing output to the
* PS UART
*
* @param	None.
*
* @return
*		- XST_SUCCESS to indicate success.
*		- XST_FAILURE to indicate Failure.
*
* @note		None.
*
*
*****************************************************************************/
int main(void)
{
	//initialize cache
    init_platform();

    //initialize the timer
	int status = XTmrCtr_Initialize(&TimerCounter, XPAR_AXI_TIMER_0_DEVICE_ID);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	Xil_AssertNonvoid(TmrCtrNumber < XTC_DEVICE_TIMER_COUNT);
	Xil_AssertNonvoid(TimerCounter.IsReady == XIL_COMPONENT_IS_READY);



    Ocm = (volatile u32 *) 0xFFFC0004;
    while(1) {
    	//wait until CPU0 hands off flag
    	while(COMM_VAL == 0);

    	//Ocm = (volatile u32 *) 0xFFFC0004;
    	//for(int i = 0; i < 65535; i++) {
    	//	*Ocm += 1;
    	//	Ocm += 1;
    	//}

        //provide message information
        for(int i = 0; i < 255; i++) {
            x[i] = (uint8_t)i+1;
        }
        //The microblaze core will fill fetch samples from the ADC and store them
        //to msg[] before pushing to the DRAM; then the core will put the same
        //samples to x[] to calculate the parity. This avoids moving data around
        //between the LMB and the core.
        XTmrCtr_WriteReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TLR_OFFSET, 0);  //Set the Capture register to 0
        XTmrCtr_WriteReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCSR_OFFSET, XTC_CSR_INT_OCCURED_MASK | XTC_CSR_LOAD_MASK);  //Reset the timer and the interrupt
    	XTmrCtr_WriteReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCSR_OFFSET, XTC_CSR_ENABLE_TMR_MASK);  //Set the control/status register to enable timer
    	TimerCount1 = XTmrCtr_ReadReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCR_OFFSET);  //Read the timer

    	//performance hint: subsequent read operations of timer registers consume 10 CPU cycles

        //rs255239_encode(msg+1);
        //msg[] must be at least of length 239 bytes
        //the polynomial remainder will be stored in x[239 .. 254] for [... x^15 ... x^2 x^1 x^0]
        //append the remainder to msg[] bytes to form 255 byte encoded block




    	u32 checksum = adler32(1, x, 255);



        TimerCount2 = XTmrCtr_ReadReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCR_OFFSET);
        *Ocm = TimerCount2 - TimerCount1;
        *(Ocm+4) = checksum;

    	XTmrCtr_WriteReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCSR_OFFSET, XTC_CSR_INT_OCCURED_MASK | XTC_CSR_LOAD_MASK);
    	XTmrCtr_WriteReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCSR_OFFSET, 0);
        //pass control to CPU0
        COMM_VAL = 0;
    }

    cleanup_platform();

    return 0;
}

//EOF













