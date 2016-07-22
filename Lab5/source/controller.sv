// $ID: mg 147$
// File name: controller$  
// Author: Rishab Verma     $
// Lab Section: Friday 11 30$
// Description: $

module controller(
   input wire clk,
   input wire n_reset,
   input wire dr,
   input wire lc,
   input wire overflow,
   output reg cnt_up,
   output reg clear,
   output wire modwait,
   output reg [2:0] op,
   output reg [3:0] src1,
   output reg [3:0] src2,
   output reg [3:0] dest,
   output reg err
);



typedef enum bit [4:0] {Idle, Load1, Wait1, Load2, Wait2, Load3, Wait3, Load4, Store1, Zero1, Sort1, Sort2, Sort3, Sort4, Mul1, Sub1, Mul2, Add1, Mul3, Sub2, Mul4, Add2, Cntup, Eidle} states;
reg nextmw;
reg currentmw;
states current;
states next;

always_ff @ (posedge clk, negedge n_reset)
begin
	if(n_reset == 0) 
	begin
	   current <= Idle;
	   currentmw <= 0;
	end 
	else 
	begin
	   current <= next;
	   currentmw <= nextmw;	   
	end
end

assign modwait = currentmw;

   
always_comb
begin
	cnt_up=0;
	err=0;
	next = current;
	nextmw = currentmw;
	clear=0;
	op=0;
	src1=0;
	src2=0;
	dest=0;
	
	case (current)


		Idle:
		begin
			if (lc)
			begin
				next = Load1;
				nextmw = 1;
			end
			else if (dr)
			begin
				next = Store1;
				nextmw = 1;
			end
			else 
			begin
				next = Idle;
				nextmw = 0;
			end 
			
			err = 0;
			cnt_up =0;
			op = 3'b000;
			clear = 0;
			//dest = 0;
			//src1 = 0;
			//src2 = 0;
		end
	

		Load1:
		begin
			next = Wait1;
			nextmw = 0;
			err = 0;
			op = 3'b011;
			cnt_up = 0;
			clear = 1;
			dest = 1;
			//src1 = 0;
			//src2 = 0;
		end		

//Wait state
	Wait1:
	begin
		if (lc)
		begin
			next = Load2;
			nextmw = 1;
		end
		else
		begin
			next = Wait1;
			nextmw = 0;
		end
		//dest =0;
		//src1 = 0;
		//src2 = 0;
		err = 0;
		cnt_up = 3'b000;
		clear = 0;
		op = 0;
	end		
	
//second load
	Load2:
	begin
		next = Wait2;
		nextmw = 0;
		clear = 0;
		cnt_up =0;
		
		op = 3'b011;
		err = 0;
		dest = 2;
		//src1 = 0;
		//src2 = 0;
	end

//second wait 
	Wait2:
	begin 
		if (lc)
		begin
			next = Load3;
			nextmw = 1;
		end
		else
		begin

			next = Wait2;
			nextmw = 0;
		end
		//dest =0;
		//src1 =0;
		//src2 = 0;
		
		err = 0;
		clear = 0;
		op = 3'b000;
		cnt_up = 0;	
	end

//thrid load 
	Load3:
	begin
		next = Wait3;
		nextmw = 0;
		clear = 0;
		cnt_up = 0;
		err = 0;
		op = 3'b011;
		dest = 3;
		//src1 = 0;
		//src2 = 0;
		
	end
		
//wait 3	

	Wait3:
	begin 
		if (lc)
		begin
			next = Load4;

			nextmw = 1;
		end
		else
		begin

			next = Wait3;
			nextmw = 0;
		end
		
		err = 0;
		clear = 0;
		//dest = 0;
		//src1 = 0;
		//src2 = 0;
		op = 3'b000;
		cnt_up = 0;	
	end


//load fourth
	Load4:
	begin
		next = Idle;
		op = 3'b011;
		nextmw = 0;
		clear = 0;
		cnt_up = 0;
		err = 0;

		dest = 4;
		//src1 = 0;
		//src2 = 0;
		//op to be 3b		
	end

//store 
	Store1 :
	begin
		if (dr)
		begin
			next = Zero1;
			nextmw = 1;
		end
		else 
		begin
			next = Eidle;
			nextmw = 0;
		end
		
		err = 0;
		clear = 0;
		
		//has to be 2
		op = 3'b010;
		//src1 = 0;
		//src2 = 0;
		dest = 5;
		cnt_up = 0;
	end

//zero state
	Zero1:
	begin
		next = Sort1;
		nextmw = 1;
		op = 3'b101;
		
		err  =0;
		src1 = 0;
		src2 = 0;
		dest = 0;	
		clear = 0;
		cnt_up = 0;
							
		
	end				

