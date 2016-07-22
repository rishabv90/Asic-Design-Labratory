
// $ID: mg 147$
// File name: counter$  
// Author: Rishab Verma     $
// Lab Section: Friday 11 30$
// Description: $


module counter
(
	input	wire clk,
	input	wire n_reset,
	input	wire cnt_up,
	input	wire clear,
	output 	wire one_k_samples
);

//call flex counter here

flex_counter #(10) COUNT
(
      .clk(clk),
      .n_rst(n_reset),
      .clear(clear),



      .count_enable(cnt_up),
      .rollover_val(10'd1000),



      .rollover_flag(one_k_samples)
);

endmodule
