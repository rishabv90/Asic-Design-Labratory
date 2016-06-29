// $Id: $
// File name:   sensor_s.sv
// Created:     1/22/2016
// Author:      Rishab Verma
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: Lab 2 1structural coding of sensor error detector

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);

wire int_and1;
wire int_and2;
wire int_or1;


and A1 (int_and1, sensors[3], sensors[1]);
and A2 (int_and2, sensors[2], sensors[1]);
or B1 (int_or1, int_and1, int_and2);
or B2 (error, int_or1, sensors[0]);

endmodule
 