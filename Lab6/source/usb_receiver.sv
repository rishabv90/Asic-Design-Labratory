// $ID: $
// File name: usb_receiver.sv$  
// Created:$
// Author:      Rishab Verma$
// Lab Section: friday 11 30 am$
// Version:     $
// Description: $



module usb_receiver
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	input wire r_enable,
	output wire [7:0] r_data,
	output wire empty,
	output wire full,
	output wire rcving,
	output wire r_error		

);



logic d_edge;
logic sync_dplus;
logic sync_dminus;
logic eop;
logic shift_enable;
logic byte_received ;
logic d_orig;
logic [7:0] rcv_data;
logic w_enable;

sync_high SH
(
	.clk(clk),
	.n_rst(n_rst),
	.async_in(d_plus),
	.sync_out(sync_dplus)	
);

sync_low SL
(
	.clk(clk),
	.n_rst(n_rst),
	.async_in(d_minus),
	.sync_out(sync_dminus)
);



edge_detect ED
(
	.clk(clk),
	.n_rst(n_rst),
	.d_plus(sync_dplus),
	.d_edge(d_edge)
);



eop_detect EOPD
(
	.d_plus(sync_dplus),
	.d_minus(sync_dminus),
	.eop(eop)
);




timer TM
(
	.clk(clk),
	.n_rst(n_rst),
	.d_edge(d_edge),
	.rcving(rcving),
	.shift_enable(shift_enable),
	.byte_received(byte_received)
);



shift_register SFR
(
	.clk(clk),
	.n_rst(n_rst),
	.shift_enable(shift_enable),
	.d_orig(d_orig),
	.rcv_data(rcv_data)
);



rcu RCU
(
	.clk(clk),
	.n_rst(n_rst),
	.d_edge(d_edge),
	.eop(eop),
	.shift_enable(shift_enable),
	.rcv_data(rcv_data),
	.byte_received(byte_received),
	.rcving(rcving),
	.w_enable(w_enable),
	.r_error(r_error)
);

rx_fifo RF
(
	.clk(clk),
	.n_rst(n_rst),
	.r_enable(r_enable),
	.w_enable(w_enable),
	.w_data(rcv_data),
	.r_data(r_data),
	.empty(empty),
	.full(full)
);

decode DC
(
	.clk(clk),
	.n_rst(n_rst),
	.d_plus(d_plus),
	.shift_enable(shift_enable),
	.eop(eop),
	.d_orig(d_orig)
);

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
*//*
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










// $Id: $
// File name:   $
// Created:     $
// Author:      $
// Description: $
/*
module sync
(

	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out

);

	reg signal1;
	reg signal2;

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync1
		if(1'b0 == n_rst)
		begin
			signal1 <= 0;
		end
		else
		begin
			signal1 <= async_in;
		end
	end

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync2
		if(1'b0 == n_rst)
		begin
			signal2 <= 0;
		end
		else
		begin
			if( 1'b1 == signal1 ) 
			begin
				signal2 <= signal1;
			end
			else
			begin
				signal2 <= 0;
			end
		end	
	end
	assign sync_out = signal2;


endmodule*/// $Id: $
// File name:   $
// Created:     $
// Author:      $
// Description: $
/*
module sync
(

	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out

);

	reg signal1;
	reg signal2;

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync1
		if(1'b0 == n_rst)
		begin
			signal1 <= 0;
		end
		else
		begin
			signal1 <= async_in;
		end
	end

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync2
		if(1'b0 == n_rst)
		begin
			signal2 <= 0;
		end
		else
		begin
			if( 1'b1 == signal1 ) 
			begin
				signal2 <= signal1;
			end
			else
			begin
				signal2 <= 0;
			end
		end	
	end
	assign sync_out = signal2;


endmodule*/// $Id: $
// File name:   $
// Created:     $
// Author:      $
// Description: $
/*
module sync
(

	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out

);

	reg signal1;
	reg signal2;

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync1
		if(1'b0 == n_rst)
		begin
			signal1 <= 0;
		end
		else
		begin
			signal1 <= async_in;
		end
	end

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync2
		if(1'b0 == n_rst)
		begin
			signal2 <= 0;
		end
		else
		begin
			if( 1'b1 == signal1 ) 
			begin
				signal2 <= signal1;
			end
			else
			begin
				signal2 <= 0;
			end
		end	
	end
	assign sync_out = signal2;


endmodule*/// $Id: $
// File name:   $
// Created:     $
// Author:      $
// Description: $
/*
module sync
(

	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out

);

	reg signal1;
	reg signal2;

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync1
		if(1'b0 == n_rst)
		begin
			signal1 <= 0;
		end
		else
		begin
			signal1 <= async_in;
		end
	end

	always_ff @ (posedge clk, negedge n_rst)
	begin : sync2
		if(1'b0 == n_rst)
		begin
			signal2 <= 0;
		end
		else
		begin
			if( 1'b1 == signal1 ) 
			begin
				signal2 <= signal1;
			end
			else
			begin
				signal2 <= 0;
			end
		end	
	end
	assign sync_out = signal2;


endmodule*/
