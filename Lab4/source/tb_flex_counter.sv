// $ID: $
// File name: $  
// Created:     $
// Author:      $
// Lab Section: $
// Version:     $
// Description: $



`timescale 1ns / 100ps

module tb_flex_counter ();

   	localparam  	NUM_CNT_BITS = 4;
	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; 
	
    //all the variablesssss herere	
    
    reg tb_count_enable;
    reg [NUM_CNT_BITS-1:0] tb_rollover_val;
    reg [NUM_CNT_BITS-1:0] tb_count_out;
    reg tb_rollover_flag;
    
    reg tb_clk;
    reg tb_n_rst;
    reg tb_clear;
    

    //copied from stp test bench
    flex_counter DUT
    ( 
        .clk( tb_clk ),
        .n_rst( tb_n_rst ),
        .clear( tb_clear ),
        .count_enable( tb_count_enable ),
        .rollover_val( tb_rollover_val ),
        .count_out( tb_count_out ),
        .rollover_flag( tb_rollover_flag ) 
    );

	integer testcase;

    // NEEED to generate clock herereere
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end




    initial
    begin

        @(posedge tb_clk);
        tb_clear = 1'b1;
        @(posedge tb_clk);
        tb_clear = 1'b0;
        @(posedge tb_clk)

        //TEST CASE 1
        testcase= 1;
	tb_n_rst= 1'b1;		
        tb_rollover_val = 4;
        tb_count_enable = 1'b0;
	tb_clear	= 1'b1;

        @(posedge tb_clk); 
        #(CHECK_DELAY);
        if( (tb_count_out == 0) && ( tb_rollover_flag == 0 ) )
            $info("case 1 workss");
        else 
            $error("case 1 does NOT work");
        
        
        //TEST CASE 2
        
        @(posedge tb_clk);
        tb_clear	= 1'b1;
        @(posedge tb_clk);
        tb_clear    = 1'b0;
        
        tb_n_rst		= 1'b0;		
        tb_rollover_val = 4;
        tb_count_enable = 1'b1;
	tb_clear	= 1'b0;
        testcase = 2;

	

    
        #(CHECK_DELAY);
        if( (tb_count_out == 0) && ( tb_rollover_flag == 0 ) )
            $info("case 2 works");
        else 
            $error("case 2 does NOT work");


        //case 3
        @(posedge tb_clk);
        tb_clear	= 1'b1;
        @(posedge tb_clk);
        tb_clear    = 1'b0;
       
	tb_rollover_val = 5;
        tb_count_enable = 1'b1;
	tb_clear = 1'b0;
        testcase = 3;
	tb_n_rst= 1'b1;		
        
	//we havee to do thsi to reduce metastability
        @(posedge tb_clk); 
        @(posedge tb_clk); 
        @(posedge tb_clk); 
        @(posedge tb_clk); 
        @(posedge tb_clk);
        
         

        #(CHECK_DELAY);
        if( (tb_count_out == tb_rollover_val) && ( tb_rollover_flag == 1 ) )
            $info("case 3 worksss");
        else 
            $error("case 3 does NOT work");

        //case 4
        tb_count_enable = 1'b0;
        @(posedge tb_clk);
        tb_clear = 1'b1;
        @(posedge tb_clk);
        tb_clear = 1'b0;
        tb_n_rst = 1'b1;		
        tb_rollover_val = 5;
        testcase = 4;

	
        
/*
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
*/

        @(posedge tb_clk); 
        @(posedge tb_clk); 
        @(posedge tb_clk); 
      

        #(CHECK_DELAY);
        if( (tb_count_out == 0) && ( tb_rollover_flag == 0 ) )
            $info("case 4 works");
        else 
            $error("case 4 does NOT work");


        //case 5
        @(posedge tb_clk);
        tb_clear	= 1'b1;
        @(posedge tb_clk);
        tb_clear    = 1'b0;
      
        
	tb_n_rst = 1'b1;		
        tb_rollover_val = 5;
        tb_count_enable = 1'b1;
        testcase = 5;
        
        tb_n_rst = 1'b0; 
        @(posedge tb_clk);

        #(CHECK_DELAY);
        if( (tb_count_out == 0) && ( tb_rollover_flag == 0 ) )
            $info("case 5 works");
        else 
            $error("case 5 does NOT");

    end



endmodule



/*
module flex_counter
#(
	NUM_CNT_BITS = 4
	    
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_CNT_BITS-1:0] rollover_val,
	output wire [NUM_CNT_BITS-1:0] count_out,
	output wire rollover_flag
);

 //need the flags
  reg current_flag;
  reg next_flag;

  reg [NUM_CNT_BITS-1:0] current;
  reg [NUM_CNT_BITS-1:0] next;
	

//flipflop register	
always_ff @ (posedge clk, negedge n_rst) begin
    if( n_rst == 0) begin
      current <= '0;
      current_flag <= '0;     
    end
      
    else begin
      current <= next;
      current_flag <= next_flag;
    end
       
  end



//combb  next state
 always_comb  begin    
    if(clear == 1) begin
      next = '0;
      next_flag = '0;
    end
    
    else begin 
   
      if(count_enable == 1) begin      
        next = current + 1;
	//set nxt flag to zeroooo bitss
        next_flag = 1'b0;
        if(next== (rollover_val + 1)) begin
           next= 1;
          end

        if(next == rollover_val)
           next_flag = 1'b1;
          end
      
      else begin
	//set bits to zeroooo
        next_flag = 1'b0;
        next = current;
      end     
    end   
  end
  
  assign count_out = current;
  assign rollover_flag = current_flag;



endmodule*/