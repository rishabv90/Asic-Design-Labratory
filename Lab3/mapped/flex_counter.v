/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Feb  5 22:05:44 2016
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   next_flag, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86;

  DFFSR \current_reg[0]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \current_reg[1]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \current_reg[2]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \current_reg[3]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR current_flag_reg ( .D(next_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U42 ( .A(n44), .B(n45), .Y(next_flag) );
  NAND3X1 U43 ( .A(count_enable), .B(n46), .C(n47), .Y(n45) );
  MUX2X1 U44 ( .B(n48), .A(n49), .S(n50), .Y(n47) );
  OAI21X1 U45 ( .A(rollover_val[3]), .B(n51), .C(n52), .Y(n49) );
  AOI22X1 U46 ( .A(n53), .B(n54), .C(n55), .D(n56), .Y(n52) );
  NAND2X1 U47 ( .A(n54), .B(n57), .Y(n48) );
  XNOR2X1 U48 ( .A(rollover_val[0]), .B(n58), .Y(n46) );
  OR2X1 U49 ( .A(n59), .B(n60), .Y(n44) );
  OAI22X1 U50 ( .A(n61), .B(n57), .C(n55), .D(n56), .Y(n60) );
  INVX1 U51 ( .A(n51), .Y(n61) );
  OAI21X1 U52 ( .A(n53), .B(n54), .C(n62), .Y(n59) );
  INVX1 U53 ( .A(rollover_val[2]), .Y(n54) );
  MUX2X1 U54 ( .B(n63), .A(n64), .S(n65), .Y(n43) );
  NAND2X1 U55 ( .A(n58), .B(n62), .Y(n64) );
  NAND2X1 U56 ( .A(count_out[0]), .B(n50), .Y(n58) );
  OAI22X1 U57 ( .A(n66), .B(n65), .C(n67), .D(n68), .Y(n42) );
  INVX1 U58 ( .A(n55), .Y(n67) );
  INVX1 U59 ( .A(count_out[1]), .Y(n66) );
  OAI22X1 U60 ( .A(n69), .B(n65), .C(n70), .D(n68), .Y(n41) );
  OAI22X1 U61 ( .A(n71), .B(n65), .C(n51), .D(n68), .Y(n40) );
  NAND3X1 U62 ( .A(n50), .B(n62), .C(n65), .Y(n68) );
  INVX1 U63 ( .A(clear), .Y(n62) );
  NAND3X1 U64 ( .A(n72), .B(n73), .C(n74), .Y(n50) );
  AOI21X1 U65 ( .A(n75), .B(rollover_val[3]), .C(n76), .Y(n74) );
  XNOR2X1 U66 ( .A(n77), .B(n51), .Y(n76) );
  NAND2X1 U67 ( .A(n78), .B(n57), .Y(n77) );
  INVX1 U68 ( .A(rollover_val[3]), .Y(n57) );
  INVX1 U69 ( .A(n78), .Y(n75) );
  NAND3X1 U70 ( .A(rollover_val[1]), .B(rollover_val[2]), .C(rollover_val[0]), 
        .Y(n78) );
  XOR2X1 U71 ( .A(n70), .B(n79), .Y(n73) );
  XNOR2X1 U72 ( .A(rollover_val[2]), .B(n80), .Y(n79) );
  NAND2X1 U73 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n80) );
  INVX1 U74 ( .A(n53), .Y(n70) );
  XOR2X1 U75 ( .A(n81), .B(n69), .Y(n53) );
  MUX2X1 U76 ( .B(n82), .A(n83), .S(rollover_val[0]), .Y(n72) );
  NAND2X1 U77 ( .A(count_out[0]), .B(n84), .Y(n83) );
  XNOR2X1 U78 ( .A(n56), .B(n55), .Y(n84) );
  INVX1 U79 ( .A(rollover_val[1]), .Y(n56) );
  NAND2X1 U80 ( .A(n85), .B(n63), .Y(n82) );
  XNOR2X1 U81 ( .A(rollover_val[1]), .B(n55), .Y(n85) );
  XNOR2X1 U82 ( .A(count_out[1]), .B(n63), .Y(n55) );
  INVX1 U83 ( .A(count_out[0]), .Y(n63) );
  XOR2X1 U84 ( .A(n71), .B(n86), .Y(n51) );
  NOR2X1 U85 ( .A(n69), .B(n81), .Y(n86) );
  NAND2X1 U86 ( .A(count_out[1]), .B(count_out[0]), .Y(n81) );
  INVX1 U87 ( .A(count_out[2]), .Y(n69) );
  OR2X1 U88 ( .A(count_enable), .B(clear), .Y(n65) );
  INVX1 U89 ( .A(count_out[3]), .Y(n71) );
endmodule

