// $Id: $
// File name:  magnitute.sv $
// Author: Rishab Verma      $
// Description: magintude.sv$


module magnitude
(

	input wire [16:0] in,
	output reg [15:0] out
);

/*
reg [15:0] sign = in;
reg [16:0] temp_in;

always_comb
begin
	if(in[16] == 1)
	begin
		temp_in = ~temp_in;
		temp_in = temp_in + 1'b1;
	end
	
	else
	begin
		temp_in = in;
	end

end
assign out = temp_in[15:0];
*/


	//Easier way to do thisss
	assign out = (in[16] ? (~in[15:0] + 1) : in[15:0]);


endmodule


