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
 * MD5 @ 256 bytes = 42.672 us
 * Adler32 @ 256 bytes (32 samples) = 9.0525 us
 * Sampling time of 32 samples = 32/FS = 102.4 us
 * Time benchmark of RS 239, 255: 590033 CPU cycles from Microblaze. 4ms is too long.
 *
 * DRAM write estimate:
 * 256 byte = 64 word. 20 cycles / word => 64*20 = 1280 cycles = 10.24 us
 *
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
#include <xbasic_types.h>
#include <xil_assert.h>
#include <fsl.h>
#include <mb_interface.h>
#include <xstatus.h>

#include "xtmrctr.h"
#include "platform.h"
#include "md5.h"







//======================
// Function Prototypes
//======================

// resource for adler32 checksum
//#define BASE 65521 // largest prime smaller than 65536
//#define NMAX 5552  // NMAX is the largest n such that 255n(n+1)/2 + (n+1)(BASE-1) <= 2^32-1
//
//#define DO1(buf)  {s1 += *buf++; s2 += s1;}
//#define DO2(buf)  DO1(buf); DO1(buf);
//#define DO4(buf)  DO2(buf); DO2(buf);
//#define DO8(buf)  DO4(buf); DO4(buf);
//#define DO16(buf) DO8(buf); DO8(buf);


// resource for MD5
MD5_CTX mdContext;


// resource for inter-processor communication
#define SEMAPHORE_VAL		(*(volatile u32 *)(0xFFFC0000))		// OCM memory starting address used as semaphore
#define SEMAPHORE_PEND()	while ( SEMAPHORE_VAL == 0 )		// blocking the thread waiting for the flag set
#define SEMAPHORE_POST()	SEMAPHORE_VAL = 0					// clear the flag to signify resource release

typedef struct SharedMem_ {
	volatile u32 * start;		// shared memory pointer
	volatile u32 * end;			// address of the last entry
	volatile u32 * iterator;	// current pointer
	u32 len;					// number of bytes
} SharedMem_t;

SharedMem_t shm;


// resource for the timer
XTmrCtr TimerCounter;	// The instance of the timer counter
u32 TimerCount1 = 0;
u32 TimerCount2 = 0;
u8 TmrCtrNumber = 0;


// resource for the application
// we need to process 2048 samples per channel per iteration
#define PCM_BLOCK_SIZE 4096
typedef struct DataChunk_ {
	u32 DataPCM[PCM_BLOCK_SIZE];	// sensory data in interleaved PCM format
	u8 Checksum[16];				// slot for hash digest
} DataChunk_t;

DataChunk_t DataChunk;








/****************************************************************************
* Convert Q0.31 data fetched from the ADC to IEEE754 single precision
*
* @param
*		Xuint32 fixedp
*
* @return
*		Floating point in 32-bit unsigned int format
*
* @note
* 		There is no need to consider de-normalized values
*
*****************************************************************************/
Xuint32 q2f ( Xuint32 fixedp )
{
	Xuint32 floatp;
	Xuint32 sign;
	Xuint32 exp;

    if( fixedp == 0x0 ) {
	    return 0x0;      //zero case is special
    }
    else {
	    sign = fixedp & 0x80000000;               //get sign to bit 31
	    if( sign ) {                              //get absolute value
		    fixedp = ~fixedp;
		    fixedp += 1;
	    }
	    asm("clz %0, %1":"=r"(exp):"r"(fixedp));  //get exponential offset, and we know here exp less than 32
	    fixedp = fixedp << exp;             //normalize the fractional part
	    fixedp = fixedp << 1;               //kill the leading 1

	    exp = 0x7F - exp;                         //calculate exponential part
	    exp = exp << 23;                               //move exp to bit 30 down to 23

	    fixedp = fixedp >> 9;                             //move fractional to bit 22..0

	    floatp = sign | exp;
	    floatp |= fixedp;

	    return floatp;
    }
}

