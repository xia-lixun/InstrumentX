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
 * helloworld.c: simple test application
 */

#include "xil_io.h"
#include "xil_mmu.h"
#include "xpseudo_asm.h"
#include "remap_ocm.h"
#include <xil_cache.h>
#include <stdlib.h>
#include <xtime_l.h>

#include "xparameters.h"
#include "xil_exception.h"
#include "sleep.h"

#define GPIO_BASE  0xE000A000
#define GPIO_DIRM  (GPIO_BASE+0x0284)
#define GPIO_MASK_DATA  (GPIO_BASE+0x0010)

// OCM memory used to communicate with CPU0
#define COMM_VAL  (*(volatile u32 *)(0xFFFC0000))


//u32 OnChipMemBuffer[262143];
#define MN (65535)
u32 OnChipMemBuffer[MN];
XTime start = 0x0;
XTime stop;




int main()
{

	// Remap all 4 64KB blocks of OCM to top of memory
	MY_REMAP();

	// Disable L1 cache for OCM
	Xil_SetTlbAttributes(0xFFFC0000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0

	COMM_VAL = 0;


	/**********************************************************
     * mb bootloop
     * If not using FSBL to download Microblaze elf to DDR
     * the reset vector of the Microblaze needs to contain
     * a 'branch to self' in order to provide the Microblaze
     * valid code to run before before the debugger can halt
     * the Microblaze and download the application that 
     * places valid code at the Microblaze's reset vector
     *
     * If using SDK/XMD to download the Microblaze application
     * uncomment the following two lines of code
     **********************************************************/
	Xil_Out32(0x30000000, 0xb8000000);
	Xil_DCacheFlush();

	///////////////////////////////////////////////
	//Take PL out of reset
	//Enable emio bit 0
	Xil_Out32(GPIO_DIRM, 0x1);
	//Set emio[0] to release PL reset
	Xil_Out32(GPIO_MASK_DATA, 0xfffe0001);


	///////////////////////////////////////////////
	// Loop forever
	volatile u32 * Ocm = (volatile u32 *) 0xFFFC0004;

	u32 Endian = 0x12345678;
	u8 * pEndian = (u8 *) (&Endian);

	XTime_SetTime(start);
	xil_printf("Endianess: 0x12345678\n\r");
	xil_printf("Memory: %x - %x - %x - %x\n\r", *pEndian, *(pEndian+1), *(pEndian+2), *(pEndian+3));
	xil_printf("CPU0: start to write random number to shared location...\n\r");
	// Wait until UART TX FIFO is empty
	while ((Xil_In32(STDOUT_BASEADDRESS + 0x2C) & 0x08) != 0x08);
	XTime_GetTime(&stop);
	xil_printf("Time calibrate: %d CPU cycles from PMU.\n\r", (stop - start)*2);

	//u32 * DataBuffer = (u32 *) malloc( 4096 * sizeof(u32) );
	//xil_printf("Malloc: %x\n\r", DataBuffer);

	*Ocm = 0;
	volatile u32 * Dram = (volatile u32 *)0x001480C8;
	*Dram = 654321;
	Xil_DCacheFlush();

    while(1) {

    	//Ocm = (volatile u32 *) 0xFFFC0004;
    	//for(int i = 0; i < MN; i++) {
    	//	OnChipMemBuffer[i] = rand();
    	//	*Ocm = OnChipMemBuffer[i];
    	//	Ocm += 1;
        //	//xil_printf("Ocm address: %x\n\r", Ocm);
        //  }


        //from this point OCM belongs to Microblaze
    	COMM_VAL = 1;
    	while(COMM_VAL == 1);
    	//xil_printf("Time benchmark: %d CPU cycles from Microblaze.\n\r", *Ocm);
    	Xil_DCacheInvalidateRange(0x001480C8, 4);
    	xil_printf("DRAM Shared: %d OCM: %d\n\r", *((volatile u32 *)0x001480C8), *Ocm);
    	//now OCM belongs to Cortex A9
    	//Ocm = (volatile u32 *) 0xFFFC0004;
    	//for(int i = 0; i < MN; i++) {
    	//	if(*Ocm != OnChipMemBuffer[i]+1) {
    	//		xil_printf("CPU0: mismatch found: %x - %x\n\r", *Ocm, OnChipMemBuffer[i]+1);
    	//	}
    	//	Ocm += 1;
    	//}

		//xil_printf("CPU0: transaction done!\n\r");

    }

    return 0;
}
