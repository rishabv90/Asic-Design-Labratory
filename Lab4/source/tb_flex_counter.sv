// $ID: $
// File name: $  
// Created:     $
// Author:     Rishab Verma  $
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