//Sort Statess
	Sort1:
	begin
		next = Sort2;
		nextmw = 1;
		op  = 3'b001;	
		err = 0;
		clear = 0;
		cnt_up = 0;
		dest = 9;
		src1 = 8;
		//src2 = 0;	
		
		
	end

	Sort2:
	begin
		next = Sort3;
		nextmw = 1;
		err = 0;
		clear = 0;
		cnt_up = 0;
		op  = 3'b001;
		
		
		dest = 8;
		src1= 7;
		//src2 = 0;	

	end

	Sort3:
	begin
		next = Sort4;
		nextmw = 1;
		err = 0;
		clear = 0;
		cnt_up = 0;
		op  = 3'b001;
		dest = 7;
		src1= 6;
		
		//src2 = 0;
		
	end

	Sort4 :
	begin
		next = Mul1;
		nextmw = 1;
		err = 0;
		clear = 0;
		cnt_up = 0;
		op  = 3'b001;
		dest = 6;
		src1= 5;
		
		//src2 = 0;
		
	end		

	Mul1:
		begin
		       next = Sub1;
	 	       nextmw = 1;
		       cnt_up=0;
		       clear=0;
	       		 err=0;
	               op=3'b110;
	       		dest=10;
	       	       src1=1;
	       	       src2=6;
		       
	       	      
	    end

	  Sub1: // substract
	    begin
	       if (overflow) 
		begin
		  nextmw = 0;
		  next = Eidle;
	       end 
	       else 
	       begin
		  next = Mul2;	
		  nextmw = 1;
		  
	       end

	       cnt_up = 0;
	       clear = 0;
	       err = 0;
	 	op = 3'b101;
		 dest = 0;
				
		src1 = 0;
	       src2 = 10;
	      
	       	    
	end


	  Mul2:
	    begin
	       next = Add1;
		nextmw = 1 ;
	       op=3'b110;
		cnt_up=0;
		clear=0;
	        dest=11;	
	       
		src1=2;
	       src2=7;
	
	          
	       err=0;
	    end
	  


	Add1://this is add now
	begin
		if (overflow)
		begin
	        	
			next = Eidle;
			nextmw = 0;
	  	end 
		else 
		begin
		
			  next = Mul3;
			  nextmw = 1;
	  	end
	  	

		     cnt_up=0;
	  	     clear=0;
	  	     op=3'b100;
			src1=0;
	  	     src2=11;
		  	dest=0;
	  	     
	  	     err=0;
	  	
	  end
	 


	 Mul3:
	    begin

	       next = Sub2;
		nextmw= 1;

	       cnt_up = 0;
	       clear = 0;
	        err=0;
	       op=3'b110;
		 dest=12;
		src1=3;
	       src2=8;
	      
	       
	      
	    end


	  Sub2://substract
	    begin
	       if (overflow) 
		begin
		  nextmw = 0;
		  next = Eidle;

	       end 
		else 
		begin

		  next = Mul4 ;
		  nextmw = 1;
	       end

	       cnt_up=0;
	       clear=0;
		err=0;
	       op=3'b101;
		dest=0;	
		src1=0;
	       src2=12;
	              
	       
	    end

	  Mul4:
	    begin
	       next = Add2;
	      nextmw = 1;
		 cnt_up=0;
	       clear=0;
	       err=0;
	       op=3'b110;
		 dest=13;
		src1=4;
	       src2=9;
	      
	       
	       
	    end


	Add2://addition
	    begin
	       if (overflow) 
		begin
		  
		  next = Eidle;
		nextmw = 0;

	       end 
		else 
		begin
		  
		  next = Cntup;
		  nextmw = 1;
	       end

	       cnt_up=0;
	       clear=0;
		err=0;
	       op=3'b100;
		dest=0;
		src1=0;
	       src2=13;	
	       
	      
	       
	    end

	Cntup:
		begin
			cnt_up= 1;
			next = Idle;
			nextmw = 0;
			err = 0;
			clear = 0;
			op = 3'b000;
			src1 = 0;
			src2 = 0;
			dest = 0;
		end

	  Eidle:
	    begin
	       
	       		if (dr)
			begin
				next = Store1;
				nextmw = 1;

			end

			else 
			begin
				next = Eidle;
				nextmw = 0;
			end
		
			err=1;
			
			clear = 0;
			op = 3'b000;
			//src1 = 0;
			//src2 = 0;
			//dest = 0;
			cnt_up = 0;
			
	    end

endcase
end

	
endmodule
