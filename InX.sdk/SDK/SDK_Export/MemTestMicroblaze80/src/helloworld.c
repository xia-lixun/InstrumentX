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

#include <stdio.h>
#include "platform.h"
#include <xil_io.h>
#include <xparameters.h>
#include <xil_exception.h>

/************************** Constant Definitions *****************************/


// base address of PS Uart1
#define UART_BASE 0xE0001000

// OCM memory used to communicate with CPU0
#define COMM_VAL  (*(volatile u32 *)(0xFFFC0000))








/****************************************************************************/
/**
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


    while(1) {
    	//wait until CPU0 hands off flag
    	while(COMM_VAL == 0);

    	// Wait until UART TX FIFO is empty
    	// while ((Xil_In32(UART_BASE + 0x2C) & 0x08) != 0x08);

        //pass control to CPU0
        COMM_VAL = 0;
    }

    cleanup_platform();

    return 0;
}



