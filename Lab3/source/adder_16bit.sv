// $ID: $
// File name: $  
// Created:     $
// Author:      $
// Lab Section: $
// Version:     $
// Description: $


module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);


genvar j;

 generate
	for (j = 0;j <= (16-1) ; j = j + 1)
	begin
           //adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]),.sum(sum[i]), .carry_out(carrys[i+1]));	
	   //1 bit adder result check
		always @ (a[j], b[j], carry_in )
		begin
			assert( (a[j] == 1'b1) || (a[j] == 1'b0) )
			else
			$error("Input 'a' component %d is not a digital logic ", j);
			
			
			assert( (b[j] == 1'b1) || (b[j] == 1'b0) )
			else
			$error("Input 'a' component %d is not a digital logic ", j);
			
			
			assert( (carry_in == 1'b1) || (carry_in == 1'b0) )
			else
			$error("Input 'carry_in' component %d is not a digital logic ");
			
				
		end		   
	end	
  	endgenerate



	adder_nbit #(16) IX (.a(a), .b(b), .carry_in(carry_in),.sum(sum), .overflow(overflow));		
	
	endmodule
// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
