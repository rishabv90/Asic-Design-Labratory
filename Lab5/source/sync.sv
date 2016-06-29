// $ID: mg 147$
// File name: flex counter$  
// Author: Rishab Verma $
// Lab Section: Friday 11 30$
// Description: $



module sync
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output wire sync_out
);
reg go;
reg leave;


always_ff @ (posedge clk, negedge n_rst) 
begin: FFL
	
if(1'b0 == n_rst) 
	begin
		leave <= 0;
		go <= 0;
	end 
	else 
	begin
		leave <= async_in;
		go <= leave;
	end
end

assign sync_out = go;


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