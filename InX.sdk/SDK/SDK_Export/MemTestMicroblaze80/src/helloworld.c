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
 * Created on August 16, 2014, 10:32 PM
 *
 */



#include <stdio.h>
#include <xil_io.h>
#include <xparameters.h>
#include <xil_exception.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>

#include "platform.h"
#include "ecc.h"





#define UART_BASE  (0xE0001000)                       // base address of PS Uart1
#define COMM_VAL   (*(volatile u32 *)(0xFFFC0000))    // OCM memory used to communicate with CPU0
#define ML         (239 + NPAR)
//N = 255
//K = 239
//t = (N - K) / 2 = 8
//m = 8





volatile u32 * Ocm = NULL;  //shared memory pointer
static uint8_t x[255];      //polynomial division working buffer [x^254 x^253 x^252 ... x^16   x^15 ... x^2 x^1 x^0]
static uint8_t * xPar = NULL;
static uint8_t msg[256];
static uint8_t * msgPar = NULL;
static uint8_t i2d[255];    //map index form [alpha^0 .. alpha^254] to symbols (decimal)
static uint8_t d2i[256];    //map symbols to index form
//static uint8_t g[17] = {1, 59, 13, 104, 189, 68, 209, 30, 8, 163, 65, 41, 229, 98, 50, 36, 59};
static uint8_t g[17] = {1, 118, 52, 103, 31, 104, 126, 187, 232, 17, 56, 183, 49, 100, 81, 44, 79};
static uint8_t q;
static uint16_t ind, ind1, ind2;










void rs255239_init(void) {

    //generate index-to-decimal form lookup table
    // P(x) = x^8 + x^4 + x^3 + x^2 + 1
    uint16_t Px = 0x11D;
    uint16_t a  = 0x1;

    i2d[0] = (uint8_t)a;
    for(int i = 1; i < 255; i++) {
        a = a << 1;
        if(a & 0x100) {
            a = a ^ Px;
        }
        i2d[i] = (uint8_t)a;
    }


    //generate decimal-to-index form lookup table
    //note that i2d[i] belongs to 1..255
    //d2i[0] is a padding slot for operation reduction
    for(int i = 0; i < 255; i++) {
        d2i[i2d[i]] = (uint8_t)i;
    }

    //idenfity parity domain
    xPar = &x[239];
    msgPar = &msg[239];
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
    init_platform();
    rs255239_init();

    Ocm = (volatile u32 *) 0xFFFC0004;

    while(1) {
    	//wait until CPU0 hands off flag
    	while(COMM_VAL == 0);

    	// Wait until UART TX FIFO is empty
    	// while ((Xil_In32(UART_BASE + 0x2C) & 0x08) != 0x08);

    	//Ocm = (volatile u32 *) 0xFFFC0004;
    	//for(int i = 0; i < 65535; i++) {
    	//	*Ocm += 1;
    	//	Ocm += 1;
    	//}


        //provide message information
        for(int i = 0; i < 256; i++) {
            x[i] = (uint8_t)i+1;
        }
        //The microblaze core will fill fetch samples from the ADC and store them
        //to msg[] before pushing to the DRAM; then the core will put the same
        //samples to x[] to calculate the parity. This avoids moving data around
        //between the LMB and the core.


        //rs255239_encode(msg+1);
        //msg[] must be at least of length 239 bytes
        //the polynomial remainder will be stored in x[239 .. 254] for [... x^15 ... x^2 x^1 x^0]
        //append the remainder to msg[] bytes to form 255 byte encoded block
        //memcpy(x, msg+1, 239);
        memset(xPar, 0x0, 16);

        //polynomial division from kx^238 to kx^0
        for(int i = 0; i < 239; i++) {
            if(x[i] == 0x0) {
                continue;
            } else {
                ind1 = (uint16_t) d2i[x[i]];
                for(int j = 0; j < 17; j++) {
                    //convert from decimal to index
                    ind2 = (uint16_t) d2i[g[j]];
                    ind = ind1 + ind2;
                    ind = ind % 255;
                    q = i2d[ind];
                    x[i+j] ^= q;
                }
            }
        }

        //form the code word
        //for(int k = 239; k < 255; k++) {
        //    msg[k] = x[k];
        //}
        memcpy(msgPar, xPar, 16);



        //pass control to CPU0
        COMM_VAL = 0;
    }

    cleanup_platform();

    return 0;
}

//EOF


