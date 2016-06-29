// $ID: $
// File name: sr_9bit.sv$  
// Author: Rishab Verma mg147$
// Lab Section: Friday 11 30 am $
// Description: shift register 9 bit $







module sr_9bit
(
	input wire clk,
	input wire n_rst,
	input wire shift_strobe,
	input wire serial_in,
	output wire [7:0] packet_data,
	output wire stop_bit
);

reg [8:0] parallel_out;

flex_stp_sr #(9,0) SHIFT_REG_9BIT
(	
	.clk (clk),
	.n_rst (n_rst),
	.shift_enable (shift_strobe),
	.serial_in (serial_in),
	.parallel_out (parallel_out)
	
);

assign stop_bit = parallel_out[8];
assign packet_data = parallel_out[7:0];

endmodule
