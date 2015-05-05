/*
 * Copyright (c) 2009-2013 Xilinx, Inc.  All rights reserved.
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

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#include "lwipopts.h"
#ifdef __arm__
#include "xil_printf.h"
#endif




#define SEND_BUFSIZE (1400)


static struct tcp_pcb *connected_pcb = NULL;
static char send_buf[SEND_BUFSIZE];
static unsigned txperf_client_connected = 0;
volatile extern int TxPerfConnMonCntr;




int transfer_data() {

#if __arm__
	int copy = 3;
#else
	int copy = 0;
#endif
	err_t err;
	struct tcp_pcb *tpcb = connected_pcb;

	if (!connected_pcb) {
		//xil_printf("transfer_data: connected_pcb null\r\n");
		return ERR_OK;
	}

	while (tcp_sndbuf(tpcb) > SEND_BUFSIZE) {
		err = tcp_write(tpcb, send_buf, SEND_BUFSIZE, copy);
		if (err != ERR_OK) {
			xil_printf("txperf: Error on tcp_write: %d\r\n", err);
			connected_pcb = NULL;
			return -1;
		}
		err = tcp_output(tpcb);
		if (err != ERR_OK) {
			xil_printf("txperf: Error on tcp_output: %d\r\n",err);
		}
		//xil_printf("trasfer_data: ok\r\n");
	}


//	if (TxPerfConnMonCntr == 20) {
//		err = tcp_write(tpcb, send_buf, tcp_sndbuf(tpcb), copy);
//		if (err != ERR_OK) {
//			xil_printf("txperf: Error on tcp_write: %d\r\n", err);
//			connected_pcb = NULL;
//		}
//		err = tcp_output(tpcb);
//		if (err != ERR_OK) {
//			xil_printf("txperf: Error on tcp_output: %d\r\n",err);
//		}
//	}


	return 0;
}




static err_t
txperf_sent_callback1(void){
	return 0;
}


static err_t
txperf_sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
#if __arm__
	int copy = 3;
#else
	int copy = 0;
#endif
	err_t err;

	TxPerfConnMonCntr = 0;

	while (tcp_sndbuf(tpcb) > SEND_BUFSIZE) {
		err = tcp_write(tpcb, send_buf, SEND_BUFSIZE, copy);
		if (err != ERR_OK) {
			xil_printf("txperf: Error on tcp_write: %d\r\n", err);
			connected_pcb = NULL;
			return -1;
		}
		err = tcp_output(tpcb);
		if (err != ERR_OK) {
			xil_printf("txperf: Error on tcp_output: %d\r\n",err);
		}
		//xil_printf("sent_callback: ok\r\n");
	}

	return ERR_OK;
}





static err_t
txperf_connected_callback(void *arg, struct tcp_pcb *tpcb, err_t err)
{
	xil_printf("txperf: Connected to iperf server\r\n");
    txperf_client_connected = 1;

	/* store state */
	connected_pcb = tpcb;

	/* set callback values & functions */
	tcp_arg(tpcb, NULL);
	tcp_sent(tpcb, txperf_sent_callback);

	//xil_printf("txperf_connected_callback: ok\r\n");
	/* initiate data transfer */
	return ERR_OK;
}




int
start_txperf_application()
{
	struct tcp_pcb *pcb;
	struct ip_addr ipaddr;
	err_t err;
	u16_t port;
	int i;

	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("txperf: Error creating PCB. Out of Memory\r\n");
		return -1;
	}

	/* connect to iperf server */
	IP4_ADDR(&ipaddr,  192, 168, 1, 3);		/* iperf server address */

	port = 5001;					/* iperf default port */
	err = tcp_connect(pcb, &ipaddr, port, txperf_connected_callback);
        txperf_client_connected = 0;

	if (err != ERR_OK) {
		xil_printf("txperf: tcp_connect returned error: %d\r\n", err);
		return err;
	}

	/* initialize data buffer being sent */
	for (i = 0; i < SEND_BUFSIZE; i++)
		send_buf[i] = (i % 10) + '0';

	return 0;
}



void
print_txperf_app_header()
{
        xil_printf("%20s %6s %s\r\n", "txperf client",
                        "N/A",
                        "$ iperf -s -i 5 -w 64k (on host with IP 192.168.1.100)");
}






////////////////////////////




void print_app_header()
{
	xil_printf("\n\r\n\r-----lwIP TCP echo server ------\n\r");
	xil_printf("TCP packets sent to port 6001 will be echoed back\n\r");
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
	//if (tcp_sndbuf(tpcb) > p->len) {
	//	err = tcp_write(tpcb, p->payload, p->len, 1);
	//} else
	//	xil_printf("no space in tcp_sndbuf\n\r");

	/* free the received pbuf */
	pbuf_free(p);

	return ERR_OK;
}


err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = 7;

	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ADDR_ANY, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	xil_printf("TCP echo server started @ port %d\n\r", port);

	return 0;
}
