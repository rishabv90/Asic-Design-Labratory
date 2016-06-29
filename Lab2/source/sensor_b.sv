// $Id: $
// File name:   sensor_b.sv
// Created:     1/22/2016
// Author:      Rishab Verma
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 1.2.3 sensor behavorial.

module sensor_b
(
	input wire [3:0] sensors,
	output reg error
);

reg int_and1;
reg int_and2;
reg int_or1;

always_comb
begin
 int_and1 = sensors[3] & sensors[1];
 int_and2 = sensors[2] & sensors[1];
 int_or1 = int_and1 | int_and2;
 error = int_or1 | sensors[0];
end

endmodule



