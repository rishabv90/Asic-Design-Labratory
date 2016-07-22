// $ID: $
// File name: rcu.sv$  
// Author: Rishab Verma mg147$
// Lab Section: Friday 11 30 am $
// Description: reciever control unit (RCU) $


module rcu
(
	input wire clk,
	input wire n_rst,
	input wire start_bit_detected,
	input wire packet_done,
	input wire framing_error,
	output reg sbc_clear,
	output reg sbc_enable,
	output reg load_buffer,
	output reg enable_timer
);

typedef enum logic [2:0] {idle, startbit_rcd, packetbit_rcd, stopbit_rcd, frame_error, storedata} state_type;
state_type current, next;

always_ff @ (posedge clk, negedge n_rst)
begin	
	if(n_rst == 0)
		current <= idle;
	
	else
		current <= next;
end	


always_comb
begin
	next = current;
	
	case(current)
	
	idle:
		begin
			if(start_bit_detected == 1)	
				next = startbit_rcd;
			else
				next = idle;
		end

	startbit_rcd:
		begin
			next = packetbit_rcd;
		end
	
	packetbit_rcd:
		begin
			if(packet_done == 1)
				next = stopbit_rcd;
			else
				next = packetbit_rcd;
		end
	
	stopbit_rcd:
		begin
			next = frame_error;
		end

	frame_error:
		begin
			if(framing_error == 1)
				next = idle;
			else
				next = storedata;
		end

	storedata:
		begin
			next = idle;
		end

	default :	
		begin
			next = idle;
		end

	endcase

end

	assign sbc_clear = (current == startbit_rcd);
	assign sbc_enable = (current == stopbit_rcd);
	assign enable_timer = ( current == packetbit_rcd);
	assign load_buffer = (current == storedata);

endmodule						 
			
