// $ID: $
// File name: rcu.sv$  
// Created:$
// Author:      Rishab Verma$
// Lab Section: friday 11 30 am$
// Version:     $
// Description: $



module rcu
(
	input wire clk,
	input wire d_edge,
	input wire n_rst,
	input wire eop,
	input wire shift_enable,
	input wire [7:0] rcv_data,
	input wire byte_received,
	output reg rcving,
	output reg w_enable,
	output reg r_error 
);

typedef enum bit [3:0] {Idle, Eidle, get_sync, chk_sync,  Correct, Incorrect,  Store, check_eop, Wait_eop3, Wait_eop4, Wait_eop1, Wait_eop2, Wait, resetST} states;
states current;
states next;
always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
		current <= Idle;//changed to idle from reset.
	else 	
		current <= next;
end
always_comb
begin
	//initializations
	rcving = 1;	
	w_enable = 0;
	r_error = 0;
	next = current;
case(current)
	/*
	resetST:
	begin
		next = Wait;
		w_enable = 0;
		r_error = 0;
		rcving = 0;
		
	end
	
	Wait:
	begin
		next = Idle;
		w_enable = 0;
		r_error = 0;
		rcving = 0;
	end	*/

	Idle: 
	begin 
		if(d_edge)
		begin
			next = get_sync;
		end
		else 
		begin
			next = Idle;
		end

		w_enable = 0;
		rcving = 0;
		r_error = 0;
	end

	get_sync:
	begin
		//stay here
		if(byte_received)//(rcv_data == bite)		
		begin
			next = chk_sync;
		end
		
		else
		begin 	
			next = get_sync;
		end

		r_error = 0;
		w_enable = 0;
		rcving = 1;
	end

	

	chk_sync:
	begin 
		if(rcv_data == 8'b10000000)
		begin
			next = Correct;	
		end
		else 
		begin
			next = Incorrect;
		end
		
		w_enable = 0;
		r_error = 0;
		rcving = 1;
	end
	

	Correct:
	begin
		if(byte_received)
		begin
			next = Store;
		end
		else if(eop && shift_enable)
		begin
			next = Wait_eop1;
		end		
		else
		begin
			next = Correct;		
		end
		w_enable = 0;
		rcving = 1;
		r_error= 0;
	end

	Store:
	begin
		r_error = 0;
		w_enable =1;
		rcving =1;
		next = check_eop;
	end

	
	
	check_eop:
	begin
		if(eop && shift_enable)
		begin
			next = Wait_eop3;
		end
		else if (shift_enable && !eop)
		begin
			next = Correct;
		end
		
		rcving = 1 ;	
		r_error = 0;
		w_enable = 0;
		
	end	

	Wait_eop3:
	begin
		if(shift_enable && eop)//(~eop) error here ??
		begin
			next = Wait_eop4;
		end
		else 
		begin
			next = Wait_eop3;
		end

		r_error = 0;
		rcving = 1;
		w_enable = 0;
	end

	Wait_eop4:
	begin
		//error here??
		if(d_edge == 1)
		begin
		
			next = Idle;
		end
		else
		begin
			next = Wait_eop4;
		end
		r_error = 0;
		rcving = 0;
		w_enable = 0;
		
	end

	Incorrect:
	begin
		if(eop && shift_enable)
		begin
			next = Wait_eop1;
		end
		else
		begin
			next = Incorrect;
		end
		r_error = 1;
		rcving = 1;//error here??
		w_enable = 0;
	end

	Wait_eop1:
	begin
		if(eop && shift_enable)
		begin
			next = Wait_eop2;
		end
		else	
		begin
			next = Wait_eop1;
		end

		r_error = 1;
		rcving = 1;
		w_enable = 0;
	end

	
	Wait_eop2:
	begin
		if(d_edge)
		begin
			next = Eidle;
		end
		else	
		begin
			next = Wait_eop2;

		end

		r_error = 1;
		rcving = 1;//error here
		w_enable = 0;
	end
	
	Eidle:
	begin
		if(d_edge)
		begin	
			next = get_sync;
		end
		else
		begin
			next = Eidle;
		end
		r_error =1;
		rcving = 0;
		w_enable = 0;
	end
	
	

endcase	
end	
endmodule








































































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


endmodule*//*
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