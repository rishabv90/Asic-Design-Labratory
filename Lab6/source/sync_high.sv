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
/*
	reg signal1;
	reg signal2;

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync1
		if(1'b0 == n_rst)
		begin
			signal1 <= 1;
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
			signal2 <= 1;
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

endmodule
*//*
`timescale 1ns /100ps

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	
	output reg sum,
	output reg carry_out
);
 
always @ (a,b, carry_in)
   begin
      assert(( a == 1'b1) || (a == 1'b0))
      else $error("Input 'a' of component is not a digital logic value");

      assert((b == 1'b1) || (b == 1'b0))
      else $error("Input 'b' of component is not a digital logic value");

      assert((carry_in == 1'b1) || (carry_in == 1'b0))
      else $error("Input 'carry_in' of component is not a digital logic value");
	
   end



  assign sum = carry_in ^ (a ^ b);
  assign carry_out = ((! carry_in) & b & a) | (carry_in & (b | a));


   
   always @ (a, b, carry_in)
   begin
     #(2) assert (((a+b+carry_in)%2) == sum)
       else $error("Output 's' of first 1 bit adder is not correct");
   end
	

endmodule
*//*
`timescale 1ns /100ps

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	
	output reg sum,
	output reg carry_out
);
 
always @ (a,b, carry_in)
   begin
      assert(( a == 1'b1) || (a == 1'b0))
      else $error("Input 'a' of component is not a digital logic value");

      assert((b == 1'b1) || (b == 1'b0))
      else $error("Input 'b' of component is not a digital logic value");

      assert((carry_in == 1'b1) || (carry_in == 1'b0))
      else $error("Input 'carry_in' of component is not a digital logic value");
	
   end



  assign sum = carry_in ^ (a ^ b);
  assign carry_out = ((! carry_in) & b & a) | (carry_in & (b | a));


   
   always @ (a, b, carry_in)
   begin
     #(2) assert (((a+b+carry_in)%2) == sum)
       else $error("Output 's' of first 1 bit adder is not correct");
   end
	

endmodule
*/