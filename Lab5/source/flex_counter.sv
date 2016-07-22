// $ID: mg 147$
// File name: flex counter$  
// Author: Rishab Verma     $
// Lab Section: Friday 11 30$
// Description: $




module flex_counter#(
    parameter NUM_CNT_BITS = 4
)
(
    input wire clk,
    input wire n_rst,
    input wire count_enable,
    input wire clear,
    input wire [(NUM_CNT_BITS-1):0] rollover_val,
    output wire rollover_flag,
    output wire [(NUM_CNT_BITS-1):0] count_out
);


reg flagtmp;
reg nextflag;


reg [(NUM_CNT_BITS-1):0] tempnxt;
reg [(NUM_CNT_BITS-1):0] tempcount;


always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
	 
		  tempcount <= 0;
	 	  flagtmp <= 1'b0;
	end 
	else 
	begin
	   	tempcount <= tempnxt;
	   	flagtmp <= nextflag;
	end
end
   
always_comb 
begin
      if(clear == 1) 
      begin
	 	tempnxt = 0;
	 	nextflag = 1'b0;
      end 

      else 
      begin
	 if(count_enable == 1) 
	 begin
	 	   tempnxt = tempcount + 1;
	 	   nextflag = 1'b0;

	    if(tempnxt == (rollover_val + 1)) 
	    begin
	 	      tempnxt = 1;
	    end

	    if(tempnxt == rollover_val) 
	    begin
	 	      nextflag = 1'b1;
	    end
	 end 

	else 
	begin
	 	   nextflag = flagtmp;
	 	   tempnxt = tempcount;
	 end 
      end 
   end
   
   assign rollover_flag = flagtmp;
   assign count_out = tempcount;
      

endmodule

