// File name: tb_moore.sv$  
// Author: Rishab Verma mg147$
// Lab Section: Friday 11 30 am $
// Description: test bench for Moore machine 1101 detector $


`timescale 1ns / 100ps

module tb_moore();

	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 1;
	localparam NUM_CNT_BITS = 4;
	integer test;
	reg tb_clk;
	reg tb_n_rst;
	reg tb_i;
	reg tb_o;
	
	moore DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i(tb_i),
		.o(tb_o)		
	);

	//clock generation block
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
	//first basic case
		test = 1;
		tb_n_rst = 1'b0;
		#(CHECK_DELAY);
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		
		tb_i=1'b1;
	
		if(tb_o == 0)
			$info("test = 1 works");
		else
			$error("test = 1 failed");

	//case 2
	//checking o is 0 when we have 11
		
		test = 2;		
		tb_i = 1'b1;
	
		@(posedge tb_clk);
		
		

	
		if(tb_o == 0)
			$info("test = 2 works");
		else
			$error("test = 2 failed");
	
	//case 3
	//checking 0 is 0 when we have 110
	
		test = 3;		
		tb_i = 1'b0;

		@(posedge tb_clk);
		
		

	
		if(tb_o == 0)
			$info("test = 3 works");
		else
			$error("test = 3 failed");
				
			

	//case 4 checking o =1 when we have 1101
		
		test = 4;
		tb_i = 1'b1;
		
		@(posedge tb_clk);
		@(posedge tb_clk);
		

	
		if(tb_o == 1)
			$info("test = 4 works");
		else
			$error("test = 4 failed");


	//case 5	
		test = 5;
		tb_i = 1'b1;
		
		@(posedge tb_clk);
		
		

	
		if(tb_o == 0)
			$info("test = 5 works");
		else
			$error("test = 5 failed");   
	   
	//case 6	
		test = 6;
		tb_i = 1'b0;
		
		@(posedge tb_clk);
		
		

	
		if(tb_o == 0)
			$info("test = 6 works");
		else
			$error("test = 6 failed");  

	//case 7	
		test = 7;
		tb_i = 1'b1;
		
		@(posedge tb_clk);
		
		

	
		if(tb_o == 1)
			$info("test = 7 works");
		else
			$error("test = 7 failed");  
	

	end

endmodule
