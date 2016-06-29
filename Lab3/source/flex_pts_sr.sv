// $ID: $
// File name: $  
// Created:     $
// Author:      $
// Lab Section: $
// Version:     $
// Description: $



module flex_pts_sr
#(
   NUM_BITS = 4,
   SHIFT_MSB = 1	 
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire load_enable,
	input reg [NUM_BITS-1: 0] parallel_in,
	output wire serial_out
	//output [NUM_CNT_BITS ]
);

//declare states
reg [(NUM_BITS -1): 0] current;
reg [(NUM_BITS-1): 0] next;

always_ff @ (posedge clk, negedge n_rst) begin
    
    if( n_rst == 0)
      current <= '1;
    else
      current <= next;       
  end


 always_comb begin
    
    if(load_enable == 1)
      next = parallel_in;
      
    else
    begin
      
      if(shift_enable == 1) begin
        if (SHIFT_MSB == 1)
          next = {current[NUM_BITS-2:0], 1'b1};
      
        else
          next = { 1'b1, current[NUM_BITS-1:1]};      
        
      end
      else
        next = current;
        
    end
    
  end
  



		
  if(SHIFT_MSB == 1)
    assign serial_out = current[(NUM_BITS-1)];
  else
    assign serial_out = current[0];



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