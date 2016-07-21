// $Id: $
// File name:   $
// Created:     $
// Author:      $
// Description: $

`timescale 1ns / 100ps
module sync_high
(

	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out

);



reg next;
always_ff @ (posedge clk, negedge n_rst)
begin
	if (0 == n_rst)
	begin
		next <= 1;
		sync_out <= 1;
	end
	
	else
	begin
		next <= async_in;
		sync_out <= next;
		
	end
end

endmodule
