// $ID: mg 147$
// File name: edge_detect$  
// Author: Rishab Verma $
// Lab Section: Friday 11 30$
// Description: $

module edge_detect
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	output reg d_edge
);

//logic nextstate;
//logic prevclk;
typedef enum bit {apos, bpos} states;
states current , next;
reg pdplus;



always_ff @ (posedge clk, negedge n_rst)
begin	
	if ( 1'b0 == n_rst)
	begin
		//d_edge <= 0;
		pdplus <= d_plus;
		current <= apos;
	end
	
	else
	begin		
		pdplus <= d_plus;
		current <= next;
	end
end

always_comb
begin
	
	//nextstate = prevclk ^ d_plus ;
	next = current;
	
	if(pdplus != d_plus)
	begin
		next = bpos;
	end
	else
	begin
		next = apos;
	end
end





assign d_edge = current == bpos;
 
endmodule

































































// $Id: $
// File name:   $
// Created:     $
// Author:      $
// Description: $
/*
module sync
(

	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out

);

	reg signal1;
	reg signal2;

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync1
		if(1'b0 == n_rst)
		begin
			signal1 <= 0;
		end
		else
		begin
			signal1 <= async_in;
		end
	end

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync2
		if(1'b0 == n_rst)
		begin
			signal2 <= 0;
		end
		else
		begin
			if( 1'b1 == signal1 ) 
			begin
				signal2 <= signal1;
			end
			else
			begin
				signal2 <= 0;
			end
		end	
	end
	assign sync_out = signal2;


endmodule*/