// $ID: $
// File name: $  
// Created:     $
// Author:      Risha Verma$
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
	input wire serial_in,
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