/****************************************************************************
* Convert IEEE754 single precision data to Q0.31 for DAC
*
* @param
*		Xuint32 floatp
*
* @return
*		Unsigned int in Q0.31 format
*
* @note
* 		There is no need to consider de-normalized values
*
*****************************************************************************/
Xuint32 f2q ( Xuint32 floatp )
{
	Xuint32 fixedp;
	Xuint32 fixedu;
	Xuint32 sign;
	Xuint32 exp;

    sign = floatp & 0x80000000;

    exp = floatp & 0x7F800000;
    exp = 0x7F - (exp >> 23);

    fixedu = floatp & 0x007FFFFF;  //extract the fractional field
    fixedu = fixedu << 8;                  //to Q0.31
    fixedu |= 0x80000000;          //append leading 1
    fixedu = fixedu >> exp;                //scale according to the exponential

    if( sign ) {
	    fixedp = ~fixedu;
	    fixedp += 1;
    }
    else {
	    fixedp = fixedu;
    }
    return fixedp;
}






volatile u32 * Dram = (volatile u32 *)0x001480C8;
u32 temp;


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
*****************************************************************************/
int main(void)
{
	// enable the data cache.
	// note that there is no instruction cache for MB1(DAQ-DMA) as all
	// program and data will be placed in the 64KB local BRAM.
    init_platform();

    // initialize shared memory
    shm.start = (volatile u32 *) 0xFFFC0004;
    shm.end = (volatile u32 *) 0xFFFFFFFF;
    shm.len = (shm.end - shm.start) + 1;


    //initialize the timer
	int status = XTmrCtr_Initialize(&TimerCounter, XPAR_AXI_TIMER_0_DEVICE_ID);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	Xil_AssertNonvoid(TmrCtrNumber < XTC_DEVICE_TIMER_COUNT);
	Xil_AssertNonvoid(TimerCounter.IsReady == XIL_COMPONENT_IS_READY);


    while(1) {
    	//wait until CPU0 hands off flag
    	//while(SEMAPHORE_VAL == 0);
    	SEMAPHORE_PEND();

    	//Ocm = (volatile u32 *) 0xFFFC0004;
    	//for(int i = 0; i < 65535; i++) {
    	//	*Ocm += 1;
    	//	Ocm += 1;
    	//}
    	*(shm.start) = *Dram;
    	temp = *Dram;
    	temp += 1;
    	*Dram = temp;
    	microblaze_flush_dcache();

        //provide message information
        for(int i = 0; i < PCM_BLOCK_SIZE; i++) {
            DataChunk.DataPCM[i] = i+1;
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


    	//u32 checksum = adler32(1, x, 255);
        MD5_Init (&mdContext);
        MD5_Update (&mdContext, &(DataChunk.DataPCM[0]), PCM_BLOCK_SIZE * sizeof(u32));
        MD5_Final (&(DataChunk.Checksum[0]), &mdContext);


        TimerCount2 = XTmrCtr_ReadReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCR_OFFSET);
        //*(shm.start) = TimerCount2 - TimerCount1;
        //*(shm.start+1) = checksum;

    	XTmrCtr_WriteReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCSR_OFFSET, XTC_CSR_INT_OCCURED_MASK | XTC_CSR_LOAD_MASK);
    	XTmrCtr_WriteReg(TimerCounter.BaseAddress, TmrCtrNumber, XTC_TCSR_OFFSET, 0);

    	//pass control to CPU0
        //SEMAPHORE_VAL = 0;
    	SEMAPHORE_POST();
    }

    cleanup_platform();

    return 0;
}



////function prototypes
//u32 adler32(u32 adler, u8 * buf, u32 len) {
//
//    u32 s1 = adler & 0xffff;
//    u32 s2 = (adler >> 16) & 0xffff;
//    s32 k;
//
//    while (len > 0) {
//    	k = len < NMAX ? len : NMAX;
//    	len -= k;
//    	while (k >= 16) {
//    		DO16(buf);
//    		k -= 16;
//    	}
//    	if (k != 0) do {
//    		DO1(buf);
//    	} while (--k);
//    	s1 %= BASE;
//    	s2 %= BASE;
//    }
//    return (s2 << 16) | s1;
//}



//EOF













