// $ID: $
// File name: timer.sv$  
// Author: Rishab Verma mg147$
// Lab Section: Friday 11 30 am $
// Description: timer $

module timer 
(
	input wire clk,
	input wire n_rst,
	input wire enable_timer,
	output wire shift_strobe,
	output wire packet_done
);
	

reg state1;
reg delayed_enable_timer;


reg [3:0] out_count1;
reg [3:0] out_count2;
 
flex_counter #(4) count_10
    (
        .clk(clk),
 	    .n_rst(n_rst),
 	    .clear(packet_done),
 	    .count_enable(delayed_enable_timer),
 	    .rollover_val(4'd10),
 	    .count_out(out_count1),
 	    .rollover_flag(shift_strobe)
    );


flex_counter #(4) count_9
    (
        .clk(clk),
        .n_rst(n_rst),
        .clear(packet_done),
        .count_enable(shift_strobe),
        .rollover_val(4'd9),
        .count_out(out_count2),
        .rollover_flag(packet_done)
    );

	


always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		state1 <= 0 ;
		delayed_enable_timer <= 0;
	end
	
	else
	begin
		state1 <= enable_timer;
		delayed_enable_timer <= state1;
	end
end

 





























endmodule
