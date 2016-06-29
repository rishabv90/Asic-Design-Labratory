// File name: tb_mealy.sv$  
// Author: Rishab Verma mg147$
// Lab Section: Friday 11 30 am $
// Description: test bench for Mealy machine 1101 detector $


`timescale 1ns / 100ps

module tb_mealy();

	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 1;
	localparam NUM_CNT_BITS = 4;
	integer test;
	reg tb_clk;
	reg tb_n_rst;
	reg tb_i;
	reg tb_o;
	
	mealy DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i(tb_i),
		.o(tb_o)		
	);

	//clock generation here
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	
	initial 
	begin
	
	//case 1
	//first case passing 1101 to it
		test = 1;
		
		tb_n_rst = 1'b0;
		
		
		#5;
		tb_n_rst = 1'b1;
		//@(posedge tb_clk);
		#5;

		tb_i=1'b1;
		@(posedge tb_clk);
		tb_i=1'b1;
		@(posedge tb_clk);
		tb_i=1'b0;
		@(posedge tb_clk);
		tb_i=1'b1;
		
		#(CHECK_DELAY);

		
		if(tb_o == 1)
			$info("test = 1 works");
		else
			$error("test = 1 failed");

	//case 2
	//checking if it fails like the way we want it to fail
		
		test = 2;	
	
		tb_n_rst = 1'b0;				
		#5;
		tb_n_rst = 1'b1;
		//@(posedge tb_clk);
		#5;
		
		tb_i = 1'b1;
      		@(posedge tb_clk);
        	tb_i = 1'b1;
       		@(posedge tb_clk);
       		tb_i = 1'b1;
        	@(posedge tb_clk);
        	tb_i = 1'b1;	
        	@(posedge tb_clk);	
        	tb_i = 1'b1;
       	 	@(posedge tb_clk);
        	tb_i = 1'b0;
        	@(posedge tb_clk);
        	tb_i = 1'b0;
		

		#(CHECK_DELAY);	
		
		if(tb_o == 0)
			$info("test = 2 works");
		else
			$error("test = 2 failed");
	
	//case 3
	//checking if we can get two in one 
	
		test = 3;	
	
		tb_n_rst = 1'b0;				
		#5;
		tb_n_rst = 1'b1;
		//@(posedge tb_clk);
		#5;
		
		tb_i = 1'b1;
      		@(posedge tb_clk);
        	tb_i = 1'b1;
       		@(posedge tb_clk);
       		tb_i = 1'b0;
        	@(posedge tb_clk);
        	tb_i = 1'b1;	
        	@(posedge tb_clk);	
        	tb_i = 1'b1;
       	 	@(posedge tb_clk);
        	tb_i = 1'b0;
        	@(posedge tb_clk);
        	tb_i = 1'b1;
		

		#(CHECK_DELAY);	
		
		if(tb_o == 1)
			$info("test = 3 works");
		else
			$error("test = 3 failed");
				
			

	//case 4 
	//error case
		
		
		test = 4;	
	
		tb_n_rst = 1'b0;				
		#5;
		tb_n_rst = 1'b1;
		//@(posedge tb_clk);
		#5;
		
		tb_i = 1'b1;
      		@(posedge tb_clk);
        	tb_i = 1'b1;
       		@(posedge tb_clk);
       		tb_i = 1'b1;
        	@(posedge tb_clk);
        	tb_i = 1'b1;	
        	@(posedge tb_clk);	
        	tb_i = 1'b1;
       	 	@(posedge tb_clk);
        	tb_i = 1'b1;
        	@(posedge tb_clk);
        	tb_i = 1'b0;
		

		#(CHECK_DELAY);	
		
		if(tb_o == 0)
			$info("test = 4 works");
		else
			$error("test = 4 failed");
	end

endmodule