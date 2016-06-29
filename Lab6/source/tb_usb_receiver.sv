


// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/22/2016
// Author:      Anirudh Ghantasala
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: test bench for overall main file usb_receiver.sv 


`timescale 1ns / 100ps
module tb_usb_receiver(
);

   
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_r_enable;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	reg tb_rcving;
	reg tb_r_error;

   always begin: clock
   #2 tb_clk = 0;
   #2 tb_clk = 1;
   end
   
   
   //PORT MAP OF TEST VALUES TO usb_receiver
   usb_receiver DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .d_minus(tb_d_minus), .r_enable(tb_r_enable), 
					.r_data(tb_r_data), .empty(tb_empty), .full(tb_full), .rcving(tb_rcving), .r_error(tb_r_error));
   
   
   	initial
   		begin

			// test case 1 -----------------------------------------
			@(negedge tb_clk)
			tb_n_rst = 0;	
			@(negedge tb_clk)
			@(negedge tb_clk)		
			tb_n_rst = 1;			
			tb_r_enable = 0;
	
			// idle line
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			
			// Sync byte
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_r_enable = 1;
			@(negedge tb_clk)
			tb_r_enable = 0;
			
			

			// Actual byte
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_r_enable = 1;		// read in actual byte [01100111 <-- decoded value]
			tb_r_enable = 0;
			
			// end of packet
			tb_d_plus = 0;
			tb_d_minus = 0;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 0;
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 0;



			// test case 2 --n_rst-------------------------------------------
			
			tb_n_rst = 0;			
			
			// idle line
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			
			// Sync byte
			@(negedge tb_clk)			
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 1;
			@(negedge tb_clk)
			tb_d_plus = 0;
			tb_d_minus = 0;
			@(negedge tb_clk)
			tb_r_enable = 1;			// let rcv_data be read after full byte is sent
			tb_r_enable = 0;
			// dont need actual byte for n_rst test	
			
			tb_n_rst = 1;
		end // initial begin

endmodule // tb_adder_16bit

