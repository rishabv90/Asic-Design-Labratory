// $ID: $
// File name: $  
// Created:     $
// Author:      $
// Lab Section: $
// Version:     $
// Description: $


module flex_stp_sr
#(
   NUM_BITS = 4,
   SHIFT_MSB = 1	 
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	output wire serial_in,
	output reg [NUM_BITS-1:0] parallel_out
);

  reg [(NUM_BITS - 1):0] next_state;

always_ff @ (posedge clk, negedge n_rst)  begin
    if(n_rst == 0)
      parallel_out <= '1;
    else
      parallel_out <=next_state;
        
end

always_comb
  begin
    
    if(shift_enable == 1) begin
        if (SHIFT_MSB == 1)
        next_state = {parallel_out[NUM_BITS-2:0], serial_in}; //shifting
      
      else
        next_state = {serial_in, parallel_out[NUM_BITS-1:1]}; //shifting

    end

    else
        next_state = parallel_out;
  
  end

endmodule


/*
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