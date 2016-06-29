/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Feb 26 10:05:49 2016
/////////////////////////////////////////////////////////////


module sync_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   pass;

  DFFSR pass_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(pass) );
  DFFSR out_reg ( .D(pass), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   pass;

  DFFSR pass_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(pass) );
  DFFSR out_reg ( .D(pass), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module controller ( clk, n_reset, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   nxtMW, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n55, n56, n57, n58, n59, n60, n61, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164;
  wire   [4:0] curr;
  wire   [4:0] next;
  assign src1[3] = 1'b0;

  DFFSR tmpMW_reg ( .D(nxtMW), .CLK(clk), .R(n_reset), .S(1'b1), .Q(modwait)
         );
  DFFSR \curr_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[0]) );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[3]) );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[2]) );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[1]) );
  DFFSR \curr_reg[4]  ( .D(next[4]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[4]) );
  BUFX2 U3 ( .A(n140), .Y(n1) );
  BUFX2 U4 ( .A(n63), .Y(n43) );
  INVX2 U5 ( .A(n9), .Y(n4) );
  INVX2 U6 ( .A(n130), .Y(n2) );
  AND2X1 U7 ( .A(n138), .B(n122), .Y(n51) );
  AND2X2 U8 ( .A(n46), .B(n66), .Y(n3) );
  BUFX2 U9 ( .A(curr[1]), .Y(n60) );
  BUFX2 U10 ( .A(n141), .Y(n47) );
  OR2X1 U11 ( .A(n5), .B(n82), .Y(n118) );
  NAND2X1 U12 ( .A(n4), .B(n8), .Y(n5) );
  INVX1 U13 ( .A(n86), .Y(n6) );
  NAND2X1 U14 ( .A(n163), .B(n117), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n8) );
  AND2X2 U16 ( .A(n153), .B(n44), .Y(n9) );
  NOR2X1 U17 ( .A(n9), .B(n82), .Y(n32) );
  INVX2 U18 ( .A(n142), .Y(n44) );
  BUFX2 U19 ( .A(curr[3]), .Y(n61) );
  INVX8 U20 ( .A(n66), .Y(n42) );
  INVX1 U21 ( .A(n117), .Y(n105) );
  AND2X2 U28 ( .A(n119), .B(n120), .Y(n10) );
  AND2X2 U29 ( .A(n71), .B(n61), .Y(n11) );
  INVX2 U30 ( .A(n33), .Y(src2[2]) );
  AND2X2 U31 ( .A(n141), .B(n136), .Y(n33) );
  AND2X2 U32 ( .A(n85), .B(n123), .Y(n12) );
  AND2X2 U33 ( .A(n116), .B(n2), .Y(n13) );
  AND2X2 U34 ( .A(n87), .B(n34), .Y(n14) );
  AND2X2 U35 ( .A(n66), .B(n148), .Y(n49) );
  BUFX2 U36 ( .A(curr[3]), .Y(n15) );
  INVX1 U37 ( .A(n41), .Y(n16) );
  INVX2 U38 ( .A(n40), .Y(n41) );
  INVX2 U39 ( .A(n26), .Y(n71) );
  OR2X2 U40 ( .A(n17), .B(n37), .Y(n97) );
  NAND2X1 U41 ( .A(n63), .B(n56), .Y(n17) );
  INVX1 U42 ( .A(n150), .Y(n18) );
  INVX2 U43 ( .A(n18), .Y(n25) );
  INVX2 U44 ( .A(n40), .Y(n26) );
  BUFX2 U45 ( .A(n139), .Y(n27) );
  BUFX2 U46 ( .A(n61), .Y(n28) );
  INVX1 U47 ( .A(n71), .Y(n29) );
  NOR2X1 U48 ( .A(n61), .B(n30), .Y(n75) );
  NAND2X1 U49 ( .A(n16), .B(n63), .Y(n30) );
  OR2X1 U50 ( .A(n31), .B(n118), .Y(next[0]) );
  NAND2X1 U51 ( .A(n13), .B(n10), .Y(n31) );
  NAND2X1 U52 ( .A(n76), .B(n11), .Y(n122) );
  AND2X2 U53 ( .A(n136), .B(n140), .Y(n137) );
  INVX2 U54 ( .A(n59), .Y(n37) );
  BUFX2 U55 ( .A(n51), .Y(n34) );
  INVX1 U56 ( .A(n134), .Y(n35) );
  AND2X2 U57 ( .A(n56), .B(n154), .Y(n36) );
  INVX1 U58 ( .A(n36), .Y(n99) );
  NAND2X1 U59 ( .A(n32), .B(n14), .Y(n88) );
  INVX1 U60 ( .A(n37), .Y(n38) );
  BUFX2 U61 ( .A(n154), .Y(n39) );
  INVX1 U62 ( .A(curr[4]), .Y(n154) );
  BUFX4 U63 ( .A(curr[4]), .Y(n63) );
  INVX2 U64 ( .A(curr[2]), .Y(n40) );
  INVX2 U65 ( .A(curr[0]), .Y(n65) );
  INVX1 U66 ( .A(n138), .Y(n130) );
  INVX1 U67 ( .A(n82), .Y(n109) );
  NAND2X1 U68 ( .A(n154), .B(curr[1]), .Y(n45) );
  AND2X2 U69 ( .A(n46), .B(n66), .Y(n76) );
  INVX1 U70 ( .A(n45), .Y(n46) );
  INVX2 U71 ( .A(curr[3]), .Y(n69) );
  INVX2 U72 ( .A(n67), .Y(n64) );
  BUFX2 U73 ( .A(n27), .Y(n48) );
  INVX2 U74 ( .A(curr[1]), .Y(n148) );
  AND2X1 U75 ( .A(n66), .B(n148), .Y(n50) );
  AND2X1 U76 ( .A(n66), .B(n148), .Y(n52) );
  AND2X2 U77 ( .A(n57), .B(n69), .Y(n53) );
  OR2X1 U78 ( .A(n126), .B(n125), .Y(dest[0]) );
  AND2X2 U79 ( .A(n43), .B(n59), .Y(n55) );
  AND2X2 U80 ( .A(curr[1]), .B(n65), .Y(n56) );
  AND2X2 U81 ( .A(n68), .B(n39), .Y(n57) );
  AND2X2 U82 ( .A(n41), .B(n15), .Y(n58) );
  AND2X2 U83 ( .A(n41), .B(n69), .Y(n59) );
  AND2X1 U84 ( .A(n97), .B(n100), .Y(n74) );
  INVX1 U85 ( .A(src1[2]), .Y(n84) );
  INVX8 U86 ( .A(n65), .Y(n66) );
  NAND3X1 U87 ( .A(n49), .B(n38), .C(n39), .Y(n85) );
  NAND2X1 U88 ( .A(n3), .B(n38), .Y(n123) );
  NAND3X1 U89 ( .A(n63), .B(n71), .C(n69), .Y(n67) );
  NAND2X1 U90 ( .A(n64), .B(n56), .Y(n100) );
  NAND3X1 U91 ( .A(n3), .B(n71), .C(n69), .Y(n124) );
  NAND2X1 U92 ( .A(n148), .B(n71), .Y(n155) );
  INVX2 U93 ( .A(n155), .Y(n68) );
  NAND2X1 U94 ( .A(n66), .B(n53), .Y(n164) );
  NAND2X1 U95 ( .A(n124), .B(n164), .Y(n127) );
  NOR2X1 U96 ( .A(n66), .B(n63), .Y(n70) );
  NAND3X1 U97 ( .A(n58), .B(n148), .C(n70), .Y(n138) );
  NAND2X1 U98 ( .A(n58), .B(n36), .Y(n139) );
  NAND3X1 U99 ( .A(n61), .B(n36), .C(n71), .Y(n145) );
  INVX2 U100 ( .A(n145), .Y(cnt_up) );
  NAND3X1 U101 ( .A(n50), .B(n58), .C(n39), .Y(n121) );
  INVX2 U102 ( .A(n121), .Y(n129) );
  NOR2X1 U103 ( .A(cnt_up), .B(n129), .Y(n72) );
  NAND3X1 U104 ( .A(n34), .B(n27), .C(n72), .Y(n90) );
  NOR2X1 U105 ( .A(n127), .B(n90), .Y(n73) );
  NAND3X1 U106 ( .A(n12), .B(n74), .C(n73), .Y(op[0]) );
  NAND3X1 U107 ( .A(n66), .B(n75), .C(n60), .Y(n140) );
  NAND2X1 U108 ( .A(n64), .B(n42), .Y(n117) );
  NAND2X1 U109 ( .A(n53), .B(n42), .Y(n113) );
  AND2X2 U110 ( .A(n113), .B(n117), .Y(n79) );
  NAND3X1 U111 ( .A(n66), .B(n60), .C(n55), .Y(n116) );
  NAND3X1 U112 ( .A(n66), .B(n61), .C(n57), .Y(n142) );
  NAND2X1 U113 ( .A(n116), .B(n142), .Y(n107) );
  INVX2 U114 ( .A(n107), .Y(n78) );
  NAND2X1 U115 ( .A(n75), .B(n52), .Y(n141) );
  NAND2X1 U116 ( .A(n58), .B(n3), .Y(n136) );
  NAND2X1 U117 ( .A(n55), .B(n49), .Y(n135) );
  NAND3X1 U118 ( .A(n140), .B(n33), .C(n135), .Y(n128) );
  NAND3X1 U119 ( .A(n59), .B(n148), .C(n42), .Y(n81) );
  NAND2X1 U120 ( .A(n6), .B(n99), .Y(n112) );
  NOR3X1 U121 ( .A(n128), .B(op[0]), .C(n112), .Y(n77) );
  NAND3X1 U122 ( .A(n79), .B(n78), .C(n77), .Y(n111) );
  INVX2 U123 ( .A(n111), .Y(n106) );
  AOI22X1 U124 ( .A(n105), .B(n18), .C(n106), .D(n29), .Y(n80) );
  NAND3X1 U125 ( .A(n124), .B(n1), .C(n80), .Y(n89) );
  INVX2 U126 ( .A(overflow), .Y(n150) );
  INVX2 U127 ( .A(n81), .Y(n86) );
  NAND2X1 U128 ( .A(n86), .B(n43), .Y(n96) );
  OAI21X1 U129 ( .A(n150), .B(n97), .C(n96), .Y(n82) );
  NAND3X1 U130 ( .A(n121), .B(n139), .C(n135), .Y(src1[2]) );
  INVX2 U131 ( .A(n116), .Y(err) );
  INVX2 U132 ( .A(dr), .Y(n153) );
  AOI22X1 U133 ( .A(n38), .B(n36), .C(err), .D(n153), .Y(n83) );
  NAND3X1 U134 ( .A(n85), .B(n84), .C(n83), .Y(n102) );
  NOR2X1 U135 ( .A(n86), .B(n102), .Y(n87) );
  OR2X1 U136 ( .A(n89), .B(n88), .Y(next[2]) );
  INVX2 U137 ( .A(n90), .Y(n95) );
  INVX2 U138 ( .A(n113), .Y(n91) );
  NAND2X1 U139 ( .A(dr), .B(n91), .Y(n163) );
  INVX2 U140 ( .A(n163), .Y(n93) );
  INVX2 U141 ( .A(lc), .Y(n92) );
  AOI22X1 U142 ( .A(n93), .B(n92), .C(dr), .D(n107), .Y(n94) );
  NAND3X1 U143 ( .A(n95), .B(n111), .C(n94), .Y(next[3]) );
  NAND3X1 U144 ( .A(n117), .B(n97), .C(n96), .Y(n133) );
  AOI22X1 U145 ( .A(overflow), .B(n35), .C(n106), .D(n60), .Y(n98) );
  AND2X2 U146 ( .A(n164), .B(n98), .Y(n104) );
  NAND3X1 U147 ( .A(n100), .B(n142), .C(n99), .Y(n101) );
  NOR2X1 U148 ( .A(n102), .B(n101), .Y(n103) );
  NAND3X1 U149 ( .A(n104), .B(n47), .C(n103), .Y(next[1]) );
  NOR2X1 U150 ( .A(n105), .B(n128), .Y(n110) );
  AOI22X1 U151 ( .A(n107), .B(n153), .C(n106), .D(n43), .Y(n108) );
  NAND3X1 U152 ( .A(n110), .B(n109), .C(n108), .Y(next[4]) );
  AND2X2 U153 ( .A(n48), .B(n145), .Y(n120) );
  INVX2 U154 ( .A(n112), .Y(n114) );
  NAND2X1 U155 ( .A(n114), .B(n113), .Y(n115) );
  AOI22X1 U156 ( .A(n106), .B(n66), .C(lc), .D(n115), .Y(n119) );
  NAND2X1 U157 ( .A(n121), .B(n142), .Y(n126) );
  NAND3X1 U158 ( .A(n124), .B(n123), .C(n122), .Y(n125) );
  INVX2 U159 ( .A(n127), .Y(n144) );
  INVX2 U160 ( .A(n128), .Y(n132) );
  NOR2X1 U161 ( .A(n130), .B(n129), .Y(n131) );
  NAND3X1 U162 ( .A(n144), .B(n132), .C(n131), .Y(dest[1]) );
  NAND3X1 U163 ( .A(n144), .B(n48), .C(n142), .Y(dest[2]) );
  NAND2X1 U164 ( .A(n12), .B(n132), .Y(dest[3]) );
  NAND2X1 U165 ( .A(n47), .B(n135), .Y(src2[0]) );
  INVX2 U166 ( .A(n133), .Y(n134) );
  NAND2X1 U167 ( .A(n134), .B(n33), .Y(src2[1]) );
  NAND3X1 U168 ( .A(n140), .B(n135), .C(n134), .Y(src2[3]) );
  NAND3X1 U169 ( .A(n139), .B(n138), .C(n137), .Y(src1[0]) );
  NAND3X1 U170 ( .A(n51), .B(n47), .C(n140), .Y(src1[1]) );
  INVX2 U171 ( .A(dest[3]), .Y(n143) );
  NAND3X1 U172 ( .A(n144), .B(n143), .C(n142), .Y(op[1]) );
  INVX2 U173 ( .A(src2[3]), .Y(n146) );
  NAND3X1 U174 ( .A(n33), .B(n146), .C(n145), .Y(op[2]) );
  NAND2X1 U175 ( .A(lc), .B(n39), .Y(n152) );
  OAI21X1 U176 ( .A(n42), .B(n153), .C(n38), .Y(n147) );
  OAI21X1 U177 ( .A(n148), .B(n147), .C(n43), .Y(n159) );
  INVX2 U178 ( .A(n159), .Y(n149) );
  OAI21X1 U179 ( .A(n25), .B(n66), .C(n149), .Y(n151) );
  OAI21X1 U180 ( .A(n66), .B(n152), .C(n151), .Y(n161) );
  INVX2 U181 ( .A(modwait), .Y(n158) );
  MUX2X1 U182 ( .B(n158), .A(n153), .S(n66), .Y(n156) );
  OAI21X1 U183 ( .A(n156), .B(n155), .C(n39), .Y(n157) );
  OAI21X1 U184 ( .A(n159), .B(n158), .C(n157), .Y(n160) );
  MUX2X1 U185 ( .B(n161), .A(n160), .S(n28), .Y(n162) );
  NAND2X1 U186 ( .A(n163), .B(n162), .Y(nxtMW) );
  INVX2 U187 ( .A(n164), .Y(clear) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(SUM[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, count_enable, clear, 
        rollover_val, rollover_flag, count_out );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, count_enable, clear;
  output rollover_flag;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, N20, N21, N22, N23, N24, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n1, n2, n3, n4, n6, n7, n8, n9,
         n10, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;

  DFFSR \tmpCount_reg[0]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \tmpCount_reg[8]  ( .D(n101), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \tmpCount_reg[7]  ( .D(n102), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \tmpCount_reg[6]  ( .D(n103), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \tmpCount_reg[5]  ( .D(n104), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \tmpCount_reg[4]  ( .D(n105), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \tmpCount_reg[3]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \tmpCount_reg[2]  ( .D(n107), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \tmpCount_reg[1]  ( .D(n108), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \tmpCount_reg[9]  ( .D(n100), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR tmpFlag_reg ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U15 ( .A(n64), .B(n65), .Y(n55) );
  OAI21X1 U35 ( .A(n41), .B(n42), .C(n43), .Y(n99) );
  NAND2X1 U36 ( .A(rollover_flag), .B(n1), .Y(n43) );
  NAND3X1 U37 ( .A(n45), .B(n46), .C(n47), .Y(n42) );
  NOR2X1 U38 ( .A(n48), .B(n49), .Y(n47) );
  OAI22X1 U39 ( .A(N6), .B(n30), .C(N5), .D(n29), .Y(n49) );
  OAI21X1 U40 ( .A(rollover_val[0]), .B(n50), .C(n51), .Y(n48) );
  OAI21X1 U41 ( .A(n52), .B(n53), .C(n2), .Y(n51) );
  NAND2X1 U42 ( .A(n29), .B(n30), .Y(n53) );
  OR2X1 U43 ( .A(rollover_val[3]), .B(rollover_val[4]), .Y(n52) );
  AOI22X1 U44 ( .A(rollover_val[3]), .B(n10), .C(rollover_val[4]), .D(n9), .Y(
        n45) );
  NAND3X1 U45 ( .A(n54), .B(n55), .C(n56), .Y(n41) );
  NOR2X1 U46 ( .A(n57), .B(n58), .Y(n56) );
  OAI21X1 U47 ( .A(N9), .B(n24), .C(n59), .Y(n58) );
  OAI21X1 U48 ( .A(n60), .B(n61), .C(n62), .Y(n59) );
  OAI22X1 U49 ( .A(rollover_val[4]), .B(n9), .C(rollover_val[3]), .D(n10), .Y(
        n61) );
  OAI21X1 U50 ( .A(rollover_val[2]), .B(n22), .C(n63), .Y(n60) );
  AOI22X1 U51 ( .A(rollover_val[0]), .B(count_out[0]), .C(N5), .D(n29), .Y(n63) );
  OAI22X1 U52 ( .A(N13), .B(n28), .C(N12), .D(n27), .Y(n57) );
  OAI21X1 U53 ( .A(n66), .B(n67), .C(n62), .Y(n65) );
  OAI22X1 U54 ( .A(rollover_val[5]), .B(n8), .C(rollover_val[9]), .D(n3), .Y(
        n67) );
  OAI21X1 U55 ( .A(rollover_val[8]), .B(n4), .C(n68), .Y(n66) );
  AOI22X1 U56 ( .A(N10), .B(n25), .C(N11), .D(n26), .Y(n68) );
  OAI21X1 U57 ( .A(n69), .B(n70), .C(n2), .Y(n64) );
  NAND2X1 U58 ( .A(n24), .B(n25), .Y(n70) );
  NAND3X1 U59 ( .A(n27), .B(n28), .C(n26), .Y(n69) );
  AOI22X1 U60 ( .A(rollover_val[6]), .B(n7), .C(rollover_val[7]), .D(n6), .Y(
        n54) );
  OAI21X1 U61 ( .A(n3), .B(n71), .C(n72), .Y(n100) );
  NAND2X1 U62 ( .A(count_out[9]), .B(n1), .Y(n72) );
  OAI21X1 U63 ( .A(n4), .B(n71), .C(n73), .Y(n101) );
  NAND2X1 U64 ( .A(count_out[8]), .B(n1), .Y(n73) );
  OAI21X1 U65 ( .A(n6), .B(n71), .C(n74), .Y(n102) );
  NAND2X1 U66 ( .A(count_out[7]), .B(n1), .Y(n74) );
  OAI21X1 U67 ( .A(n7), .B(n71), .C(n75), .Y(n103) );
  NAND2X1 U68 ( .A(count_out[6]), .B(n1), .Y(n75) );
  OAI21X1 U69 ( .A(n8), .B(n71), .C(n76), .Y(n104) );
  NAND2X1 U70 ( .A(count_out[5]), .B(n1), .Y(n76) );
  OAI21X1 U71 ( .A(n9), .B(n71), .C(n77), .Y(n105) );
  NAND2X1 U72 ( .A(count_out[4]), .B(n1), .Y(n77) );
  OAI21X1 U73 ( .A(n10), .B(n71), .C(n78), .Y(n106) );
  NAND2X1 U74 ( .A(count_out[3]), .B(n1), .Y(n78) );
  OAI21X1 U75 ( .A(n22), .B(n71), .C(n79), .Y(n107) );
  NAND2X1 U76 ( .A(count_out[2]), .B(n1), .Y(n79) );
  OAI21X1 U77 ( .A(n23), .B(n71), .C(n80), .Y(n108) );
  NAND2X1 U78 ( .A(count_out[1]), .B(n1), .Y(n80) );
  NAND2X1 U79 ( .A(n46), .B(n62), .Y(n71) );
  OAI21X1 U80 ( .A(n50), .B(n31), .C(n81), .Y(n109) );
  NAND2X1 U81 ( .A(count_out[0]), .B(n1), .Y(n81) );
  NOR2X1 U82 ( .A(n1), .B(clear), .Y(n46) );
  NOR2X1 U83 ( .A(clear), .B(count_enable), .Y(n44) );
  NOR2X1 U84 ( .A(N4), .B(n2), .Y(n50) );
  NAND3X1 U85 ( .A(n82), .B(n83), .C(n84), .Y(n62) );
  NOR2X1 U86 ( .A(n85), .B(n86), .Y(n84) );
  NAND3X1 U87 ( .A(n87), .B(n88), .C(n89), .Y(n86) );
  XNOR2X1 U88 ( .A(N7), .B(N17), .Y(n89) );
  XNOR2X1 U89 ( .A(N12), .B(N22), .Y(n88) );
  XNOR2X1 U90 ( .A(N9), .B(N19), .Y(n87) );
  NAND2X1 U91 ( .A(n90), .B(n91), .Y(n85) );
  XNOR2X1 U92 ( .A(N13), .B(N23), .Y(n91) );
  NOR2X1 U93 ( .A(N24), .B(n92), .Y(n90) );
  XNOR2X1 U94 ( .A(N21), .B(n6), .Y(n92) );
  NOR2X1 U95 ( .A(n93), .B(n94), .Y(n83) );
  NAND2X1 U96 ( .A(n95), .B(n96), .Y(n94) );
  XNOR2X1 U97 ( .A(N8), .B(N18), .Y(n96) );
  XNOR2X1 U98 ( .A(N10), .B(N20), .Y(n95) );
  XNOR2X1 U99 ( .A(n22), .B(N16), .Y(n93) );
  NOR2X1 U100 ( .A(n97), .B(n98), .Y(n82) );
  XNOR2X1 U101 ( .A(count_out[0]), .B(N14), .Y(n98) );
  XNOR2X1 U102 ( .A(n23), .B(N15), .Y(n97) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_48 ( .A({1'b0, rollover_val}), 
        .SUM({N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14}) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_1 add_46 ( .A(count_out), .SUM({N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4}) );
  BUFX2 U16 ( .A(n44), .Y(n1) );
  INVX2 U17 ( .A(n62), .Y(n2) );
  INVX2 U18 ( .A(N13), .Y(n3) );
  INVX2 U19 ( .A(N12), .Y(n4) );
  INVX2 U20 ( .A(N11), .Y(n6) );
  INVX2 U21 ( .A(N10), .Y(n7) );
  INVX2 U22 ( .A(N9), .Y(n8) );
  INVX2 U23 ( .A(N8), .Y(n9) );
  INVX2 U24 ( .A(N7), .Y(n10) );
  INVX2 U25 ( .A(N6), .Y(n22) );
  INVX2 U26 ( .A(N5), .Y(n23) );
  INVX2 U27 ( .A(rollover_val[5]), .Y(n24) );
  INVX2 U28 ( .A(rollover_val[6]), .Y(n25) );
  INVX2 U29 ( .A(rollover_val[7]), .Y(n26) );
  INVX2 U30 ( .A(rollover_val[8]), .Y(n27) );
  INVX2 U31 ( .A(rollover_val[9]), .Y(n28) );
  INVX2 U32 ( .A(rollover_val[1]), .Y(n29) );
  INVX2 U33 ( .A(rollover_val[2]), .Y(n30) );
  INVX2 U34 ( .A(n46), .Y(n31) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 COUNT ( .clk(clk), .n_rst(n_reset), 
        .count_enable(cnt_up), .clear(clear), .rollover_val({1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        one_k_samples) );
endmodule


module magnitude_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n1, n2;

  AOI22X1 U19 ( .A(n2), .B(N11), .C(in[9]), .D(n1), .Y(n18) );
  AOI22X1 U20 ( .A(N10), .B(in[16]), .C(in[8]), .D(n1), .Y(n19) );
  AOI22X1 U21 ( .A(N9), .B(in[16]), .C(in[7]), .D(n1), .Y(n20) );
  AOI22X1 U22 ( .A(N8), .B(in[16]), .C(in[6]), .D(n1), .Y(n21) );
  AOI22X1 U23 ( .A(N7), .B(in[16]), .C(in[5]), .D(n1), .Y(n22) );
  AOI22X1 U24 ( .A(N6), .B(n2), .C(in[4]), .D(n1), .Y(n23) );
  AOI22X1 U25 ( .A(N5), .B(in[16]), .C(in[3]), .D(n1), .Y(n24) );
  AOI22X1 U26 ( .A(N4), .B(n2), .C(in[2]), .D(n1), .Y(n25) );
  AOI22X1 U27 ( .A(N3), .B(n2), .C(in[1]), .D(n1), .Y(n26) );
  AOI22X1 U28 ( .A(N17), .B(n2), .C(in[15]), .D(n1), .Y(n27) );
  AOI22X1 U29 ( .A(N16), .B(n2), .C(in[14]), .D(n1), .Y(n28) );
  AOI22X1 U30 ( .A(N15), .B(n2), .C(in[13]), .D(n1), .Y(n29) );
  AOI22X1 U31 ( .A(N14), .B(n2), .C(in[12]), .D(n1), .Y(n30) );
  AOI22X1 U32 ( .A(N13), .B(n2), .C(in[11]), .D(n1), .Y(n31) );
  AOI22X1 U33 ( .A(N12), .B(n2), .C(in[10]), .D(n1), .Y(n32) );
  AOI22X1 U34 ( .A(N2), .B(n2), .C(in[0]), .D(n1), .Y(n33) );
  magnitude_DW01_inc_0 add_37 ( .A(in[15:0]), .SUM({N17, N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  INVX2 U4 ( .A(n33), .Y(out[0]) );
  INVX2 U5 ( .A(n32), .Y(out[10]) );
  INVX2 U6 ( .A(n31), .Y(out[11]) );
  INVX2 U7 ( .A(n30), .Y(out[12]) );
  INVX2 U8 ( .A(n29), .Y(out[13]) );
  INVX2 U9 ( .A(n28), .Y(out[14]) );
  INVX2 U10 ( .A(n27), .Y(out[15]) );
  INVX2 U11 ( .A(n26), .Y(out[1]) );
  INVX2 U12 ( .A(n25), .Y(out[2]) );
  INVX2 U13 ( .A(n24), .Y(out[3]) );
  INVX2 U14 ( .A(n23), .Y(out[4]) );
  INVX2 U15 ( .A(n22), .Y(out[5]) );
  INVX2 U16 ( .A(n21), .Y(out[6]) );
  INVX2 U17 ( .A(n20), .Y(out[7]) );
  INVX2 U18 ( .A(n19), .Y(out[8]) );
  INVX2 U35 ( .A(n18), .Y(out[9]) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n92, n93, n152, n153, n154,
         n155, n156, n157, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176;

  FAX1 U3 ( .A(A[15]), .B(B[15]), .C(n76), .YC(n17), .YS(SUM[15]) );
  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n175), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n175), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n26), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n24) );
  NAND2X1 U18 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n31), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n174), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n174), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2X1 U32 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n173), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n173), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n42), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n40) );
  NAND2X1 U46 ( .A(A[9]), .B(B[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n153), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n170), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n170), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2X1 U60 ( .A(A[7]), .B(B[7]), .Y(n49) );
  AOI21X1 U62 ( .A(n172), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n172), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n56) );
  NAND2X1 U74 ( .A(A[5]), .B(B[5]), .Y(n57) );
  AOI21X1 U76 ( .A(n171), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n171), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n165), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U88 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n169), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n169), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n168), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n157), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U102 ( .A(A[1]), .B(B[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  OR2X1 U113 ( .A(A[2]), .B(B[2]), .Y(n169) );
  OR2X1 U114 ( .A(A[8]), .B(B[8]), .Y(n170) );
  BUFX2 U115 ( .A(n63), .Y(n152) );
  BUFX2 U116 ( .A(n47), .Y(n153) );
  NAND2X1 U117 ( .A(n76), .B(A[15]), .Y(n154) );
  NAND2X1 U118 ( .A(n76), .B(B[15]), .Y(n155) );
  NAND2X1 U119 ( .A(A[15]), .B(B[15]), .Y(n156) );
  NAND3X1 U120 ( .A(n155), .B(n154), .C(n156), .Y(n163) );
  OR2X2 U121 ( .A(A[1]), .B(B[1]), .Y(n157) );
  AND2X2 U122 ( .A(n168), .B(n176), .Y(SUM[0]) );
  OR2X1 U123 ( .A(A[0]), .B(B[0]), .Y(n176) );
  XOR2X1 U124 ( .A(n93), .B(n92), .Y(n159) );
  XOR2X1 U125 ( .A(n164), .B(n159), .Y(SUM[16]) );
  NAND2X1 U126 ( .A(n17), .B(n93), .Y(n160) );
  NAND2X1 U127 ( .A(n163), .B(n92), .Y(n161) );
  NAND2X1 U128 ( .A(n93), .B(n92), .Y(n162) );
  NAND3X1 U129 ( .A(n161), .B(n160), .C(n162), .Y(n16) );
  FAX1 U130 ( .A(A[15]), .B(B[15]), .C(n76), .YC(n164) );
  BUFX2 U131 ( .A(n66), .Y(n165) );
  BUFX2 U132 ( .A(n58), .Y(n166) );
  BUFX2 U133 ( .A(n34), .Y(n167) );
  INVX4 U134 ( .A(n18), .Y(n76) );
  OR2X2 U135 ( .A(A[10]), .B(B[10]), .Y(n173) );
  NAND2X1 U136 ( .A(A[0]), .B(B[0]), .Y(n168) );
  OR2X2 U137 ( .A(A[14]), .B(B[14]), .Y(n175) );
  INVX1 U138 ( .A(n56), .Y(n86) );
  XOR2X1 U139 ( .A(n167), .B(n4), .Y(SUM[11]) );
  XNOR2X1 U140 ( .A(n152), .B(n11), .Y(SUM[4]) );
  XNOR2X1 U141 ( .A(n55), .B(n9), .Y(SUM[6]) );
  XOR2X1 U142 ( .A(n166), .B(n10), .Y(SUM[5]) );
  OR2X2 U143 ( .A(A[12]), .B(B[12]), .Y(n174) );
  OR2X1 U144 ( .A(A[4]), .B(B[4]), .Y(n171) );
  OR2X1 U145 ( .A(A[6]), .B(B[6]), .Y(n172) );
  INVX2 U146 ( .A(A[17]), .Y(n93) );
  INVX2 U147 ( .A(B[17]), .Y(n92) );
  INVX2 U148 ( .A(n64), .Y(n88) );
  INVX2 U149 ( .A(n48), .Y(n84) );
  INVX2 U150 ( .A(n40), .Y(n82) );
  INVX2 U151 ( .A(n32), .Y(n80) );
  INVX2 U152 ( .A(n24), .Y(n78) );
  INVX2 U153 ( .A(n70), .Y(n68) );
  INVX2 U154 ( .A(n62), .Y(n60) );
  INVX2 U155 ( .A(n54), .Y(n52) );
  INVX2 U156 ( .A(n46), .Y(n44) );
  INVX2 U157 ( .A(n38), .Y(n36) );
  INVX2 U158 ( .A(n30), .Y(n28) );
  INVX2 U159 ( .A(n22), .Y(n20) );
  INVX2 U160 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n9, n12, n13, n19, n24, n25, n31, n37, n49, n51, n52, n53,
         n56, n57, n60, n61, n63, n64, n65, n66, n67, n68, n69, n70, n72, n73,
         n74, n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n109, n111, n112, n113, n114, n115,
         n116, n120, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n133, n134, n135, n136, n137, n140, n142, n144, n145, n146, n147,
         n148, n149, n151, n154, n155, n156, n159, n160, n161, n162, n163,
         n164, n165, n166, n169, n170, n171, n172, n173, n174, n177, n178,
         n179, n181, n182, n183, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n197, n198, n199, n200, n201, n202, n205, n206,
         n207, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n248, n249, n250, n251, n256,
         n257, n258, n259, n264, n265, n266, n267, n275, n279, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n545, n548, n551, n554, n555,
         n558, n560, n563, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n728, n730, n731,
         n732, n733, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n893,
         n894, n897, n898, n899, n900, n917, n918, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268,
         n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278,
         n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288,
         n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298,
         n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328,
         n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1306), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1240), .B(n1272), .Y(n74) );
  OAI21X1 U62 ( .A(n52), .B(n1240), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1306), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n1162), .B(n89), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1270), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1306), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1162), .Y(n96) );
  OAI21X1 U90 ( .A(n1271), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n130), .B(n106), .Y(n104) );
  OAI21X1 U98 ( .A(n1078), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1245), .B(n1059), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1245), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1245), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  AOI21X1 U108 ( .A(n1127), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n1272), .B(n115), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1270), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1059), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1059), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  AOI21X1 U122 ( .A(n1306), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1162), .Y(n124) );
  OAI21X1 U124 ( .A(n1271), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n137), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1306), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n137), .B(n1272), .Y(n135) );
  OAI21X1 U138 ( .A(n1270), .B(n137), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1241), .B(n1128), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1241), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1241), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1127), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1162), .Y(n146) );
  OAI21X1 U152 ( .A(n1270), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1128), .Y(n61) );
  NAND2X1 U160 ( .A(n330), .B(n339), .Y(n149) );
  AOI21X1 U162 ( .A(n155), .B(n1306), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n171), .B(n159), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n166), .B(n161), .Y(n159) );
  OAI21X1 U168 ( .A(n169), .B(n161), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n349), .B(n340), .Y(n161) );
  NAND2X1 U172 ( .A(n349), .B(n340), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1306), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n166), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n166), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n361), .B(n350), .Y(n166) );
  NAND2X1 U182 ( .A(n361), .B(n350), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1006), .B(n1306), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1127), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1306), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n187), .B(n200), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n189), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1004), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n194), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n205), .B(n210), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n997), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n999), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n1113), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1248), .B(n1242), .Y(n223) );
  AOI21X1 U258 ( .A(n1247), .B(n1242), .C(n1243), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1246), .B(n248), .C(n1244), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1250), .C(n1253), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1251), .C(n1249), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1255), .B(n1252), .C(n1254), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n601), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n310), .C(n315), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n587), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n619), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n637), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U329 ( .A(n345), .B(n336), .C(n334), .YC(n331), .YS(n332) );
  FAX1 U330 ( .A(n622), .B(n606), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n353), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n591), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n655), .YC(n347), .YS(n348) );
  FAX1 U340 ( .A(n371), .B(n369), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U344 ( .A(n366), .B(n375), .C(n364), .YC(n361), .YS(n362) );
  FAX1 U345 ( .A(n368), .B(n1077), .C(n377), .YC(n363), .YS(n364) );
  FAX1 U346 ( .A(n383), .B(n381), .C(n370), .YC(n365), .YS(n366) );
  FAX1 U347 ( .A(n625), .B(n593), .C(n372), .YC(n367), .YS(n368) );
  FAX1 U348 ( .A(n609), .B(n657), .C(n641), .YC(n369), .YS(n370) );
  FAX1 U349 ( .A(n385), .B(n578), .C(n1288), .YC(n371), .YS(n372) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n386), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U361 ( .A(n659), .B(n627), .C(n643), .YC(n395), .YS(n396) );
  FAX1 U363 ( .A(n579), .B(n709), .C(n691), .YC(n399), .YS(n400) );
  FAX1 U366 ( .A(n423), .B(n410), .C(n412), .YC(n405), .YS(n406) );
  FAX1 U368 ( .A(n660), .B(n612), .C(n644), .YC(n409), .YS(n410) );
  FAX1 U369 ( .A(n628), .B(n676), .C(n596), .YC(n411), .YS(n412) );
  FAX1 U370 ( .A(n692), .B(n580), .C(n563), .YC(n413), .YS(n414) );
  FAX1 U375 ( .A(n661), .B(n613), .C(n645), .YC(n423), .YS(n424) );
  FAX1 U377 ( .A(n563), .B(n581), .C(n693), .YC(n427), .YS(n428) );
  FAX1 U383 ( .A(n614), .B(n598), .C(n678), .YC(n439), .YS(n440) );
  FAX1 U385 ( .A(n448), .B(n459), .C(n446), .YC(n443), .YS(n444) );
  FAX1 U389 ( .A(n679), .B(n631), .C(n565), .YC(n451), .YS(n452) );
  FAX1 U390 ( .A(n647), .B(n695), .C(n599), .YC(n453), .YS(n454) );
  HAX1 U391 ( .A(n711), .B(n615), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n712), .B(n648), .C(n664), .YC(n465), .YS(n466) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U407 ( .A(n714), .B(n666), .C(n682), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n618), .B(n650), .C(n634), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n996), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  HAX1 U413 ( .A(n651), .B(n715), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U417 ( .A(n636), .B(n668), .C(n652), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n686), .C(n670), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n720), .C(n688), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1333), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1331), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n728), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1327), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n730), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n731), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n732), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n733), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1318), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n1314), .Y(n578) );
  NOR2X1 U445 ( .A(n918), .B(n1312), .Y(n385) );
  NOR2X1 U446 ( .A(n918), .B(n1311), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n1309), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1057), .Y(n581) );
  OAI22X1 U466 ( .A(n918), .B(n1304), .C(n1235), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1235), .C(n1276), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1276), .B(n742), .C(n1235), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1276), .B(n743), .C(n1235), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1304), .B(n744), .C(n1235), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1278), .B(n745), .C(n1234), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1278), .B(n746), .C(n1235), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1278), .B(n747), .C(n1235), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1278), .B(n748), .C(n1235), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1304), .B(n749), .C(n1235), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1278), .B(n750), .C(n1235), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1304), .B(n751), .C(n1235), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n752), .B(n1304), .C(n1234), .D(n751), .Y(n595) );
  OAI22X1 U482 ( .A(n1304), .B(n754), .C(n1235), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1304), .B(n755), .C(n1235), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1235), .B(n755), .C(n1304), .D(n756), .Y(n599) );
  XNOR2X1 U487 ( .A(n1334), .B(n1336), .Y(n741) );
  XNOR2X1 U488 ( .A(n1153), .B(n1237), .Y(n742) );
  XNOR2X1 U489 ( .A(n1330), .B(n1236), .Y(n743) );
  XNOR2X1 U490 ( .A(n1328), .B(n1336), .Y(n744) );
  XNOR2X1 U491 ( .A(n1326), .B(n1236), .Y(n745) );
  XNOR2X1 U492 ( .A(n1324), .B(n1336), .Y(n746) );
  XNOR2X1 U493 ( .A(n1188), .B(n1237), .Y(n747) );
  XNOR2X1 U494 ( .A(n1321), .B(n1237), .Y(n748) );
  XNOR2X1 U495 ( .A(n1319), .B(n1236), .Y(n749) );
  XNOR2X1 U496 ( .A(n1317), .B(n1336), .Y(n750) );
  XNOR2X1 U497 ( .A(n1315), .B(n1237), .Y(n751) );
  XNOR2X1 U498 ( .A(n1313), .B(n1336), .Y(n752) );
  XNOR2X1 U500 ( .A(n1310), .B(n1236), .Y(n754) );
  XNOR2X1 U502 ( .A(n1226), .B(n1237), .Y(n756) );
  OR2X1 U503 ( .A(n1226), .B(n918), .Y(n757) );
  OAI22X1 U505 ( .A(n1130), .B(n1281), .C(n1303), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1130), .B(n1280), .C(n1183), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1183), .B(n759), .C(n1280), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1183), .B(n760), .C(n1303), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1183), .B(n761), .C(n1280), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1282), .B(n762), .C(n1303), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1282), .B(n763), .C(n1280), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1282), .B(n764), .C(n1303), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1281), .B(n765), .C(n1280), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1281), .B(n766), .C(n1303), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1281), .B(n767), .C(n1280), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1281), .B(n768), .C(n1303), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1281), .B(n769), .C(n1280), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1281), .B(n770), .C(n1303), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1281), .B(n771), .C(n1280), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1281), .B(n772), .C(n1303), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1280), .B(n772), .C(n1281), .D(n773), .Y(n617) );
  XNOR2X1 U526 ( .A(n1334), .B(n1351), .Y(n758) );
  XNOR2X1 U527 ( .A(n1153), .B(n1351), .Y(n759) );
  XNOR2X1 U528 ( .A(n1330), .B(n1351), .Y(n760) );
  XNOR2X1 U529 ( .A(n1328), .B(n1351), .Y(n761) );
  XNOR2X1 U530 ( .A(n1326), .B(n1351), .Y(n762) );
  XNOR2X1 U531 ( .A(n1324), .B(n1351), .Y(n763) );
  XNOR2X1 U532 ( .A(n1187), .B(n1351), .Y(n764) );
  XNOR2X1 U533 ( .A(n1321), .B(n1351), .Y(n765) );
  XNOR2X1 U534 ( .A(n1319), .B(n1351), .Y(n766) );
  XNOR2X1 U535 ( .A(n1317), .B(n1351), .Y(n767) );
  XNOR2X1 U536 ( .A(n1315), .B(n1351), .Y(n768) );
  XNOR2X1 U537 ( .A(n1313), .B(n1351), .Y(n769) );
  XNOR2X1 U538 ( .A(n1274), .B(n1351), .Y(n770) );
  XNOR2X1 U539 ( .A(n1310), .B(n1351), .Y(n771) );
  XNOR2X1 U540 ( .A(n1308), .B(n1351), .Y(n772) );
  XNOR2X1 U541 ( .A(n1228), .B(n1351), .Y(n773) );
  OR2X1 U542 ( .A(n1227), .B(n1130), .Y(n774) );
  OAI22X1 U544 ( .A(n1350), .B(n1301), .C(n1267), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1350), .B(n1267), .C(n1301), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1301), .B(n776), .C(n1267), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1301), .B(n777), .C(n1267), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1301), .B(n778), .C(n1267), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1301), .B(n779), .C(n1267), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1301), .B(n780), .C(n1267), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1301), .B(n781), .C(n1267), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1302), .B(n782), .C(n1267), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1302), .B(n783), .C(n1267), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1302), .B(n784), .C(n1267), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1302), .B(n785), .C(n1267), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n786), .B(n1302), .C(n1267), .D(n785), .Y(n631) );
  OAI22X1 U560 ( .A(n1302), .B(n788), .C(n1267), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1302), .B(n789), .C(n1267), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1267), .B(n789), .C(n1301), .D(n790), .Y(n635) );
  XNOR2X1 U565 ( .A(n1334), .B(n1349), .Y(n775) );
  XNOR2X1 U566 ( .A(n1153), .B(n1349), .Y(n776) );
  XNOR2X1 U567 ( .A(n1330), .B(n1349), .Y(n777) );
  XNOR2X1 U568 ( .A(n1328), .B(n1349), .Y(n778) );
  XNOR2X1 U569 ( .A(n1326), .B(n1349), .Y(n779) );
  XNOR2X1 U570 ( .A(n1324), .B(n1349), .Y(n780) );
  XNOR2X1 U571 ( .A(n1188), .B(n1349), .Y(n781) );
  XNOR2X1 U572 ( .A(n1321), .B(n1349), .Y(n782) );
  XNOR2X1 U573 ( .A(n1319), .B(n1349), .Y(n783) );
  XNOR2X1 U577 ( .A(n1274), .B(n1349), .Y(n787) );
  XNOR2X1 U578 ( .A(n1310), .B(n1349), .Y(n788) );
  XNOR2X1 U579 ( .A(n1308), .B(n1349), .Y(n789) );
  XNOR2X1 U580 ( .A(n1228), .B(n1349), .Y(n790) );
  OR2X1 U581 ( .A(n1228), .B(n1350), .Y(n791) );
  OAI22X1 U583 ( .A(n1348), .B(n1300), .C(n1179), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1348), .B(n1179), .C(n1300), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1300), .B(n793), .C(n1179), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1300), .B(n794), .C(n1179), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1300), .B(n795), .C(n1179), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1300), .B(n796), .C(n1179), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1300), .B(n797), .C(n1179), .D(n796), .Y(n643) );
  OAI22X1 U592 ( .A(n1300), .B(n798), .C(n1179), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1300), .B(n799), .C(n1179), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1300), .B(n800), .C(n1179), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1300), .B(n801), .C(n1179), .D(n800), .Y(n647) );
  OAI22X1 U596 ( .A(n1300), .B(n802), .C(n1179), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1300), .B(n803), .C(n1179), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1300), .B(n804), .C(n1179), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1300), .B(n805), .C(n1179), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1300), .B(n806), .C(n1179), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1179), .B(n806), .C(n1300), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1227), .B(n1178), .Y(n654) );
  XNOR2X1 U604 ( .A(n1334), .B(n1347), .Y(n792) );
  XNOR2X1 U605 ( .A(n1153), .B(n1347), .Y(n793) );
  XNOR2X1 U606 ( .A(n1330), .B(n1347), .Y(n794) );
  XNOR2X1 U607 ( .A(n1328), .B(n1346), .Y(n795) );
  XNOR2X1 U608 ( .A(n1326), .B(n1346), .Y(n796) );
  XNOR2X1 U609 ( .A(n1324), .B(n1346), .Y(n797) );
  XNOR2X1 U610 ( .A(n1187), .B(n1346), .Y(n798) );
  XNOR2X1 U611 ( .A(n1321), .B(n1346), .Y(n799) );
  XNOR2X1 U612 ( .A(n1319), .B(n1347), .Y(n800) );
  XNOR2X1 U614 ( .A(n1315), .B(n1346), .Y(n802) );
  XNOR2X1 U615 ( .A(n1313), .B(n1346), .Y(n803) );
  XNOR2X1 U616 ( .A(n1274), .B(n1346), .Y(n804) );
  XNOR2X1 U617 ( .A(n1310), .B(n1346), .Y(n805) );
  XNOR2X1 U618 ( .A(n1308), .B(n1346), .Y(n806) );
  XNOR2X1 U619 ( .A(n1227), .B(n1346), .Y(n807) );
  OR2X1 U620 ( .A(n1228), .B(n1348), .Y(n808) );
  OAI22X1 U622 ( .A(n1181), .B(n1156), .C(n1296), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1181), .B(n1296), .C(n1156), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1299), .B(n810), .C(n1296), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1299), .B(n811), .C(n1296), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1299), .B(n812), .C(n1296), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1156), .B(n813), .C(n1296), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n1299), .B(n814), .C(n1296), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n1152), .B(n815), .C(n1296), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1156), .B(n816), .C(n1296), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n1299), .B(n817), .C(n1296), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1299), .B(n818), .C(n1296), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1299), .B(n819), .C(n1296), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1156), .B(n820), .C(n1296), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1156), .B(n821), .C(n1296), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1299), .B(n822), .C(n1296), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1152), .B(n823), .C(n1296), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1296), .B(n823), .C(n1156), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1227), .B(n555), .Y(n672) );
  XNOR2X1 U643 ( .A(n1334), .B(n1275), .Y(n809) );
  XNOR2X1 U644 ( .A(n1332), .B(n1275), .Y(n810) );
  XNOR2X1 U645 ( .A(n1330), .B(n1275), .Y(n811) );
  XNOR2X1 U646 ( .A(n1328), .B(n1147), .Y(n812) );
  XNOR2X1 U647 ( .A(n1326), .B(n1148), .Y(n813) );
  XNOR2X1 U648 ( .A(n1324), .B(n1147), .Y(n814) );
  XNOR2X1 U649 ( .A(n1187), .B(n1147), .Y(n815) );
  XNOR2X1 U650 ( .A(n1321), .B(n1148), .Y(n816) );
  XNOR2X1 U651 ( .A(n1319), .B(n1149), .Y(n817) );
  XNOR2X1 U652 ( .A(n1317), .B(n1149), .Y(n818) );
  XNOR2X1 U653 ( .A(n1315), .B(n1149), .Y(n819) );
  XNOR2X1 U654 ( .A(n1313), .B(n1149), .Y(n820) );
  XNOR2X1 U655 ( .A(n1274), .B(n1148), .Y(n821) );
  XNOR2X1 U656 ( .A(n1310), .B(n1148), .Y(n822) );
  XNOR2X1 U657 ( .A(n1308), .B(n1149), .Y(n823) );
  XNOR2X1 U658 ( .A(n1227), .B(n1148), .Y(n824) );
  OR2X1 U659 ( .A(n1228), .B(n1181), .Y(n825) );
  OAI22X1 U661 ( .A(n1344), .B(n1155), .C(n1294), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1344), .B(n1294), .C(n1295), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1295), .B(n827), .C(n1294), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1295), .B(n828), .C(n1294), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1151), .B(n829), .C(n1294), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1131), .B(n830), .C(n1294), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n831), .B(n1295), .C(n1294), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1151), .B(n832), .C(n1294), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1295), .B(n833), .C(n1294), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1131), .B(n834), .C(n1294), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1131), .B(n835), .C(n1294), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1131), .B(n836), .C(n1294), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1131), .B(n837), .C(n1294), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1131), .B(n838), .C(n1294), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1151), .B(n839), .C(n1294), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1151), .B(n840), .C(n1294), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1294), .B(n840), .C(n1155), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1227), .B(n558), .Y(n690) );
  XNOR2X1 U682 ( .A(n1334), .B(n1343), .Y(n826) );
  XNOR2X1 U683 ( .A(n1332), .B(n1343), .Y(n827) );
  XNOR2X1 U684 ( .A(n1330), .B(n1343), .Y(n828) );
  XNOR2X1 U685 ( .A(n1328), .B(n1343), .Y(n829) );
  XNOR2X1 U686 ( .A(n1326), .B(n1343), .Y(n830) );
  XNOR2X1 U687 ( .A(n1324), .B(n1343), .Y(n831) );
  XNOR2X1 U688 ( .A(n1188), .B(n1343), .Y(n832) );
  XNOR2X1 U689 ( .A(n1321), .B(n1343), .Y(n833) );
  XNOR2X1 U690 ( .A(n1319), .B(n1343), .Y(n834) );
  XNOR2X1 U691 ( .A(n1317), .B(n1343), .Y(n835) );
  XNOR2X1 U692 ( .A(n1315), .B(n1343), .Y(n836) );
  XNOR2X1 U693 ( .A(n1313), .B(n1343), .Y(n837) );
  XNOR2X1 U694 ( .A(n1274), .B(n1343), .Y(n838) );
  XNOR2X1 U695 ( .A(n1310), .B(n1343), .Y(n839) );
  XNOR2X1 U696 ( .A(n1308), .B(n1343), .Y(n840) );
  XNOR2X1 U697 ( .A(n1227), .B(n1343), .Y(n841) );
  OR2X1 U698 ( .A(n1228), .B(n1344), .Y(n842) );
  OAI22X1 U700 ( .A(n1206), .B(n1265), .C(n1154), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1206), .B(n1283), .C(n1180), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n844), .B(n1180), .C(n1283), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n845), .B(n1142), .C(n1283), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1142), .B(n846), .C(n1283), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1265), .B(n847), .C(n1283), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1265), .B(n848), .C(n1154), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1265), .B(n849), .C(n1154), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1265), .B(n850), .C(n1283), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1265), .B(n851), .C(n1283), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1265), .B(n852), .C(n1154), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1265), .B(n853), .C(n1154), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1265), .B(n854), .C(n1283), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1265), .B(n855), .C(n1154), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1265), .B(n856), .C(n1154), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1265), .B(n857), .C(n1154), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1154), .B(n857), .C(n1265), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1228), .B(n1293), .Y(n708) );
  XNOR2X1 U722 ( .A(n1332), .B(n1214), .Y(n844) );
  XNOR2X1 U723 ( .A(n1330), .B(n1214), .Y(n845) );
  XNOR2X1 U724 ( .A(n1328), .B(n1341), .Y(n846) );
  XNOR2X1 U725 ( .A(n1326), .B(n1341), .Y(n847) );
  XNOR2X1 U726 ( .A(n1324), .B(n1214), .Y(n848) );
  XNOR2X1 U727 ( .A(n1187), .B(n1341), .Y(n849) );
  XNOR2X1 U728 ( .A(n1321), .B(n1214), .Y(n850) );
  XNOR2X1 U729 ( .A(n1319), .B(n1341), .Y(n851) );
  XNOR2X1 U730 ( .A(n1317), .B(n1214), .Y(n852) );
  XNOR2X1 U731 ( .A(n1315), .B(n1214), .Y(n853) );
  XNOR2X1 U732 ( .A(n1185), .B(n1341), .Y(n854) );
  XNOR2X1 U733 ( .A(n1274), .B(n1341), .Y(n855) );
  XNOR2X1 U734 ( .A(n1310), .B(n1214), .Y(n856) );
  XNOR2X1 U735 ( .A(n1308), .B(n1214), .Y(n857) );
  XNOR2X1 U736 ( .A(n1228), .B(n1341), .Y(n858) );
  OR2X1 U737 ( .A(n1228), .B(n1206), .Y(n859) );
  OAI22X1 U739 ( .A(n1182), .B(n1291), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n1182), .C(n1292), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1292), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1291), .B(n862), .C(n917), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1292), .B(n863), .C(n917), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1291), .B(n864), .C(n917), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1292), .B(n865), .C(n917), .D(n864), .Y(n715) );
  OAI22X1 U749 ( .A(n1291), .B(n867), .C(n917), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1292), .B(n868), .C(n917), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1291), .B(n869), .C(n917), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1292), .B(n870), .C(n917), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1291), .B(n871), .C(n917), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1292), .B(n872), .C(n917), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1291), .B(n873), .C(n917), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1292), .B(n874), .C(n917), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1292), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1334), .B(n1339), .Y(n860) );
  XNOR2X1 U759 ( .A(n1332), .B(n1145), .Y(n861) );
  XNOR2X1 U760 ( .A(n1330), .B(n1339), .Y(n862) );
  XNOR2X1 U761 ( .A(n1328), .B(n1145), .Y(n863) );
  XNOR2X1 U762 ( .A(n1326), .B(n1339), .Y(n864) );
  XNOR2X1 U763 ( .A(n1324), .B(n1339), .Y(n865) );
  XNOR2X1 U764 ( .A(n1188), .B(n1269), .Y(n866) );
  XNOR2X1 U765 ( .A(n1321), .B(n1268), .Y(n867) );
  XNOR2X1 U766 ( .A(n1319), .B(n1268), .Y(n868) );
  XNOR2X1 U767 ( .A(n1317), .B(n1269), .Y(n869) );
  XNOR2X1 U768 ( .A(n1315), .B(n1268), .Y(n870) );
  XNOR2X1 U769 ( .A(n1185), .B(n1269), .Y(n871) );
  XNOR2X1 U770 ( .A(n1274), .B(n1269), .Y(n872) );
  XNOR2X1 U771 ( .A(n1310), .B(n1268), .Y(n873) );
  XNOR2X1 U772 ( .A(n1308), .B(n1269), .Y(n874) );
  XNOR2X1 U773 ( .A(n1227), .B(n1268), .Y(n875) );
  OR2X1 U774 ( .A(n1227), .B(n1182), .Y(n876) );
  XOR2X1 U805 ( .A(n1186), .B(a[27]), .Y(n894) );
  NAND2X1 U813 ( .A(n897), .B(n1297), .Y(n24) );
  NAND2X1 U819 ( .A(n9), .B(n899), .Y(n12) );
  INVX8 U828 ( .A(n1320), .Y(n1321) );
  INVX8 U829 ( .A(n1178), .Y(n1179) );
  BUFX4 U830 ( .A(n1338), .Y(n1269) );
  INVX2 U831 ( .A(n1182), .Y(n1338) );
  INVX4 U832 ( .A(n563), .Y(n709) );
  BUFX4 U833 ( .A(n363), .Y(n995) );
  INVX8 U834 ( .A(n1342), .Y(n1214) );
  BUFX4 U835 ( .A(n1338), .Y(n1268) );
  BUFX4 U836 ( .A(n1307), .Y(n1057) );
  BUFX4 U837 ( .A(n503), .Y(n996) );
  INVX8 U838 ( .A(n1311), .Y(n1274) );
  INVX4 U839 ( .A(n889), .Y(n1311) );
  BUFX2 U840 ( .A(n1189), .Y(n1147) );
  BUFX2 U841 ( .A(n37), .Y(n1186) );
  INVX2 U842 ( .A(n407), .Y(n1016) );
  INVX4 U843 ( .A(n541), .Y(n1335) );
  BUFX2 U844 ( .A(n453), .Y(n1266) );
  BUFX2 U845 ( .A(n428), .Y(n1264) );
  INVX2 U846 ( .A(n883), .Y(n1322) );
  INVX2 U847 ( .A(n888), .Y(n1312) );
  INVX4 U848 ( .A(n1316), .Y(n1317) );
  INVX2 U849 ( .A(n19), .Y(n1345) );
  INVX4 U850 ( .A(n31), .Y(n1350) );
  INVX2 U851 ( .A(n1322), .Y(n1188) );
  INVX2 U852 ( .A(n1322), .Y(n1187) );
  INVX2 U853 ( .A(n882), .Y(n1323) );
  BUFX2 U854 ( .A(n1239), .Y(n1226) );
  INVX4 U855 ( .A(n1327), .Y(n1328) );
  INVX4 U856 ( .A(n1289), .Y(n1294) );
  INVX2 U857 ( .A(n1331), .Y(n1332) );
  BUFX2 U858 ( .A(n1189), .Y(n1148) );
  BUFX2 U859 ( .A(n1189), .Y(n1149) );
  INVX4 U860 ( .A(n1325), .Y(n1326) );
  INVX2 U861 ( .A(n881), .Y(n1325) );
  INVX2 U862 ( .A(n1335), .Y(n1237) );
  INVX2 U863 ( .A(n472), .Y(n1009) );
  INVX2 U864 ( .A(n1257), .Y(n1304) );
  INVX2 U865 ( .A(a[15]), .Y(n917) );
  INVX2 U866 ( .A(n420), .Y(n1005) );
  INVX2 U867 ( .A(n392), .Y(n1215) );
  INVX2 U868 ( .A(n1143), .Y(n1144) );
  BUFX2 U869 ( .A(n477), .Y(n1184) );
  INVX2 U870 ( .A(n879), .Y(n1329) );
  BUFX2 U871 ( .A(n53), .Y(n1272) );
  BUFX2 U872 ( .A(n206), .Y(n997) );
  INVX1 U873 ( .A(n416), .Y(n998) );
  INVX1 U874 ( .A(n998), .Y(n999) );
  OR2X2 U875 ( .A(n1302), .B(n787), .Y(n1118) );
  XOR2X1 U876 ( .A(n480), .B(n487), .Y(n1000) );
  XOR2X1 U877 ( .A(n489), .B(n1000), .Y(n474) );
  NAND2X1 U878 ( .A(n489), .B(n480), .Y(n1001) );
  NAND2X1 U879 ( .A(n489), .B(n487), .Y(n1002) );
  NAND2X1 U880 ( .A(n480), .B(n487), .Y(n1003) );
  NAND3X1 U881 ( .A(n1002), .B(n1001), .C(n1003), .Y(n473) );
  INVX1 U882 ( .A(n100), .Y(n98) );
  INVX2 U883 ( .A(n884), .Y(n1320) );
  XNOR2X1 U884 ( .A(n1316), .B(n1348), .Y(n801) );
  INVX2 U885 ( .A(n287), .Y(n1004) );
  XNOR2X1 U886 ( .A(n431), .B(n1005), .Y(n1037) );
  INVX2 U887 ( .A(n173), .Y(n1006) );
  NAND3X1 U888 ( .A(n1219), .B(n1220), .C(n1221), .Y(n1007) );
  XOR2X1 U889 ( .A(n1057), .B(n1236), .Y(n755) );
  INVX2 U890 ( .A(n1305), .Y(n1127) );
  XNOR2X1 U891 ( .A(n163), .B(n1008), .Y(product[38]) );
  AND2X2 U892 ( .A(n162), .B(n282), .Y(n1008) );
  INVX8 U893 ( .A(n1309), .Y(n1310) );
  XNOR2X1 U894 ( .A(n1191), .B(n1009), .Y(n470) );
  INVX2 U895 ( .A(n483), .Y(n1010) );
  INVX4 U896 ( .A(n1010), .Y(n1011) );
  INVX4 U897 ( .A(n1), .Y(n1182) );
  XOR2X1 U898 ( .A(n445), .B(n434), .Y(n1012) );
  XOR2X1 U899 ( .A(n432), .B(n1012), .Y(n430) );
  NAND2X1 U900 ( .A(n432), .B(n445), .Y(n1013) );
  NAND2X1 U901 ( .A(n432), .B(n434), .Y(n1014) );
  NAND2X1 U902 ( .A(n445), .B(n434), .Y(n1015) );
  NAND3X1 U903 ( .A(n1015), .B(n1013), .C(n1014), .Y(n429) );
  XNOR2X1 U904 ( .A(n394), .B(n1016), .Y(n1217) );
  XOR2X1 U905 ( .A(n675), .B(n595), .Y(n1017) );
  XOR2X1 U906 ( .A(n1017), .B(n611), .Y(n398) );
  NAND2X1 U907 ( .A(n675), .B(n595), .Y(n1018) );
  NAND2X1 U908 ( .A(n675), .B(n611), .Y(n1019) );
  NAND2X1 U909 ( .A(n595), .B(n611), .Y(n1020) );
  NAND3X1 U910 ( .A(n1018), .B(n1019), .C(n1020), .Y(n397) );
  XOR2X1 U911 ( .A(n626), .B(n399), .Y(n1021) );
  XOR2X1 U912 ( .A(n1021), .B(n397), .Y(n380) );
  NAND2X1 U913 ( .A(n626), .B(n399), .Y(n1022) );
  NAND2X1 U914 ( .A(n626), .B(n397), .Y(n1023) );
  NAND2X1 U915 ( .A(n399), .B(n397), .Y(n1024) );
  NAND3X1 U916 ( .A(n1022), .B(n1023), .C(n1024), .Y(n379) );
  XOR2X1 U917 ( .A(n1184), .B(n1144), .Y(n1025) );
  XOR2X1 U918 ( .A(n1025), .B(n466), .Y(n462) );
  NAND2X1 U919 ( .A(n1184), .B(n1144), .Y(n1026) );
  NAND2X1 U920 ( .A(n1184), .B(n466), .Y(n1027) );
  NAND2X1 U921 ( .A(n1144), .B(n466), .Y(n1028) );
  NAND3X1 U922 ( .A(n1026), .B(n1027), .C(n1028), .Y(n461) );
  XOR2X1 U923 ( .A(n463), .B(n450), .Y(n1029) );
  XOR2X1 U924 ( .A(n1029), .B(n461), .Y(n446) );
  NAND2X1 U925 ( .A(n463), .B(n450), .Y(n1030) );
  NAND2X1 U926 ( .A(n463), .B(n461), .Y(n1031) );
  NAND2X1 U927 ( .A(n450), .B(n461), .Y(n1032) );
  NAND3X1 U928 ( .A(n1030), .B(n1031), .C(n1032), .Y(n445) );
  XOR2X1 U929 ( .A(n409), .B(n413), .Y(n1033) );
  XOR2X1 U930 ( .A(n411), .B(n1033), .Y(n394) );
  NAND2X1 U931 ( .A(n411), .B(n409), .Y(n1034) );
  NAND2X1 U932 ( .A(n411), .B(n413), .Y(n1035) );
  NAND2X1 U933 ( .A(n409), .B(n413), .Y(n1036) );
  NAND3X1 U934 ( .A(n1035), .B(n1034), .C(n1036), .Y(n393) );
  XOR2X1 U935 ( .A(n418), .B(n1037), .Y(n416) );
  NAND2X1 U936 ( .A(n418), .B(n431), .Y(n1038) );
  NAND2X1 U937 ( .A(n418), .B(n420), .Y(n1039) );
  NAND2X1 U938 ( .A(n431), .B(n420), .Y(n1040) );
  NAND3X1 U939 ( .A(n1039), .B(n1038), .C(n1040), .Y(n415) );
  XOR2X1 U940 ( .A(n398), .B(n400), .Y(n1041) );
  XOR2X1 U941 ( .A(n1273), .B(n1041), .Y(n392) );
  NAND2X1 U942 ( .A(n1273), .B(n398), .Y(n1042) );
  NAND2X1 U943 ( .A(n1273), .B(n400), .Y(n1043) );
  NAND2X1 U944 ( .A(n398), .B(n400), .Y(n1044) );
  NAND3X1 U945 ( .A(n1043), .B(n1042), .C(n1044), .Y(n391) );
  XOR2X1 U946 ( .A(n1266), .B(n455), .Y(n1045) );
  XOR2X1 U947 ( .A(n451), .B(n1045), .Y(n436) );
  NAND2X1 U948 ( .A(n451), .B(n1266), .Y(n1046) );
  NAND2X1 U949 ( .A(n451), .B(n455), .Y(n1047) );
  NAND2X1 U950 ( .A(n1266), .B(n455), .Y(n1048) );
  NAND3X1 U951 ( .A(n1047), .B(n1046), .C(n1048), .Y(n435) );
  XOR2X1 U952 ( .A(n616), .B(n600), .Y(n1049) );
  XOR2X1 U953 ( .A(n632), .B(n1049), .Y(n468) );
  NAND2X1 U954 ( .A(n632), .B(n616), .Y(n1050) );
  NAND2X1 U955 ( .A(n632), .B(n600), .Y(n1051) );
  NAND2X1 U956 ( .A(n616), .B(n600), .Y(n1052) );
  NAND3X1 U957 ( .A(n1051), .B(n1050), .C(n1052), .Y(n467) );
  XOR2X1 U958 ( .A(n454), .B(n465), .Y(n1053) );
  XOR2X1 U959 ( .A(n1063), .B(n1053), .Y(n448) );
  NAND2X1 U960 ( .A(n1063), .B(n454), .Y(n1054) );
  NAND2X1 U961 ( .A(n1063), .B(n465), .Y(n1055) );
  NAND2X1 U962 ( .A(n454), .B(n465), .Y(n1056) );
  NAND3X1 U963 ( .A(n1055), .B(n1054), .C(n1056), .Y(n447) );
  INVX2 U964 ( .A(n1062), .Y(n1063) );
  INVX1 U965 ( .A(n891), .Y(n1307) );
  INVX2 U966 ( .A(n1064), .Y(n1279) );
  NOR2X1 U967 ( .A(n1112), .B(n1258), .Y(n1058) );
  INVX2 U968 ( .A(n1168), .Y(n1289) );
  INVX2 U969 ( .A(n1182), .Y(n1145) );
  OR2X2 U970 ( .A(n308), .B(n313), .Y(n1059) );
  AND2X2 U971 ( .A(n898), .B(n1168), .Y(n1060) );
  INVX2 U972 ( .A(n1277), .Y(n1178) );
  INVX4 U973 ( .A(n1314), .Y(n1315) );
  INVX4 U974 ( .A(n1318), .Y(n1319) );
  INVX2 U975 ( .A(n885), .Y(n1318) );
  INVX2 U976 ( .A(n1279), .Y(n1280) );
  INVX2 U977 ( .A(n1150), .Y(n1180) );
  INVX2 U978 ( .A(n890), .Y(n1309) );
  INVX2 U979 ( .A(n878), .Y(n1331) );
  OR2X2 U980 ( .A(n292), .B(n293), .Y(n1061) );
  INVX4 U981 ( .A(n1333), .Y(n1334) );
  INVX2 U982 ( .A(n877), .Y(n1333) );
  XNOR2X1 U983 ( .A(n1312), .B(n1350), .Y(n786) );
  INVX2 U984 ( .A(n452), .Y(n1062) );
  BUFX2 U985 ( .A(n1281), .Y(n1183) );
  INVX1 U986 ( .A(n1189), .Y(n1181) );
  XNOR2X1 U987 ( .A(n31), .B(a[27]), .Y(n1064) );
  XNOR2X1 U988 ( .A(n123), .B(n1065), .Y(product[42]) );
  AND2X2 U989 ( .A(n122), .B(n1059), .Y(n1065) );
  BUFX2 U990 ( .A(n49), .Y(n1239) );
  AND2X2 U991 ( .A(n1064), .B(n894), .Y(n1066) );
  XNOR2X1 U992 ( .A(n134), .B(n1067), .Y(product[41]) );
  AND2X2 U993 ( .A(n133), .B(n279), .Y(n1067) );
  INVX4 U994 ( .A(a[19]), .Y(n1256) );
  XOR2X1 U995 ( .A(n662), .B(n630), .Y(n1068) );
  XOR2X1 U996 ( .A(n1068), .B(n646), .Y(n438) );
  NAND2X1 U997 ( .A(n662), .B(n630), .Y(n1069) );
  NAND2X1 U998 ( .A(n662), .B(n646), .Y(n1070) );
  NAND2X1 U999 ( .A(n630), .B(n646), .Y(n1071) );
  NAND3X1 U1000 ( .A(n1069), .B(n1070), .C(n1071), .Y(n437) );
  XOR2X1 U1001 ( .A(n1264), .B(n441), .Y(n1072) );
  XOR2X1 U1002 ( .A(n1072), .B(n437), .Y(n422) );
  NAND2X1 U1003 ( .A(n1264), .B(n441), .Y(n1073) );
  NAND2X1 U1004 ( .A(n1264), .B(n437), .Y(n1074) );
  NAND2X1 U1005 ( .A(n441), .B(n437), .Y(n1075) );
  NAND3X1 U1006 ( .A(n1073), .B(n1074), .C(n1075), .Y(n421) );
  XNOR2X1 U1007 ( .A(n1), .B(a[17]), .Y(n9) );
  INVX2 U1008 ( .A(n1), .Y(n1340) );
  XOR2X1 U1009 ( .A(n1315), .B(n1350), .Y(n785) );
  INVX2 U1010 ( .A(n379), .Y(n1076) );
  INVX4 U1011 ( .A(n1076), .Y(n1077) );
  XOR2X1 U1012 ( .A(n1317), .B(n1350), .Y(n784) );
  NAND2X1 U1013 ( .A(n1245), .B(n1059), .Y(n1078) );
  XOR2X1 U1014 ( .A(n621), .B(n589), .Y(n1079) );
  XOR2X1 U1015 ( .A(n605), .B(n1079), .Y(n326) );
  NAND2X1 U1016 ( .A(n605), .B(n621), .Y(n1080) );
  NAND2X1 U1017 ( .A(n605), .B(n589), .Y(n1081) );
  NAND2X1 U1018 ( .A(n621), .B(n589), .Y(n1082) );
  NAND3X1 U1019 ( .A(n1081), .B(n1080), .C(n1082), .Y(n325) );
  XOR2X1 U1020 ( .A(n694), .B(n582), .Y(n1083) );
  XOR2X1 U1021 ( .A(n710), .B(n1083), .Y(n442) );
  NAND2X1 U1022 ( .A(n710), .B(n694), .Y(n1084) );
  NAND2X1 U1023 ( .A(n710), .B(n582), .Y(n1085) );
  NAND2X1 U1024 ( .A(n694), .B(n582), .Y(n1086) );
  NAND3X1 U1025 ( .A(n1085), .B(n1084), .C(n1086), .Y(n441) );
  XOR2X1 U1026 ( .A(n623), .B(n348), .Y(n1087) );
  XOR2X1 U1027 ( .A(n1087), .B(n357), .Y(n344) );
  XOR2X1 U1028 ( .A(n355), .B(n346), .Y(n1088) );
  XOR2X1 U1029 ( .A(n1088), .B(n344), .Y(n342) );
  NAND2X1 U1030 ( .A(n623), .B(n348), .Y(n1089) );
  NAND2X1 U1031 ( .A(n623), .B(n357), .Y(n1090) );
  NAND2X1 U1032 ( .A(n348), .B(n357), .Y(n1091) );
  NAND3X1 U1033 ( .A(n1089), .B(n1090), .C(n1091), .Y(n343) );
  NAND2X1 U1034 ( .A(n355), .B(n346), .Y(n1092) );
  NAND2X1 U1035 ( .A(n355), .B(n344), .Y(n1093) );
  NAND2X1 U1036 ( .A(n346), .B(n344), .Y(n1094) );
  NAND3X1 U1037 ( .A(n1092), .B(n1093), .C(n1094), .Y(n341) );
  XNOR2X1 U1038 ( .A(n1095), .B(n352), .Y(n350) );
  XNOR2X1 U1039 ( .A(n354), .B(n995), .Y(n1095) );
  INVX4 U1040 ( .A(n1058), .Y(n1302) );
  XOR2X1 U1041 ( .A(n417), .B(n406), .Y(n1096) );
  XOR2X1 U1042 ( .A(n404), .B(n1096), .Y(n402) );
  NAND2X1 U1043 ( .A(n404), .B(n417), .Y(n1097) );
  NAND2X1 U1044 ( .A(n404), .B(n406), .Y(n1098) );
  NAND2X1 U1045 ( .A(n417), .B(n406), .Y(n1099) );
  NAND3X1 U1046 ( .A(n1098), .B(n1097), .C(n1099), .Y(n401) );
  XOR2X1 U1047 ( .A(n629), .B(n597), .Y(n1100) );
  XOR2X1 U1048 ( .A(n1100), .B(n677), .Y(n426) );
  NAND2X1 U1049 ( .A(n629), .B(n597), .Y(n1101) );
  NAND2X1 U1050 ( .A(n629), .B(n677), .Y(n1102) );
  NAND2X1 U1051 ( .A(n597), .B(n677), .Y(n1103) );
  NAND3X1 U1052 ( .A(n1101), .B(n1102), .C(n1103), .Y(n425) );
  XOR2X1 U1053 ( .A(n427), .B(n414), .Y(n1104) );
  XOR2X1 U1054 ( .A(n1104), .B(n425), .Y(n408) );
  NAND2X1 U1055 ( .A(n427), .B(n414), .Y(n1105) );
  NAND2X1 U1056 ( .A(n427), .B(n425), .Y(n1106) );
  NAND2X1 U1057 ( .A(n414), .B(n425), .Y(n1107) );
  NAND3X1 U1058 ( .A(n1105), .B(n1106), .C(n1107), .Y(n407) );
  XOR2X1 U1059 ( .A(n389), .B(n378), .Y(n1108) );
  XOR2X1 U1060 ( .A(n1108), .B(n376), .Y(n374) );
  NAND2X1 U1061 ( .A(n376), .B(n1007), .Y(n1109) );
  NAND2X1 U1062 ( .A(n376), .B(n378), .Y(n1110) );
  NAND2X1 U1063 ( .A(n1007), .B(n378), .Y(n1111) );
  NAND3X1 U1064 ( .A(n1110), .B(n1109), .C(n1111), .Y(n373) );
  INVX2 U1065 ( .A(n1331), .Y(n1153) );
  XNOR2X1 U1066 ( .A(n31), .B(a[25]), .Y(n1112) );
  NOR2X1 U1067 ( .A(n457), .B(n444), .Y(n1113) );
  XOR2X1 U1068 ( .A(n456), .B(n663), .Y(n1114) );
  XOR2X1 U1069 ( .A(n467), .B(n1114), .Y(n450) );
  NAND2X1 U1070 ( .A(n467), .B(n456), .Y(n1115) );
  NAND2X1 U1071 ( .A(n467), .B(n663), .Y(n1116) );
  NAND2X1 U1072 ( .A(n456), .B(n663), .Y(n1117) );
  NAND3X1 U1073 ( .A(n1116), .B(n1115), .C(n1117), .Y(n449) );
  OR2X1 U1074 ( .A(n1267), .B(n786), .Y(n1119) );
  NAND2X1 U1075 ( .A(n1118), .B(n1119), .Y(n632) );
  XOR2X1 U1076 ( .A(n356), .B(n367), .Y(n1120) );
  XOR2X1 U1077 ( .A(n1120), .B(n365), .Y(n352) );
  NAND2X1 U1078 ( .A(n356), .B(n367), .Y(n1121) );
  NAND2X1 U1079 ( .A(n356), .B(n365), .Y(n1122) );
  NAND2X1 U1080 ( .A(n367), .B(n365), .Y(n1123) );
  NAND3X1 U1081 ( .A(n1121), .B(n1122), .C(n1123), .Y(n351) );
  NAND2X1 U1082 ( .A(n354), .B(n995), .Y(n1124) );
  NAND2X1 U1083 ( .A(n354), .B(n352), .Y(n1125) );
  NAND2X1 U1084 ( .A(n995), .B(n352), .Y(n1126) );
  NAND3X1 U1085 ( .A(n1124), .B(n1125), .C(n1126), .Y(n349) );
  XOR2X1 U1086 ( .A(n1344), .B(n1256), .Y(n898) );
  INVX1 U1087 ( .A(n183), .Y(n181) );
  OR2X2 U1088 ( .A(n330), .B(n339), .Y(n1128) );
  INVX1 U1089 ( .A(n1128), .Y(n148) );
  INVX1 U1090 ( .A(n1260), .Y(n1297) );
  XNOR2X1 U1091 ( .A(n1129), .B(n419), .Y(n404) );
  XNOR2X1 U1092 ( .A(n421), .B(n408), .Y(n1129) );
  INVX1 U1093 ( .A(n1186), .Y(n1130) );
  INVX2 U1094 ( .A(n37), .Y(n1352) );
  INVX2 U1095 ( .A(n1060), .Y(n1131) );
  INVX4 U1096 ( .A(n1060), .Y(n1295) );
  XOR2X1 U1097 ( .A(n716), .B(n684), .Y(n1132) );
  XOR2X1 U1098 ( .A(n1132), .B(n700), .Y(n506) );
  NAND2X1 U1099 ( .A(n716), .B(n684), .Y(n1133) );
  NAND2X1 U1100 ( .A(n716), .B(n700), .Y(n1134) );
  NAND2X1 U1101 ( .A(n684), .B(n700), .Y(n1135) );
  NAND3X1 U1102 ( .A(n1133), .B(n1134), .C(n1135), .Y(n505) );
  XOR2X1 U1103 ( .A(n507), .B(n498), .Y(n1136) );
  XOR2X1 U1104 ( .A(n1136), .B(n505), .Y(n494) );
  NAND2X1 U1105 ( .A(n507), .B(n498), .Y(n1137) );
  NAND2X1 U1106 ( .A(n507), .B(n505), .Y(n1138) );
  NAND2X1 U1107 ( .A(n498), .B(n505), .Y(n1139) );
  NAND3X1 U1108 ( .A(n1137), .B(n1138), .C(n1139), .Y(n493) );
  OR2X1 U1109 ( .A(n1291), .B(n866), .Y(n1140) );
  OR2X1 U1110 ( .A(n917), .B(n865), .Y(n1141) );
  NAND2X1 U1111 ( .A(n1140), .B(n1141), .Y(n716) );
  BUFX2 U1112 ( .A(n12), .Y(n1142) );
  INVX2 U1113 ( .A(n475), .Y(n1143) );
  BUFX2 U1114 ( .A(n24), .Y(n1152) );
  INVX1 U1115 ( .A(n1182), .Y(n1146) );
  INVX2 U1116 ( .A(n12), .Y(n1150) );
  BUFX2 U1117 ( .A(n1295), .Y(n1151) );
  INVX4 U1118 ( .A(n1342), .Y(n1341) );
  INVX1 U1119 ( .A(n211), .Y(n209) );
  INVX2 U1120 ( .A(n24), .Y(n1298) );
  INVX2 U1121 ( .A(n1293), .Y(n1154) );
  INVX4 U1122 ( .A(n1293), .Y(n1283) );
  BUFX2 U1123 ( .A(n1342), .Y(n1206) );
  BUFX2 U1124 ( .A(n1131), .Y(n1155) );
  INVX1 U1125 ( .A(n1162), .Y(n155) );
  BUFX4 U1126 ( .A(n52), .Y(n1270) );
  INVX2 U1127 ( .A(n1298), .Y(n1156) );
  BUFX2 U1128 ( .A(n53), .Y(n1162) );
  INVX2 U1129 ( .A(n7), .Y(n1177) );
  XOR2X1 U1130 ( .A(n382), .B(n395), .Y(n1157) );
  XOR2X1 U1131 ( .A(n384), .B(n1157), .Y(n378) );
  NAND2X1 U1132 ( .A(n384), .B(n395), .Y(n1158) );
  NAND2X1 U1133 ( .A(n384), .B(n382), .Y(n1159) );
  NAND2X1 U1134 ( .A(n395), .B(n382), .Y(n1160) );
  NAND3X1 U1135 ( .A(n1159), .B(n1158), .C(n1160), .Y(n377) );
  AND2X2 U1136 ( .A(n900), .B(n1233), .Y(n1161) );
  INVX1 U1137 ( .A(n172), .Y(n174) );
  XOR2X1 U1138 ( .A(n436), .B(n449), .Y(n1163) );
  XOR2X1 U1139 ( .A(n447), .B(n1163), .Y(n432) );
  NAND2X1 U1140 ( .A(n447), .B(n436), .Y(n1164) );
  NAND2X1 U1141 ( .A(n447), .B(n449), .Y(n1165) );
  NAND2X1 U1142 ( .A(n436), .B(n449), .Y(n1166) );
  NAND3X1 U1143 ( .A(n1166), .B(n1164), .C(n1165), .Y(n431) );
  XNOR2X1 U1144 ( .A(n1167), .B(n433), .Y(n418) );
  XNOR2X1 U1145 ( .A(n435), .B(n422), .Y(n1167) );
  INVX4 U1146 ( .A(n1345), .Y(n1189) );
  XNOR2X1 U1147 ( .A(n7), .B(a[19]), .Y(n1168) );
  XOR2X1 U1148 ( .A(n442), .B(n438), .Y(n1169) );
  XOR2X1 U1149 ( .A(n1169), .B(n440), .Y(n434) );
  NAND2X1 U1150 ( .A(n442), .B(n438), .Y(n1170) );
  NAND2X1 U1151 ( .A(n442), .B(n440), .Y(n1171) );
  NAND2X1 U1152 ( .A(n438), .B(n440), .Y(n1172) );
  NAND3X1 U1153 ( .A(n1170), .B(n1171), .C(n1172), .Y(n433) );
  NAND2X1 U1154 ( .A(n435), .B(n422), .Y(n1173) );
  NAND2X1 U1155 ( .A(n435), .B(n433), .Y(n1174) );
  NAND2X1 U1156 ( .A(n422), .B(n433), .Y(n1175) );
  NAND3X1 U1157 ( .A(n1173), .B(n1174), .C(n1175), .Y(n417) );
  XNOR2X1 U1158 ( .A(n86), .B(n1176), .Y(product[45]) );
  AND2X2 U1159 ( .A(n85), .B(n275), .Y(n1176) );
  XNOR2X1 U1160 ( .A(n1177), .B(a[17]), .Y(n899) );
  INVX1 U1161 ( .A(n1263), .Y(n1277) );
  INVX1 U1162 ( .A(n128), .Y(n126) );
  INVX4 U1163 ( .A(n1312), .Y(n1313) );
  XNOR2X1 U1164 ( .A(n1335), .B(a[29]), .Y(n893) );
  INVX4 U1165 ( .A(n1335), .Y(n1337) );
  INVX8 U1166 ( .A(n1344), .Y(n1343) );
  BUFX2 U1167 ( .A(n1281), .Y(n1282) );
  XOR2X1 U1168 ( .A(n1214), .B(n1333), .Y(n843) );
  BUFX2 U1169 ( .A(n1313), .Y(n1185) );
  INVX1 U1170 ( .A(n130), .Y(n279) );
  INVX1 U1171 ( .A(n104), .Y(n102) );
  AND2X2 U1172 ( .A(n1227), .B(n1336), .Y(n582) );
  AND2X2 U1173 ( .A(n1227), .B(n1286), .Y(n600) );
  AND2X2 U1174 ( .A(n1227), .B(n1258), .Y(n636) );
  XOR2X1 U1175 ( .A(n476), .B(n478), .Y(n1190) );
  XOR2X1 U1176 ( .A(n1190), .B(n485), .Y(n472) );
  XOR2X1 U1177 ( .A(n474), .B(n1011), .Y(n1191) );
  NAND2X1 U1178 ( .A(n476), .B(n478), .Y(n1192) );
  NAND2X1 U1179 ( .A(n476), .B(n485), .Y(n1193) );
  NAND2X1 U1180 ( .A(n478), .B(n485), .Y(n1194) );
  NAND3X1 U1181 ( .A(n1192), .B(n1193), .C(n1194), .Y(n471) );
  NAND2X1 U1182 ( .A(n474), .B(n1011), .Y(n1195) );
  NAND2X1 U1183 ( .A(n474), .B(n472), .Y(n1196) );
  NAND2X1 U1184 ( .A(n1011), .B(n472), .Y(n1197) );
  NAND3X1 U1185 ( .A(n1195), .B(n1196), .C(n1197), .Y(n469) );
  XOR2X1 U1186 ( .A(n667), .B(n683), .Y(n1198) );
  XOR2X1 U1187 ( .A(n1198), .B(n635), .Y(n498) );
  NAND2X1 U1188 ( .A(n667), .B(n683), .Y(n1199) );
  NAND2X1 U1189 ( .A(n667), .B(n635), .Y(n1200) );
  NAND2X1 U1190 ( .A(n683), .B(n635), .Y(n1201) );
  NAND3X1 U1191 ( .A(n1199), .B(n1200), .C(n1201), .Y(n497) );
  XOR2X1 U1192 ( .A(n698), .B(n499), .Y(n1202) );
  XOR2X1 U1193 ( .A(n1202), .B(n497), .Y(n486) );
  NAND2X1 U1194 ( .A(n698), .B(n499), .Y(n1203) );
  NAND2X1 U1195 ( .A(n698), .B(n497), .Y(n1204) );
  NAND2X1 U1196 ( .A(n499), .B(n497), .Y(n1205) );
  NAND3X1 U1197 ( .A(n1203), .B(n1204), .C(n1205), .Y(n485) );
  INVX4 U1198 ( .A(n1066), .Y(n1281) );
  OR2X2 U1199 ( .A(n137), .B(n80), .Y(n1240) );
  XOR2X1 U1200 ( .A(n439), .B(n424), .Y(n1207) );
  XOR2X1 U1201 ( .A(n1207), .B(n426), .Y(n420) );
  NAND2X1 U1202 ( .A(n439), .B(n424), .Y(n1208) );
  NAND2X1 U1203 ( .A(n439), .B(n426), .Y(n1209) );
  NAND2X1 U1204 ( .A(n424), .B(n426), .Y(n1210) );
  NAND3X1 U1205 ( .A(n1208), .B(n1209), .C(n1210), .Y(n419) );
  NAND2X1 U1206 ( .A(n421), .B(n408), .Y(n1211) );
  NAND2X1 U1207 ( .A(n421), .B(n419), .Y(n1212) );
  NAND2X1 U1208 ( .A(n408), .B(n419), .Y(n1213) );
  NAND3X1 U1209 ( .A(n1211), .B(n1212), .C(n1213), .Y(n403) );
  XNOR2X1 U1210 ( .A(n1215), .B(n403), .Y(n1218) );
  AND2X2 U1211 ( .A(n1227), .B(n1279), .Y(n618) );
  XNOR2X1 U1212 ( .A(n73), .B(n1216), .Y(product[46]) );
  AND2X2 U1213 ( .A(n72), .B(n1061), .Y(n1216) );
  XOR2X1 U1214 ( .A(n1217), .B(n405), .Y(n390) );
  XOR2X1 U1215 ( .A(n1218), .B(n390), .Y(n388) );
  NAND2X1 U1216 ( .A(n407), .B(n394), .Y(n1219) );
  NAND2X1 U1217 ( .A(n407), .B(n405), .Y(n1220) );
  NAND2X1 U1218 ( .A(n394), .B(n405), .Y(n1221) );
  NAND3X1 U1219 ( .A(n1219), .B(n1220), .C(n1221), .Y(n389) );
  NAND2X1 U1220 ( .A(n392), .B(n403), .Y(n1222) );
  NAND2X1 U1221 ( .A(n392), .B(n390), .Y(n1223) );
  NAND2X1 U1222 ( .A(n403), .B(n390), .Y(n1224) );
  NAND3X1 U1223 ( .A(n1222), .B(n1223), .C(n1224), .Y(n387) );
  INVX8 U1224 ( .A(n1057), .Y(n1308) );
  INVX2 U1225 ( .A(n1182), .Y(n1339) );
  XNOR2X1 U1226 ( .A(n1340), .B(a[15]), .Y(n900) );
  INVX1 U1227 ( .A(n171), .Y(n173) );
  XNOR2X1 U1228 ( .A(n37), .B(a[29]), .Y(n1225) );
  BUFX4 U1229 ( .A(n1239), .Y(n1227) );
  BUFX4 U1230 ( .A(n1239), .Y(n1228) );
  XOR2X1 U1231 ( .A(n391), .B(n393), .Y(n1229) );
  XOR2X1 U1232 ( .A(n1229), .B(n380), .Y(n376) );
  NAND2X1 U1233 ( .A(n380), .B(n391), .Y(n1230) );
  NAND2X1 U1234 ( .A(n380), .B(n393), .Y(n1231) );
  NAND2X1 U1235 ( .A(n391), .B(n393), .Y(n1232) );
  NAND3X1 U1236 ( .A(n1231), .B(n1230), .C(n1232), .Y(n375) );
  INVX4 U1237 ( .A(n1258), .Y(n1267) );
  INVX1 U1238 ( .A(a[15]), .Y(n1233) );
  INVX4 U1239 ( .A(n1261), .Y(n1300) );
  BUFX2 U1240 ( .A(n1225), .Y(n1234) );
  BUFX4 U1241 ( .A(n1225), .Y(n1235) );
  INVX4 U1242 ( .A(n1348), .Y(n1347) );
  INVX2 U1243 ( .A(n1335), .Y(n1236) );
  INVX2 U1244 ( .A(n1335), .Y(n1336) );
  INVX8 U1245 ( .A(n1348), .Y(n1346) );
  INVX1 U1246 ( .A(n918), .Y(n1238) );
  INVX4 U1247 ( .A(n25), .Y(n1348) );
  AND2X2 U1248 ( .A(n1238), .B(n1317), .Y(n359) );
  OR2X2 U1249 ( .A(n322), .B(n329), .Y(n1241) );
  OR2X2 U1250 ( .A(n481), .B(n470), .Y(n1242) );
  OR2X2 U1251 ( .A(n302), .B(n307), .Y(n1245) );
  INVX8 U1252 ( .A(n1350), .Y(n1349) );
  INVX4 U1253 ( .A(n1161), .Y(n1292) );
  INVX4 U1254 ( .A(n1260), .Y(n1296) );
  INVX1 U1255 ( .A(n1187), .Y(n732) );
  INVX1 U1256 ( .A(n1330), .Y(n728) );
  AND2X1 U1257 ( .A(n572), .B(n725), .Y(n1255) );
  INVX1 U1258 ( .A(n1326), .Y(n730) );
  XOR2X1 U1259 ( .A(n1189), .B(a[21]), .Y(n897) );
  AND2X2 U1260 ( .A(n481), .B(n470), .Y(n1243) );
  AND2X2 U1261 ( .A(n523), .B(n518), .Y(n1244) );
  OR2X1 U1262 ( .A(n518), .B(n523), .Y(n1246) );
  AND2X2 U1263 ( .A(n491), .B(n482), .Y(n1247) );
  OR2X1 U1264 ( .A(n491), .B(n482), .Y(n1248) );
  AND2X2 U1265 ( .A(n539), .B(n538), .Y(n1249) );
  OR2X1 U1266 ( .A(n533), .B(n530), .Y(n1250) );
  OR2X1 U1267 ( .A(n539), .B(n538), .Y(n1251) );
  OR2X1 U1268 ( .A(n708), .B(n724), .Y(n1252) );
  AND2X2 U1269 ( .A(n533), .B(n530), .Y(n1253) );
  AND2X2 U1270 ( .A(n708), .B(n724), .Y(n1254) );
  XNOR2X1 U1271 ( .A(n542), .B(n573), .Y(n291) );
  XOR2X1 U1272 ( .A(n1311), .B(n1237), .Y(n753) );
  INVX2 U1273 ( .A(n551), .Y(n637) );
  INVX2 U1274 ( .A(n545), .Y(n601) );
  INVX2 U1275 ( .A(n548), .Y(n619) );
  INVX1 U1276 ( .A(n1234), .Y(n1286) );
  INVX2 U1277 ( .A(n753), .Y(n1285) );
  INVX2 U1278 ( .A(n1058), .Y(n1301) );
  AND2X2 U1279 ( .A(n1225), .B(n893), .Y(n1257) );
  INVX2 U1280 ( .A(n887), .Y(n1314) );
  INVX2 U1281 ( .A(n880), .Y(n1327) );
  XOR2X1 U1282 ( .A(n25), .B(a[25]), .Y(n1258) );
  AND2X2 U1283 ( .A(n900), .B(n1233), .Y(n1259) );
  XOR2X1 U1284 ( .A(a[21]), .B(n13), .Y(n1260) );
  NOR2X1 U1285 ( .A(n1262), .B(n1263), .Y(n1261) );
  XNOR2X1 U1286 ( .A(n25), .B(a[23]), .Y(n1262) );
  XOR2X1 U1287 ( .A(a[23]), .B(n19), .Y(n1263) );
  INVX4 U1288 ( .A(n13), .Y(n1344) );
  BUFX4 U1289 ( .A(n12), .Y(n1265) );
  INVX1 U1290 ( .A(n1257), .Y(n1278) );
  INVX1 U1291 ( .A(n210), .Y(n289) );
  INVX2 U1292 ( .A(n9), .Y(n1293) );
  INVX1 U1293 ( .A(n213), .Y(n212) );
  INVX1 U1294 ( .A(n189), .Y(n286) );
  INVX1 U1295 ( .A(n194), .Y(n287) );
  INVX1 U1296 ( .A(n200), .Y(n202) );
  BUFX2 U1297 ( .A(n52), .Y(n1271) );
  BUFX4 U1298 ( .A(n396), .Y(n1273) );
  BUFX2 U1299 ( .A(n1189), .Y(n1275) );
  INVX4 U1300 ( .A(n886), .Y(n1316) );
  BUFX2 U1301 ( .A(n1278), .Y(n1276) );
  INVX2 U1302 ( .A(n1284), .Y(n596) );
  INVX2 U1303 ( .A(n752), .Y(n1287) );
  INVX1 U1304 ( .A(n1113), .Y(n290) );
  INVX4 U1305 ( .A(n7), .Y(n1342) );
  INVX2 U1306 ( .A(n1259), .Y(n1291) );
  INVX1 U1307 ( .A(n182), .Y(n285) );
  INVX2 U1308 ( .A(n1279), .Y(n1303) );
  AOI22X1 U1309 ( .A(n1257), .B(n1285), .C(n1286), .D(n1287), .Y(n1284) );
  INVX4 U1310 ( .A(n1290), .Y(n563) );
  AOI22X1 U1311 ( .A(n1289), .B(n1343), .C(n1060), .D(n1343), .Y(n1288) );
  INVX2 U1312 ( .A(n560), .Y(n691) );
  AOI22X1 U1313 ( .A(a[15]), .B(n1146), .C(n1259), .D(n1146), .Y(n1290) );
  INVX1 U1314 ( .A(n205), .Y(n288) );
  INVX1 U1315 ( .A(n199), .Y(n201) );
  INVX1 U1316 ( .A(n166), .Y(n283) );
  INVX4 U1317 ( .A(n1298), .Y(n1299) );
  INVX2 U1318 ( .A(n554), .Y(n655) );
  INVX4 U1319 ( .A(n51), .Y(n1305) );
  INVX1 U1320 ( .A(n177), .Y(n284) );
  INVX1 U1321 ( .A(n161), .Y(n282) );
  INVX1 U1322 ( .A(n1271), .Y(n156) );
  INVX8 U1323 ( .A(n1337), .Y(n918) );
  INVX8 U1324 ( .A(n1305), .Y(n1306) );
  INVX8 U1325 ( .A(n1323), .Y(n1324) );
  INVX8 U1326 ( .A(n1329), .Y(n1330) );
  INVX8 U1327 ( .A(n1352), .Y(n1351) );
  INVX2 U1328 ( .A(n101), .Y(n99) );
  INVX2 U1329 ( .A(n94), .Y(n92) );
  INVX2 U1330 ( .A(n79), .Y(n77) );
  INVX2 U1331 ( .A(n1321), .Y(n733) );
  INVX2 U1332 ( .A(n1324), .Y(n731) );
  OAI22X1 U1333 ( .A(n1283), .B(n1206), .C(n1142), .D(n1206), .Y(n560) );
  INVX2 U1334 ( .A(n1294), .Y(n558) );
  INVX2 U1335 ( .A(n1296), .Y(n555) );
  OAI22X1 U1336 ( .A(n1296), .B(n1181), .C(n1181), .D(n1152), .Y(n554) );
  OAI22X1 U1337 ( .A(n1179), .B(n1348), .C(n1300), .D(n1348), .Y(n551) );
  OAI22X1 U1338 ( .A(n1267), .B(n1350), .C(n1302), .D(n1350), .Y(n548) );
  OAI22X1 U1339 ( .A(n1303), .B(n1130), .C(n1183), .D(n1130), .Y(n545) );
  OAI22X1 U1340 ( .A(n1235), .B(n918), .C(n1276), .D(n918), .Y(n542) );
  INVX2 U1341 ( .A(n385), .Y(n386) );
  INVX2 U1342 ( .A(n359), .Y(n360) );
  INVX2 U1343 ( .A(n337), .Y(n338) );
  INVX2 U1344 ( .A(n319), .Y(n320) );
  INVX2 U1345 ( .A(n305), .Y(n306) );
  INVX2 U1346 ( .A(n295), .Y(n296) );
  INVX2 U1347 ( .A(n93), .Y(n91) );
  INVX2 U1348 ( .A(n84), .Y(n275) );
  INVX2 U1349 ( .A(n222), .Y(n221) );
  INVX2 U1350 ( .A(n149), .Y(n151) );
  INVX2 U1351 ( .A(n144), .Y(n142) );
  INVX2 U1352 ( .A(n129), .Y(n127) );
  INVX2 U1353 ( .A(n122), .Y(n120) );
  INVX2 U1354 ( .A(n111), .Y(n109) );
  INVX2 U1355 ( .A(n105), .Y(n103) );
endmodule


module alu_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n43, n45, n46, n47, n48, n49, n51, n53, n54,
         n55, n56, n58, n60, n61, n63, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n82, n84, n86, n88, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n111, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188;

  FAX1 U3 ( .A(A[15]), .B(n95), .C(n80), .YC(n16), .YS(DIFF[15]) );
  XNOR2X1 U5 ( .A(n177), .B(n1), .Y(DIFF[14]) );
  AOI21X1 U6 ( .A(n186), .B(n22), .C(n19), .Y(n17) );
  NAND2X1 U9 ( .A(n21), .B(n186), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(n96), .Y(n21) );
  XOR2X1 U13 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  OAI21X1 U14 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U15 ( .A(n24), .B(n82), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(n97), .Y(n23) );
  NAND2X1 U18 ( .A(A[13]), .B(n97), .Y(n24) );
  XNOR2X1 U19 ( .A(n175), .B(n3), .Y(DIFF[12]) );
  AOI21X1 U20 ( .A(n185), .B(n30), .C(n27), .Y(n25) );
  NAND2X1 U23 ( .A(n29), .B(n185), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(n98), .Y(n29) );
  XOR2X1 U27 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  OAI21X1 U28 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U29 ( .A(n32), .B(n84), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(n99), .Y(n31) );
  NAND2X1 U32 ( .A(A[11]), .B(n99), .Y(n32) );
  XNOR2X1 U33 ( .A(n38), .B(n5), .Y(DIFF[10]) );
  AOI21X1 U34 ( .A(n184), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n37), .B(n184), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(n100), .Y(n37) );
  XOR2X1 U41 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  OAI21X1 U42 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U43 ( .A(n40), .B(n86), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(n101), .Y(n39) );
  NAND2X1 U46 ( .A(A[9]), .B(n101), .Y(n40) );
  XNOR2X1 U47 ( .A(n174), .B(n7), .Y(DIFF[8]) );
  AOI21X1 U48 ( .A(n183), .B(n46), .C(n43), .Y(n41) );
  NAND2X1 U51 ( .A(n45), .B(n183), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(n102), .Y(n45) );
  XOR2X1 U55 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  OAI21X1 U56 ( .A(n49), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U57 ( .A(n48), .B(n88), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(n103), .Y(n47) );
  NAND2X1 U60 ( .A(A[7]), .B(n103), .Y(n48) );
  XNOR2X1 U61 ( .A(n173), .B(n9), .Y(DIFF[6]) );
  AOI21X1 U62 ( .A(n172), .B(n54), .C(n51), .Y(n49) );
  NAND2X1 U65 ( .A(n53), .B(n172), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(n104), .Y(n53) );
  XOR2X1 U69 ( .A(n61), .B(n10), .Y(DIFF[5]) );
  OAI21X1 U70 ( .A(n67), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U71 ( .A(n171), .B(n170), .Y(n55) );
  AOI21X1 U72 ( .A(n63), .B(n171), .C(n58), .Y(n56) );
  NAND2X1 U75 ( .A(n60), .B(n171), .Y(n10) );
  NAND2X1 U78 ( .A(A[5]), .B(n105), .Y(n60) );
  XNOR2X1 U79 ( .A(n66), .B(n11), .Y(DIFF[4]) );
  AOI21X1 U80 ( .A(n170), .B(n66), .C(n63), .Y(n61) );
  NAND2X1 U83 ( .A(n65), .B(n170), .Y(n11) );
  NAND2X1 U86 ( .A(A[4]), .B(n106), .Y(n65) );
  XNOR2X1 U87 ( .A(n72), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U89 ( .A(n76), .B(n68), .C(n69), .Y(n67) );
  NOR2X1 U90 ( .A(n70), .B(n73), .Y(n68) );
  OAI21X1 U91 ( .A(n70), .B(n74), .C(n71), .Y(n69) );
  NAND2X1 U92 ( .A(n71), .B(n92), .Y(n12) );
  NOR2X1 U94 ( .A(A[3]), .B(n107), .Y(n70) );
  NAND2X1 U95 ( .A(A[3]), .B(n107), .Y(n71) );
  XOR2X1 U96 ( .A(n75), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U97 ( .A(n75), .B(n73), .C(n74), .Y(n72) );
  NAND2X1 U98 ( .A(n74), .B(n93), .Y(n13) );
  NOR2X1 U100 ( .A(A[2]), .B(n108), .Y(n73) );
  NAND2X1 U101 ( .A(A[2]), .B(n108), .Y(n74) );
  XOR2X1 U102 ( .A(n14), .B(n187), .Y(DIFF[1]) );
  OAI21X1 U104 ( .A(n77), .B(n187), .C(n78), .Y(n76) );
  NAND2X1 U105 ( .A(n78), .B(n94), .Y(n14) );
  NOR2X1 U107 ( .A(A[1]), .B(n109), .Y(n77) );
  NAND2X1 U108 ( .A(A[1]), .B(n109), .Y(n78) );
  XNOR2X1 U109 ( .A(n188), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U110 ( .A(A[0]), .B(n188), .Y(n79) );
  INVX2 U131 ( .A(B[0]), .Y(n188) );
  INVX2 U132 ( .A(n17), .Y(n80) );
  INVX1 U133 ( .A(B[8]), .Y(n102) );
  INVX1 U134 ( .A(B[11]), .Y(n99) );
  INVX1 U135 ( .A(B[13]), .Y(n97) );
  OR2X2 U136 ( .A(A[4]), .B(n106), .Y(n170) );
  OR2X2 U137 ( .A(A[5]), .B(n105), .Y(n171) );
  OR2X2 U138 ( .A(A[6]), .B(n104), .Y(n172) );
  INVX1 U139 ( .A(B[2]), .Y(n108) );
  INVX1 U140 ( .A(B[10]), .Y(n100) );
  INVX1 U141 ( .A(B[9]), .Y(n101) );
  BUFX2 U142 ( .A(n54), .Y(n173) );
  BUFX2 U143 ( .A(n46), .Y(n174) );
  BUFX2 U144 ( .A(n30), .Y(n175) );
  INVX1 U145 ( .A(n22), .Y(n176) );
  INVX2 U146 ( .A(n176), .Y(n177) );
  FAX1 U147 ( .A(A[15]), .B(n95), .C(n80), .YC(n178) );
  XOR2X1 U148 ( .A(n111), .B(B[16]), .Y(n179) );
  XOR2X1 U149 ( .A(n178), .B(n179), .Y(DIFF[16]) );
  NAND2X1 U150 ( .A(n16), .B(n111), .Y(n180) );
  NAND2X1 U151 ( .A(n16), .B(B[16]), .Y(n181) );
  NAND2X1 U152 ( .A(n111), .B(B[16]), .Y(n182) );
  NAND3X1 U153 ( .A(n181), .B(n180), .C(n182), .Y(n15) );
  OR2X2 U154 ( .A(A[8]), .B(n102), .Y(n183) );
  OR2X2 U155 ( .A(A[10]), .B(n100), .Y(n184) );
  OR2X2 U156 ( .A(A[12]), .B(n98), .Y(n185) );
  OR2X2 U157 ( .A(A[14]), .B(n96), .Y(n186) );
  BUFX2 U158 ( .A(n79), .Y(n187) );
  INVX1 U159 ( .A(B[14]), .Y(n96) );
  INVX1 U160 ( .A(B[6]), .Y(n104) );
  INVX1 U161 ( .A(B[3]), .Y(n107) );
  INVX1 U162 ( .A(B[4]), .Y(n106) );
  INVX1 U163 ( .A(B[1]), .Y(n109) );
  INVX2 U164 ( .A(B[12]), .Y(n98) );
  INVX2 U165 ( .A(B[15]), .Y(n95) );
  INVX2 U166 ( .A(n77), .Y(n94) );
  INVX2 U167 ( .A(n73), .Y(n93) );
  INVX2 U168 ( .A(n70), .Y(n92) );
  INVX2 U169 ( .A(n47), .Y(n88) );
  INVX2 U170 ( .A(n39), .Y(n86) );
  INVX2 U171 ( .A(n31), .Y(n84) );
  INVX2 U172 ( .A(n23), .Y(n82) );
  INVX2 U173 ( .A(n76), .Y(n75) );
  INVX2 U174 ( .A(n67), .Y(n66) );
  INVX2 U175 ( .A(n65), .Y(n63) );
  INVX2 U176 ( .A(n60), .Y(n58) );
  INVX2 U177 ( .A(n53), .Y(n51) );
  INVX2 U178 ( .A(n45), .Y(n43) );
  INVX2 U179 ( .A(n37), .Y(n35) );
  INVX2 U180 ( .A(n29), .Y(n27) );
  INVX2 U181 ( .A(n21), .Y(n19) );
  INVX2 U182 ( .A(A[17]), .Y(n111) );
  INVX2 U183 ( .A(B[5]), .Y(n105) );
  INVX2 U184 ( .A(B[7]), .Y(n103) );
  INVX2 U185 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n26, n5, n2, 
        src1_data[12], n19, n6, n31, n7, n25, n21, n29, n22, n4, n3, 
        src1_data[1:0]}), .B({src2_data[16], src2_data[16], n23, n13, 
        src2_data[13], n20, src2_data[11:8], n11, src2_data[6], n9, 
        src2_data[4:0]}), .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b(src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  alu_DW01_sub_2 sub_44 ( .A({src1_data[16], src1_data[16], n26, n5, n2, 
        src1_data[12], n19, n6, n31, n7, n25, n21, n29, n22, n4, n3, 
        src1_data[1:0]}), .B({src2_data[16], src2_data[16], n23, n13, 
        src2_data[13], n20, src2_data[11:8], n11, src2_data[6], n9, 
        src2_data[4:0]}), .CI(1'b0), .DIFF(large_dif) );
  INVX1 U3 ( .A(n14), .Y(n15) );
  BUFX2 U4 ( .A(src2_data[15]), .Y(n23) );
  BUFX2 U6 ( .A(src1_data[15]), .Y(n26) );
  INVX1 U7 ( .A(src1_data[13]), .Y(n1) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  BUFX2 U10 ( .A(src1_data[2]), .Y(n3) );
  BUFX2 U11 ( .A(src1_data[3]), .Y(n4) );
  BUFX2 U12 ( .A(src1_data[14]), .Y(n5) );
  BUFX2 U13 ( .A(src1_data[10]), .Y(n6) );
  BUFX2 U14 ( .A(src1_data[8]), .Y(n7) );
  INVX1 U15 ( .A(src2_data[5]), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n9) );
  INVX1 U17 ( .A(src2_data[7]), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n11) );
  INVX1 U19 ( .A(src2_data[14]), .Y(n12) );
  INVX2 U20 ( .A(n12), .Y(n13) );
  NAND2X1 U21 ( .A(n36), .B(n35), .Y(n14) );
  NAND2X1 U22 ( .A(n15), .B(n37), .Y(overflow) );
  INVX1 U23 ( .A(src1_data[9]), .Y(n32) );
  INVX2 U24 ( .A(n75), .Y(n70) );
  AND2X2 U25 ( .A(n39), .B(n38), .Y(n16) );
  AND2X2 U26 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n17) );
  AND2X2 U27 ( .A(alu_op[1]), .B(n38), .Y(n18) );
  INVX1 U28 ( .A(large_sum[16]), .Y(n74) );
  BUFX2 U29 ( .A(src1_data[11]), .Y(n19) );
  INVX2 U30 ( .A(n32), .Y(n31) );
  BUFX2 U31 ( .A(src2_data[12]), .Y(n20) );
  BUFX2 U32 ( .A(src1_data[6]), .Y(n21) );
  BUFX2 U33 ( .A(src1_data[4]), .Y(n22) );
  INVX2 U34 ( .A(n30), .Y(n29) );
  INVX1 U35 ( .A(src1_data[7]), .Y(n24) );
  INVX2 U36 ( .A(n24), .Y(n25) );
  INVX1 U37 ( .A(src1_data[5]), .Y(n30) );
  NAND2X1 U38 ( .A(N26), .B(n17), .Y(n37) );
  INVX2 U39 ( .A(alu_op[0]), .Y(n38) );
  XOR2X1 U40 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n33) );
  NAND2X1 U41 ( .A(n18), .B(n33), .Y(n36) );
  INVX2 U42 ( .A(alu_op[1]), .Y(n39) );
  NAND2X1 U43 ( .A(alu_op[0]), .B(n39), .Y(n75) );
  XOR2X1 U44 ( .A(large_sum[16]), .B(large_sum[17]), .Y(n34) );
  NAND2X1 U45 ( .A(n70), .B(n34), .Y(n35) );
  AOI22X1 U46 ( .A(src1_data[0]), .B(n16), .C(full_mult[30]), .D(n17), .Y(n41)
         );
  AOI22X1 U47 ( .A(large_dif[0]), .B(n18), .C(large_sum[0]), .D(n70), .Y(n40)
         );
  NAND2X1 U48 ( .A(n41), .B(n40), .Y(result[0]) );
  AOI22X1 U49 ( .A(src1_data[1]), .B(n16), .C(full_mult[31]), .D(n17), .Y(n43)
         );
  AOI22X1 U50 ( .A(large_dif[1]), .B(n18), .C(large_sum[1]), .D(n70), .Y(n42)
         );
  NAND2X1 U51 ( .A(n43), .B(n42), .Y(result[1]) );
  AOI22X1 U52 ( .A(n3), .B(n16), .C(full_mult[32]), .D(n17), .Y(n45) );
  AOI22X1 U53 ( .A(large_dif[2]), .B(n18), .C(large_sum[2]), .D(n70), .Y(n44)
         );
  NAND2X1 U54 ( .A(n45), .B(n44), .Y(result[2]) );
  AOI22X1 U55 ( .A(n4), .B(n16), .C(full_mult[33]), .D(n17), .Y(n47) );
  AOI22X1 U56 ( .A(large_dif[3]), .B(n18), .C(large_sum[3]), .D(n70), .Y(n46)
         );
  NAND2X1 U57 ( .A(n47), .B(n46), .Y(result[3]) );
  AOI22X1 U58 ( .A(n22), .B(n16), .C(full_mult[34]), .D(n17), .Y(n49) );
  AOI22X1 U59 ( .A(large_dif[4]), .B(n18), .C(large_sum[4]), .D(n70), .Y(n48)
         );
  NAND2X1 U60 ( .A(n49), .B(n48), .Y(result[4]) );
  AOI22X1 U61 ( .A(n29), .B(n16), .C(full_mult[35]), .D(n17), .Y(n51) );
  AOI22X1 U62 ( .A(large_dif[5]), .B(n18), .C(large_sum[5]), .D(n70), .Y(n50)
         );
  NAND2X1 U63 ( .A(n51), .B(n50), .Y(result[5]) );
  AOI22X1 U64 ( .A(n21), .B(n16), .C(full_mult[36]), .D(n17), .Y(n53) );
  AOI22X1 U65 ( .A(large_dif[6]), .B(n18), .C(large_sum[6]), .D(n70), .Y(n52)
         );
  NAND2X1 U66 ( .A(n53), .B(n52), .Y(result[6]) );
  AOI22X1 U67 ( .A(n25), .B(n16), .C(full_mult[37]), .D(n17), .Y(n55) );
  AOI22X1 U68 ( .A(large_dif[7]), .B(n18), .C(large_sum[7]), .D(n70), .Y(n54)
         );
  NAND2X1 U69 ( .A(n55), .B(n54), .Y(result[7]) );
  AOI22X1 U70 ( .A(n7), .B(n16), .C(full_mult[38]), .D(n17), .Y(n57) );
  AOI22X1 U71 ( .A(large_dif[8]), .B(n18), .C(large_sum[8]), .D(n70), .Y(n56)
         );
  NAND2X1 U72 ( .A(n57), .B(n56), .Y(result[8]) );
  AOI22X1 U73 ( .A(n31), .B(n16), .C(full_mult[39]), .D(n17), .Y(n59) );
  AOI22X1 U74 ( .A(large_dif[9]), .B(n18), .C(large_sum[9]), .D(n70), .Y(n58)
         );
  NAND2X1 U75 ( .A(n59), .B(n58), .Y(result[9]) );
  AOI22X1 U76 ( .A(n6), .B(n16), .C(full_mult[40]), .D(n17), .Y(n61) );
  AOI22X1 U77 ( .A(large_dif[10]), .B(n18), .C(large_sum[10]), .D(n70), .Y(n60) );
  NAND2X1 U78 ( .A(n60), .B(n61), .Y(result[10]) );
  AOI22X1 U79 ( .A(n19), .B(n16), .C(full_mult[41]), .D(n17), .Y(n63) );
  AOI22X1 U80 ( .A(large_dif[11]), .B(n18), .C(large_sum[11]), .D(n70), .Y(n62) );
  NAND2X1 U81 ( .A(n62), .B(n63), .Y(result[11]) );
  AOI22X1 U82 ( .A(src1_data[12]), .B(n16), .C(full_mult[42]), .D(n17), .Y(n65) );
  AOI22X1 U83 ( .A(large_dif[12]), .B(n18), .C(large_sum[12]), .D(n70), .Y(n64) );
  NAND2X1 U84 ( .A(n65), .B(n64), .Y(result[12]) );
  AOI22X1 U85 ( .A(n2), .B(n16), .C(full_mult[43]), .D(n17), .Y(n67) );
  AOI22X1 U86 ( .A(large_dif[13]), .B(n18), .C(large_sum[13]), .D(n70), .Y(n66) );
  NAND2X1 U87 ( .A(n66), .B(n67), .Y(result[13]) );
  AOI22X1 U88 ( .A(n5), .B(n16), .C(full_mult[44]), .D(n17), .Y(n69) );
  AOI22X1 U89 ( .A(large_dif[14]), .B(n18), .C(large_sum[14]), .D(n70), .Y(n68) );
  NAND2X1 U90 ( .A(n69), .B(n68), .Y(result[14]) );
  AOI22X1 U91 ( .A(n26), .B(n16), .C(full_mult[45]), .D(n17), .Y(n72) );
  AOI22X1 U92 ( .A(large_dif[15]), .B(n18), .C(large_sum[15]), .D(n70), .Y(n71) );
  NAND2X1 U93 ( .A(n71), .B(n72), .Y(result[15]) );
  AOI22X1 U94 ( .A(src1_data[16]), .B(n16), .C(large_dif[16]), .D(n18), .Y(n73) );
  OAI21X1 U95 ( .A(n75), .B(n74), .C(n73), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n11), .Y(n46) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n20), .Y(n30) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n16), .Y(n36) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX1 U8 ( .A(n18), .Y(n32) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n739), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n737), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n738), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n739), .Y(n10) );
  NOR2X1 U29 ( .A(n736), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n737), .B(n738), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n735), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n727, n725, 
        n722, n719, n716, n713, n710, n48, n705, n44, n700, n697, n694, n691, 
        n688, n685}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n727, n58, 
        n52, n42, n56, n54, n46, n48, n50, n44, n699, n696, n693, n690, n687, 
        n685}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n727, n725, 
        n722, n719, n716, n713, n710, n707, n705, n702, n700, n697, n694, n691, 
        n688, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n727, n724, 
        n721, n718, n715, n712, n709, n707, n704, n702, n699, n696, n693, n690, 
        n687, n685}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n727, n725, 
        n722, n719, n716, n713, n710, n48, n705, w_data[6], n700, n697, n694, 
        n691, n688, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n730), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n727, n59, 
        n53, n43, n57, n55, n47, n49, n51, n45, n699, n696, n693, n690, n687, 
        n685}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n730), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n727, n725, 
        n722, n719, n716, n713, n710, n49, n705, n45, n700, n697, n694, n691, 
        n688, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n731), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n727, n58, 
        n52, n42, n56, n54, n46, n48, n50, n44, n699, n696, n693, n690, n687, 
        n685}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n731), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n727, n59, 
        n53, n43, n57, n55, n47, n49, n51, n45, n700, n697, n694, n691, n688, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n732), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n727, n724, 
        n721, n718, n715, n712, n709, n707, n704, n702, n699, n696, n693, n690, 
        n687, n685}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n732), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n727, n58, 
        n52, n42, n56, n54, n46, n48, n50, n44, n700, n697, n694, n691, n688, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n733), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n727, n59, 
        n53, n43, n57, n55, n47, n49, n51, n45, n699, n696, n693, n690, n687, 
        n685}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n733), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n727, n724, 
        n721, n718, n715, n712, n709, n707, n704, n702, n700, n697, n694, n691, 
        n688, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n734), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n727, n58, 
        n52, n42, n56, n54, n46, n48, n50, n44, n699, n696, n693, n690, n687, 
        n685}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n734), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n727, n59, 
        n53, n43, n57, n55, n47, n49, n51, n45, n700, n697, n694, n691, n688, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n735), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n727, n724, 
        n721, n718, n715, n712, n709, n707, n704, n702, n699, n696, n693, n690, 
        n687, n685}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  INVX2 U2 ( .A(N12), .Y(n37) );
  INVX2 U3 ( .A(n644), .Y(n1) );
  INVX4 U4 ( .A(N14), .Y(n644) );
  AND2X1 U5 ( .A(N14), .B(n18), .Y(n29) );
  INVX4 U31 ( .A(w_data[9]), .Y(n708) );
  INVX4 U32 ( .A(n412), .Y(n668) );
  INVX4 U33 ( .A(n102), .Y(n383) );
  BUFX2 U34 ( .A(n383), .Y(n27) );
  INVX4 U35 ( .A(w_data[13]), .Y(n720) );
  INVX4 U36 ( .A(w_data[10]), .Y(n711) );
  INVX4 U37 ( .A(w_data[11]), .Y(n714) );
  BUFX4 U38 ( .A(n370), .Y(n371) );
  INVX4 U39 ( .A(n407), .Y(n658) );
  AND2X2 U40 ( .A(N10), .B(N11), .Y(n61) );
  INVX4 U41 ( .A(n378), .Y(n2) );
  INVX4 U42 ( .A(n2), .Y(n3) );
  INVX8 U43 ( .A(n2), .Y(n4) );
  INVX8 U44 ( .A(n672), .Y(n674) );
  INVX4 U45 ( .A(n413), .Y(n672) );
  INVX4 U46 ( .A(w_data[6]), .Y(n701) );
  INVX2 U47 ( .A(n371), .Y(n389) );
  INVX2 U48 ( .A(n414), .Y(n675) );
  INVX2 U49 ( .A(n411), .Y(n664) );
  INVX2 U50 ( .A(n77), .Y(n365) );
  INVX4 U51 ( .A(n653), .Y(n657) );
  BUFX2 U52 ( .A(n652), .Y(n653) );
  INVX2 U53 ( .A(n661), .Y(n663) );
  INVX4 U54 ( .A(n658), .Y(n659) );
  INVX2 U55 ( .A(n652), .Y(n655) );
  INVX4 U56 ( .A(n675), .Y(n677) );
  INVX4 U57 ( .A(n668), .Y(n671) );
  INVX2 U58 ( .A(n108), .Y(r1_data[2]) );
  INVX2 U59 ( .A(n125), .Y(r1_data[3]) );
  INVX2 U60 ( .A(n142), .Y(r1_data[4]) );
  INVX2 U61 ( .A(n159), .Y(r1_data[5]) );
  INVX2 U62 ( .A(n244), .Y(r1_data[10]) );
  INVX2 U63 ( .A(n295), .Y(r1_data[13]) );
  INVX2 U64 ( .A(n312), .Y(r1_data[14]) );
  BUFX2 U65 ( .A(n383), .Y(n26) );
  INVX2 U66 ( .A(n84), .Y(n376) );
  INVX2 U67 ( .A(n176), .Y(r1_data[6]) );
  INVX2 U68 ( .A(n210), .Y(r1_data[8]) );
  INVX2 U69 ( .A(n278), .Y(r1_data[12]) );
  INVX4 U70 ( .A(n376), .Y(n378) );
  INVX2 U71 ( .A(n329), .Y(r1_data[15]) );
  INVX2 U72 ( .A(w_data[7]), .Y(n703) );
  INVX2 U73 ( .A(n405), .Y(n647) );
  INVX2 U74 ( .A(n371), .Y(n14) );
  INVX2 U75 ( .A(n371), .Y(n15) );
  INVX2 U76 ( .A(N10), .Y(n356) );
  BUFX4 U77 ( .A(n652), .Y(n654) );
  INVX1 U78 ( .A(N11), .Y(n16) );
  INVX2 U79 ( .A(N11), .Y(n355) );
  INVX1 U80 ( .A(N16), .Y(n17) );
  INVX4 U81 ( .A(n643), .Y(n18) );
  INVX8 U82 ( .A(n654), .Y(n656) );
  INVX4 U83 ( .A(n377), .Y(n393) );
  NAND2X1 U84 ( .A(n643), .B(N14), .Y(n19) );
  NAND2X1 U85 ( .A(n683), .B(n20), .Y(n411) );
  INVX1 U86 ( .A(n19), .Y(n20) );
  INVX4 U87 ( .A(N16), .Y(n643) );
  NAND2X1 U88 ( .A(N14), .B(n643), .Y(n21) );
  NAND2X1 U89 ( .A(n642), .B(n22), .Y(n412) );
  INVX2 U90 ( .A(n21), .Y(n22) );
  INVX1 U91 ( .A(n60), .Y(n23) );
  INVX2 U92 ( .A(n60), .Y(n24) );
  INVX4 U93 ( .A(n60), .Y(n368) );
  NAND3X1 U94 ( .A(n644), .B(n17), .C(n642), .Y(n25) );
  INVX4 U95 ( .A(n406), .Y(n652) );
  AND2X2 U96 ( .A(n61), .B(n37), .Y(n28) );
  INVX2 U97 ( .A(n408), .Y(n661) );
  INVX1 U98 ( .A(n361), .Y(n30) );
  INVX2 U99 ( .A(n30), .Y(n31) );
  INVX1 U100 ( .A(n368), .Y(n32) );
  INVX2 U101 ( .A(n32), .Y(n33) );
  BUFX4 U102 ( .A(n647), .Y(n648) );
  INVX2 U103 ( .A(n75), .Y(n359) );
  NAND2X1 U104 ( .A(n61), .B(n37), .Y(n34) );
  INVX2 U105 ( .A(n28), .Y(n379) );
  MUX2X1 U106 ( .B(n464), .A(n463), .S(n680), .Y(r2_data[4]) );
  BUFX2 U107 ( .A(n366), .Y(n35) );
  INVX4 U108 ( .A(n365), .Y(n366) );
  MUX2X1 U109 ( .B(n604), .A(n603), .S(n680), .Y(r2_data[14]) );
  INVX4 U110 ( .A(n373), .Y(n375) );
  MUX2X1 U111 ( .B(n534), .A(n533), .S(n680), .Y(r2_data[9]) );
  INVX8 U112 ( .A(n726), .Y(n727) );
  BUFX2 U113 ( .A(n370), .Y(n373) );
  INVX4 U114 ( .A(n675), .Y(n676) );
  BUFX4 U115 ( .A(n370), .Y(n372) );
  BUFX2 U116 ( .A(N12), .Y(n36) );
  NAND2X1 U117 ( .A(n642), .B(n29), .Y(n413) );
  INVX2 U118 ( .A(n664), .Y(n38) );
  INVX2 U119 ( .A(n664), .Y(n39) );
  INVX2 U120 ( .A(n661), .Y(n40) );
  INVX2 U121 ( .A(n661), .Y(n41) );
  INVX2 U122 ( .A(n717), .Y(n42) );
  INVX2 U123 ( .A(n717), .Y(n43) );
  INVX4 U124 ( .A(w_data[12]), .Y(n717) );
  INVX2 U125 ( .A(n701), .Y(n44) );
  INVX2 U126 ( .A(n701), .Y(n45) );
  INVX2 U127 ( .A(n708), .Y(n46) );
  INVX2 U128 ( .A(n708), .Y(n47) );
  INVX2 U129 ( .A(n706), .Y(n48) );
  INVX2 U130 ( .A(n706), .Y(n49) );
  INVX4 U131 ( .A(w_data[8]), .Y(n706) );
  INVX2 U132 ( .A(n703), .Y(n50) );
  INVX2 U133 ( .A(n703), .Y(n51) );
  INVX2 U134 ( .A(n720), .Y(n52) );
  INVX2 U135 ( .A(n720), .Y(n53) );
  INVX4 U136 ( .A(n393), .Y(n392) );
  INVX2 U137 ( .A(n711), .Y(n54) );
  INVX2 U138 ( .A(n711), .Y(n55) );
  INVX2 U139 ( .A(n714), .Y(n56) );
  INVX2 U140 ( .A(n714), .Y(n57) );
  INVX2 U141 ( .A(n723), .Y(n58) );
  INVX2 U142 ( .A(n723), .Y(n59) );
  INVX4 U143 ( .A(w_data[14]), .Y(n723) );
  INVX4 U144 ( .A(w_data[15]), .Y(n726) );
  INVX2 U145 ( .A(N17), .Y(n680) );
  INVX2 U146 ( .A(w_data[3]), .Y(n692) );
  INVX2 U147 ( .A(w_data[2]), .Y(n689) );
  INVX2 U148 ( .A(w_data[4]), .Y(n695) );
  INVX2 U149 ( .A(w_data[5]), .Y(n698) );
  INVX2 U150 ( .A(w_data[1]), .Y(n686) );
  INVX2 U151 ( .A(n664), .Y(n666) );
  INVX2 U152 ( .A(n664), .Y(n667) );
  INVX2 U153 ( .A(n664), .Y(n665) );
  INVX2 U154 ( .A(n661), .Y(n662) );
  INVX2 U155 ( .A(n680), .Y(n679) );
  INVX2 U156 ( .A(n680), .Y(n678) );
  AND2X2 U157 ( .A(n61), .B(n36), .Y(n60) );
  INVX2 U158 ( .A(n720), .Y(n722) );
  INVX2 U159 ( .A(n720), .Y(n721) );
  INVX2 U160 ( .A(n703), .Y(n705) );
  INVX2 U161 ( .A(n708), .Y(n710) );
  INVX2 U162 ( .A(n714), .Y(n716) );
  INVX2 U163 ( .A(n703), .Y(n704) );
  INVX2 U164 ( .A(n723), .Y(n725) );
  INVX2 U165 ( .A(n711), .Y(n713) );
  INVX2 U166 ( .A(n717), .Y(n719) );
  INVX2 U167 ( .A(n706), .Y(n707) );
  INVX2 U168 ( .A(n708), .Y(n709) );
  INVX2 U169 ( .A(n701), .Y(n702) );
  INVX2 U170 ( .A(n714), .Y(n715) );
  INVX2 U171 ( .A(n723), .Y(n724) );
  INVX2 U172 ( .A(n711), .Y(n712) );
  INVX2 U173 ( .A(n717), .Y(n718) );
  INVX2 U174 ( .A(n692), .Y(n694) );
  INVX2 U175 ( .A(n689), .Y(n691) );
  INVX2 U176 ( .A(n692), .Y(n693) );
  INVX2 U177 ( .A(n689), .Y(n690) );
  INVX2 U178 ( .A(n695), .Y(n697) );
  INVX2 U179 ( .A(n695), .Y(n696) );
  INVX2 U180 ( .A(n698), .Y(n700) );
  INVX2 U181 ( .A(n698), .Y(n699) );
  INVX2 U182 ( .A(n684), .Y(n685) );
  INVX2 U183 ( .A(n686), .Y(n687) );
  INVX2 U184 ( .A(n686), .Y(n688) );
  INVX2 U185 ( .A(\regs_matrix[3][1] ), .Y(n382) );
  INVX2 U186 ( .A(w_data[0]), .Y(n684) );
  BUFX2 U187 ( .A(n_reset), .Y(n728) );
  BUFX2 U188 ( .A(n_reset), .Y(n729) );
  BUFX2 U189 ( .A(n_reset), .Y(n730) );
  BUFX2 U190 ( .A(n_reset), .Y(n731) );
  BUFX2 U191 ( .A(n_reset), .Y(n732) );
  BUFX2 U192 ( .A(n_reset), .Y(n733) );
  BUFX2 U193 ( .A(n_reset), .Y(n734) );
  BUFX2 U194 ( .A(n_reset), .Y(n735) );
  AOI22X1 U195 ( .A(n65), .B(n64), .C(n63), .D(n62), .Y(n66) );
  INVX2 U196 ( .A(N13), .Y(n67) );
  INVX2 U197 ( .A(n66), .Y(r1_data[16]) );
  AOI22X1 U198 ( .A(n69), .B(n70), .C(n71), .D(n72), .Y(n68) );
  NOR2X1 U199 ( .A(n73), .B(n74), .Y(n72) );
  OAI22X1 U200 ( .A(\regs_matrix[6][0] ), .B(n361), .C(outreg_data[0]), .D(
        n364), .Y(n74) );
  OAI21X1 U201 ( .A(\regs_matrix[4][0] ), .B(n366), .C(n67), .Y(n73) );
  NOR2X1 U202 ( .A(n78), .B(n79), .Y(n71) );
  OAI21X1 U203 ( .A(\regs_matrix[7][0] ), .B(n368), .C(n80), .Y(n79) );
  AOI22X1 U204 ( .A(n383), .B(n81), .C(n28), .D(n82), .Y(n80) );
  INVX2 U205 ( .A(\regs_matrix[3][0] ), .Y(n82) );
  INVX2 U206 ( .A(\regs_matrix[1][0] ), .Y(n81) );
  OAI22X1 U207 ( .A(\regs_matrix[2][0] ), .B(n374), .C(\regs_matrix[5][0] ), 
        .D(n4), .Y(n78) );
  NOR2X1 U208 ( .A(n85), .B(n86), .Y(n70) );
  OAI22X1 U209 ( .A(\regs_matrix[14][0] ), .B(n31), .C(\regs_matrix[8][0] ), 
        .D(n388), .Y(n86) );
  OAI21X1 U210 ( .A(\regs_matrix[12][0] ), .B(n387), .C(N13), .Y(n85) );
  NOR2X1 U211 ( .A(n87), .B(n88), .Y(n69) );
  OAI21X1 U212 ( .A(\regs_matrix[15][0] ), .B(n33), .C(n89), .Y(n88) );
  AOI22X1 U213 ( .A(n27), .B(n90), .C(n390), .D(n91), .Y(n89) );
  INVX2 U214 ( .A(\regs_matrix[11][0] ), .Y(n91) );
  INVX2 U215 ( .A(\regs_matrix[9][0] ), .Y(n90) );
  OAI22X1 U216 ( .A(\regs_matrix[10][0] ), .B(n374), .C(\regs_matrix[13][0] ), 
        .D(n4), .Y(n87) );
  AOI22X1 U217 ( .A(n93), .B(n94), .C(n95), .D(n96), .Y(n92) );
  NOR2X1 U218 ( .A(n97), .B(n98), .Y(n96) );
  OAI22X1 U219 ( .A(\regs_matrix[8][1] ), .B(n388), .C(\regs_matrix[10][1] ), 
        .D(n384), .Y(n98) );
  OAI22X1 U220 ( .A(\regs_matrix[12][1] ), .B(n387), .C(\regs_matrix[14][1] ), 
        .D(n31), .Y(n97) );
  NOR3X1 U221 ( .A(n99), .B(n100), .C(n101), .Y(n95) );
  OAI21X1 U222 ( .A(\regs_matrix[9][1] ), .B(n369), .C(N13), .Y(n101) );
  NOR2X1 U223 ( .A(\regs_matrix[11][1] ), .B(n386), .Y(n100) );
  OAI22X1 U224 ( .A(\regs_matrix[13][1] ), .B(n4), .C(\regs_matrix[15][1] ), 
        .D(n33), .Y(n99) );
  NOR2X1 U225 ( .A(n104), .B(n103), .Y(n94) );
  OAI22X1 U226 ( .A(outreg_data[1]), .B(n364), .C(\regs_matrix[2][1] ), .D(
        n389), .Y(n104) );
  OAI22X1 U227 ( .A(\regs_matrix[4][1] ), .B(n366), .C(\regs_matrix[6][1] ), 
        .D(n360), .Y(n103) );
  NOR3X1 U228 ( .A(n107), .B(n106), .C(n105), .Y(n93) );
  OAI21X1 U229 ( .A(\regs_matrix[1][1] ), .B(n102), .C(n67), .Y(n107) );
  OAI22X1 U230 ( .A(\regs_matrix[5][1] ), .B(n3), .C(\regs_matrix[7][1] ), .D(
        n23), .Y(n105) );
  AOI22X1 U231 ( .A(n109), .B(n110), .C(n111), .D(n112), .Y(n108) );
  NOR2X1 U232 ( .A(n113), .B(n114), .Y(n112) );
  OAI22X1 U233 ( .A(outreg_data[2]), .B(n364), .C(\regs_matrix[2][2] ), .D(n14), .Y(n114) );
  OAI22X1 U234 ( .A(\regs_matrix[4][2] ), .B(n366), .C(\regs_matrix[6][2] ), 
        .D(n361), .Y(n113) );
  NOR2X1 U235 ( .A(n115), .B(n116), .Y(n111) );
  OAI21X1 U236 ( .A(\regs_matrix[3][2] ), .B(n34), .C(n117), .Y(n116) );
  AOI21X1 U237 ( .A(n383), .B(n118), .C(N13), .Y(n117) );
  INVX2 U238 ( .A(\regs_matrix[1][2] ), .Y(n118) );
  OAI22X1 U239 ( .A(\regs_matrix[5][2] ), .B(n4), .C(\regs_matrix[7][2] ), .D(
        n24), .Y(n115) );
  NOR2X1 U240 ( .A(n119), .B(n120), .Y(n110) );
  OAI22X1 U241 ( .A(\regs_matrix[8][2] ), .B(n388), .C(\regs_matrix[10][2] ), 
        .D(n384), .Y(n120) );
  OAI22X1 U242 ( .A(\regs_matrix[12][2] ), .B(n387), .C(\regs_matrix[14][2] ), 
        .D(n31), .Y(n119) );
  NOR2X1 U243 ( .A(n121), .B(n122), .Y(n109) );
  OAI21X1 U244 ( .A(\regs_matrix[11][2] ), .B(n386), .C(n123), .Y(n122) );
  AOI21X1 U245 ( .A(n27), .B(n124), .C(n67), .Y(n123) );
  INVX2 U246 ( .A(\regs_matrix[9][2] ), .Y(n124) );
  OAI22X1 U247 ( .A(\regs_matrix[13][2] ), .B(n4), .C(\regs_matrix[15][2] ), 
        .D(n33), .Y(n121) );
  AOI22X1 U248 ( .A(n126), .B(n127), .C(n128), .D(n129), .Y(n125) );
  NOR2X1 U249 ( .A(n131), .B(n130), .Y(n129) );
  OAI22X1 U250 ( .A(outreg_data[3]), .B(n364), .C(\regs_matrix[2][3] ), .D(n15), .Y(n131) );
  OAI22X1 U251 ( .A(\regs_matrix[4][3] ), .B(n367), .C(\regs_matrix[6][3] ), 
        .D(n360), .Y(n130) );
  NOR2X1 U252 ( .A(n132), .B(n133), .Y(n128) );
  OAI21X1 U253 ( .A(\regs_matrix[3][3] ), .B(n34), .C(n134), .Y(n133) );
  AOI21X1 U254 ( .A(n135), .B(n383), .C(N13), .Y(n134) );
  INVX2 U255 ( .A(\regs_matrix[1][3] ), .Y(n135) );
  OAI22X1 U256 ( .A(\regs_matrix[5][3] ), .B(n4), .C(\regs_matrix[7][3] ), .D(
        n368), .Y(n132) );
  NOR2X1 U257 ( .A(n136), .B(n137), .Y(n127) );
  OAI22X1 U258 ( .A(\regs_matrix[8][3] ), .B(n388), .C(\regs_matrix[10][3] ), 
        .D(n384), .Y(n137) );
  OAI22X1 U259 ( .A(\regs_matrix[12][3] ), .B(n387), .C(\regs_matrix[14][3] ), 
        .D(n31), .Y(n136) );
  NOR2X1 U260 ( .A(n138), .B(n139), .Y(n126) );
  OAI21X1 U261 ( .A(\regs_matrix[11][3] ), .B(n386), .C(n140), .Y(n139) );
  AOI21X1 U262 ( .A(n27), .B(n141), .C(n67), .Y(n140) );
  INVX2 U263 ( .A(\regs_matrix[9][3] ), .Y(n141) );
  OAI22X1 U264 ( .A(\regs_matrix[13][3] ), .B(n4), .C(\regs_matrix[15][3] ), 
        .D(n33), .Y(n138) );
  AOI22X1 U265 ( .A(n143), .B(n144), .C(n145), .D(n146), .Y(n142) );
  NOR2X1 U266 ( .A(n147), .B(n148), .Y(n146) );
  OAI22X1 U267 ( .A(outreg_data[4]), .B(n363), .C(\regs_matrix[2][4] ), .D(
        n375), .Y(n148) );
  OAI22X1 U268 ( .A(\regs_matrix[4][4] ), .B(n366), .C(\regs_matrix[6][4] ), 
        .D(n361), .Y(n147) );
  NOR2X1 U269 ( .A(n150), .B(n149), .Y(n145) );
  OAI21X1 U270 ( .A(\regs_matrix[3][4] ), .B(n379), .C(n151), .Y(n150) );
  AOI21X1 U271 ( .A(n383), .B(n152), .C(N13), .Y(n151) );
  INVX2 U272 ( .A(\regs_matrix[1][4] ), .Y(n152) );
  OAI22X1 U273 ( .A(\regs_matrix[5][4] ), .B(n4), .C(\regs_matrix[7][4] ), .D(
        n368), .Y(n149) );
  NOR2X1 U274 ( .A(n153), .B(n154), .Y(n144) );
  OAI22X1 U275 ( .A(\regs_matrix[8][4] ), .B(n388), .C(\regs_matrix[10][4] ), 
        .D(n384), .Y(n154) );
  OAI22X1 U276 ( .A(\regs_matrix[12][4] ), .B(n387), .C(\regs_matrix[14][4] ), 
        .D(n31), .Y(n153) );
  NOR2X1 U277 ( .A(n155), .B(n156), .Y(n143) );
  OAI21X1 U278 ( .A(\regs_matrix[11][4] ), .B(n386), .C(n157), .Y(n156) );
  AOI21X1 U279 ( .A(n27), .B(n158), .C(n67), .Y(n157) );
  INVX2 U280 ( .A(\regs_matrix[9][4] ), .Y(n158) );
  OAI22X1 U281 ( .A(\regs_matrix[13][4] ), .B(n4), .C(\regs_matrix[15][4] ), 
        .D(n33), .Y(n155) );
  AOI22X1 U282 ( .A(n160), .B(n161), .C(n162), .D(n163), .Y(n159) );
  NOR2X1 U283 ( .A(n164), .B(n165), .Y(n163) );
  OAI22X1 U284 ( .A(outreg_data[5]), .B(n364), .C(\regs_matrix[2][5] ), .D(
        n389), .Y(n165) );
  OAI22X1 U285 ( .A(\regs_matrix[4][5] ), .B(n367), .C(\regs_matrix[6][5] ), 
        .D(n360), .Y(n164) );
  NOR2X1 U286 ( .A(n166), .B(n167), .Y(n162) );
  AOI21X1 U287 ( .A(n383), .B(n169), .C(N13), .Y(n168) );
  INVX2 U288 ( .A(\regs_matrix[1][5] ), .Y(n169) );
  OAI22X1 U289 ( .A(\regs_matrix[5][5] ), .B(n3), .C(\regs_matrix[7][5] ), .D(
        n368), .Y(n166) );
  NOR2X1 U290 ( .A(n170), .B(n171), .Y(n161) );
  OAI22X1 U291 ( .A(\regs_matrix[8][5] ), .B(n388), .C(\regs_matrix[10][5] ), 
        .D(n384), .Y(n171) );
  OAI22X1 U292 ( .A(\regs_matrix[12][5] ), .B(n387), .C(\regs_matrix[14][5] ), 
        .D(n31), .Y(n170) );
  NOR2X1 U293 ( .A(n172), .B(n173), .Y(n160) );
  OAI21X1 U294 ( .A(\regs_matrix[11][5] ), .B(n386), .C(n174), .Y(n173) );
  AOI21X1 U295 ( .A(n27), .B(n175), .C(n67), .Y(n174) );
  INVX2 U296 ( .A(\regs_matrix[9][5] ), .Y(n175) );
  OAI22X1 U297 ( .A(\regs_matrix[13][5] ), .B(n4), .C(\regs_matrix[15][5] ), 
        .D(n33), .Y(n172) );
  AOI22X1 U298 ( .A(n177), .B(n178), .C(n179), .D(n180), .Y(n176) );
  NOR2X1 U299 ( .A(n182), .B(n181), .Y(n180) );
  OAI22X1 U300 ( .A(outreg_data[6]), .B(n363), .C(\regs_matrix[2][6] ), .D(n14), .Y(n182) );
  OAI22X1 U301 ( .A(\regs_matrix[4][6] ), .B(n366), .C(\regs_matrix[6][6] ), 
        .D(n360), .Y(n181) );
  NOR2X1 U302 ( .A(n184), .B(n183), .Y(n179) );
  OAI21X1 U303 ( .A(\regs_matrix[3][6] ), .B(n34), .C(n185), .Y(n184) );
  AOI21X1 U304 ( .A(n383), .B(n186), .C(N13), .Y(n185) );
  INVX2 U305 ( .A(\regs_matrix[1][6] ), .Y(n186) );
  OAI22X1 U306 ( .A(\regs_matrix[5][6] ), .B(n377), .C(\regs_matrix[7][6] ), 
        .D(n368), .Y(n183) );
  NOR2X1 U307 ( .A(n187), .B(n188), .Y(n178) );
  OAI22X1 U308 ( .A(\regs_matrix[8][6] ), .B(n388), .C(\regs_matrix[10][6] ), 
        .D(n384), .Y(n188) );
  OAI22X1 U309 ( .A(\regs_matrix[12][6] ), .B(n35), .C(\regs_matrix[14][6] ), 
        .D(n31), .Y(n187) );
  NOR2X1 U310 ( .A(n189), .B(n190), .Y(n177) );
  OAI21X1 U311 ( .A(\regs_matrix[11][6] ), .B(n386), .C(n191), .Y(n190) );
  AOI21X1 U312 ( .A(n27), .B(n192), .C(n67), .Y(n191) );
  INVX2 U313 ( .A(\regs_matrix[9][6] ), .Y(n192) );
  OAI22X1 U314 ( .A(\regs_matrix[13][6] ), .B(n391), .C(\regs_matrix[15][6] ), 
        .D(n33), .Y(n189) );
  AOI22X1 U315 ( .A(n194), .B(n195), .C(n196), .D(n197), .Y(n193) );
  NOR2X1 U316 ( .A(n199), .B(n198), .Y(n197) );
  OAI22X1 U317 ( .A(outreg_data[7]), .B(n363), .C(\regs_matrix[2][7] ), .D(n15), .Y(n199) );
  OAI22X1 U318 ( .A(\regs_matrix[4][7] ), .B(n367), .C(\regs_matrix[6][7] ), 
        .D(n360), .Y(n198) );
  NOR2X1 U319 ( .A(n200), .B(n201), .Y(n196) );
  OAI21X1 U320 ( .A(\regs_matrix[3][7] ), .B(n34), .C(n202), .Y(n201) );
  AOI21X1 U321 ( .A(n383), .B(n203), .C(N13), .Y(n202) );
  INVX2 U322 ( .A(\regs_matrix[1][7] ), .Y(n203) );
  OAI22X1 U323 ( .A(\regs_matrix[5][7] ), .B(n392), .C(\regs_matrix[7][7] ), 
        .D(n24), .Y(n200) );
  NOR2X1 U324 ( .A(n204), .B(n205), .Y(n195) );
  OAI22X1 U325 ( .A(\regs_matrix[8][7] ), .B(n363), .C(\regs_matrix[10][7] ), 
        .D(n384), .Y(n205) );
  OAI22X1 U326 ( .A(\regs_matrix[12][7] ), .B(n35), .C(\regs_matrix[14][7] ), 
        .D(n31), .Y(n204) );
  NOR2X1 U327 ( .A(n206), .B(n207), .Y(n194) );
  OAI21X1 U328 ( .A(\regs_matrix[11][7] ), .B(n386), .C(n208), .Y(n207) );
  AOI21X1 U329 ( .A(n27), .B(n209), .C(n67), .Y(n208) );
  INVX2 U330 ( .A(\regs_matrix[9][7] ), .Y(n209) );
  OAI22X1 U331 ( .A(\regs_matrix[13][7] ), .B(n391), .C(\regs_matrix[15][7] ), 
        .D(n33), .Y(n206) );
  AOI22X1 U332 ( .A(n211), .B(n212), .C(n213), .D(n214), .Y(n210) );
  NOR2X1 U333 ( .A(n215), .B(n216), .Y(n214) );
  OAI22X1 U334 ( .A(outreg_data[8]), .B(n363), .C(\regs_matrix[2][8] ), .D(
        n375), .Y(n216) );
  OAI22X1 U335 ( .A(\regs_matrix[4][8] ), .B(n367), .C(\regs_matrix[6][8] ), 
        .D(n360), .Y(n215) );
  NOR2X1 U336 ( .A(n217), .B(n218), .Y(n213) );
  OAI21X1 U337 ( .A(\regs_matrix[3][8] ), .B(n379), .C(n219), .Y(n218) );
  AOI21X1 U338 ( .A(n383), .B(n220), .C(N13), .Y(n219) );
  INVX2 U339 ( .A(\regs_matrix[1][8] ), .Y(n220) );
  OAI22X1 U340 ( .A(\regs_matrix[5][8] ), .B(n392), .C(\regs_matrix[7][8] ), 
        .D(n368), .Y(n217) );
  NOR2X1 U341 ( .A(n221), .B(n222), .Y(n212) );
  OAI22X1 U342 ( .A(\regs_matrix[8][8] ), .B(n363), .C(\regs_matrix[10][8] ), 
        .D(n384), .Y(n222) );
  OAI22X1 U343 ( .A(\regs_matrix[12][8] ), .B(n35), .C(\regs_matrix[14][8] ), 
        .D(n31), .Y(n221) );
  NOR2X1 U344 ( .A(n223), .B(n224), .Y(n211) );
  OAI21X1 U345 ( .A(\regs_matrix[11][8] ), .B(n386), .C(n225), .Y(n224) );
  AOI21X1 U346 ( .A(n27), .B(n226), .C(n67), .Y(n225) );
  INVX2 U347 ( .A(\regs_matrix[9][8] ), .Y(n226) );
  OAI22X1 U348 ( .A(\regs_matrix[13][8] ), .B(n391), .C(\regs_matrix[15][8] ), 
        .D(n33), .Y(n223) );
  AOI22X1 U349 ( .A(n228), .B(n229), .C(n230), .D(n231), .Y(n227) );
  NOR2X1 U350 ( .A(n232), .B(n233), .Y(n231) );
  OAI22X1 U351 ( .A(outreg_data[9]), .B(n363), .C(\regs_matrix[2][9] ), .D(
        n375), .Y(n233) );
  OAI22X1 U352 ( .A(\regs_matrix[4][9] ), .B(n366), .C(\regs_matrix[6][9] ), 
        .D(n361), .Y(n232) );
  NOR2X1 U353 ( .A(n234), .B(n235), .Y(n230) );
  OAI21X1 U354 ( .A(\regs_matrix[3][9] ), .B(n379), .C(n236), .Y(n235) );
  AOI21X1 U355 ( .A(n383), .B(n237), .C(N13), .Y(n236) );
  INVX2 U356 ( .A(\regs_matrix[1][9] ), .Y(n237) );
  OAI22X1 U357 ( .A(\regs_matrix[5][9] ), .B(n377), .C(\regs_matrix[7][9] ), 
        .D(n24), .Y(n234) );
  NOR2X1 U358 ( .A(n238), .B(n239), .Y(n229) );
  OAI22X1 U359 ( .A(\regs_matrix[8][9] ), .B(n363), .C(\regs_matrix[10][9] ), 
        .D(n384), .Y(n239) );
  OAI22X1 U360 ( .A(\regs_matrix[12][9] ), .B(n35), .C(\regs_matrix[14][9] ), 
        .D(n31), .Y(n238) );
  NOR2X1 U361 ( .A(n240), .B(n241), .Y(n228) );
  OAI21X1 U362 ( .A(\regs_matrix[11][9] ), .B(n386), .C(n242), .Y(n241) );
  AOI21X1 U363 ( .A(n27), .B(n243), .C(n67), .Y(n242) );
  INVX2 U364 ( .A(\regs_matrix[9][9] ), .Y(n243) );
  OAI22X1 U365 ( .A(\regs_matrix[13][9] ), .B(n391), .C(\regs_matrix[15][9] ), 
        .D(n33), .Y(n240) );
  AOI22X1 U366 ( .A(n245), .B(n246), .C(n247), .D(n248), .Y(n244) );
  NOR2X1 U367 ( .A(n249), .B(n250), .Y(n248) );
  OAI22X1 U368 ( .A(outreg_data[10]), .B(n363), .C(\regs_matrix[2][10] ), .D(
        n375), .Y(n250) );
  OAI22X1 U369 ( .A(\regs_matrix[4][10] ), .B(n367), .C(\regs_matrix[6][10] ), 
        .D(n361), .Y(n249) );
  NOR2X1 U370 ( .A(n251), .B(n252), .Y(n247) );
  OAI21X1 U371 ( .A(\regs_matrix[3][10] ), .B(n379), .C(n253), .Y(n252) );
  AOI21X1 U372 ( .A(n383), .B(n254), .C(N13), .Y(n253) );
  INVX2 U373 ( .A(\regs_matrix[1][10] ), .Y(n254) );
  OAI22X1 U374 ( .A(\regs_matrix[5][10] ), .B(n3), .C(\regs_matrix[7][10] ), 
        .D(n368), .Y(n251) );
  NOR2X1 U375 ( .A(n255), .B(n256), .Y(n246) );
  OAI22X1 U376 ( .A(\regs_matrix[8][10] ), .B(n363), .C(\regs_matrix[10][10] ), 
        .D(n384), .Y(n256) );
  OAI22X1 U377 ( .A(\regs_matrix[12][10] ), .B(n35), .C(\regs_matrix[14][10] ), 
        .D(n31), .Y(n255) );
  NOR2X1 U378 ( .A(n257), .B(n258), .Y(n245) );
  OAI21X1 U379 ( .A(\regs_matrix[11][10] ), .B(n386), .C(n259), .Y(n258) );
  AOI21X1 U380 ( .A(n27), .B(n260), .C(n67), .Y(n259) );
  INVX2 U381 ( .A(\regs_matrix[9][10] ), .Y(n260) );
  OAI22X1 U382 ( .A(\regs_matrix[13][10] ), .B(n391), .C(\regs_matrix[15][10] ), .D(n33), .Y(n257) );
  AOI22X1 U383 ( .A(n262), .B(n263), .C(n264), .D(n265), .Y(n261) );
  NOR2X1 U384 ( .A(n267), .B(n266), .Y(n265) );
  OAI22X1 U385 ( .A(outreg_data[11]), .B(n363), .C(\regs_matrix[2][11] ), .D(
        n374), .Y(n267) );
  OAI22X1 U386 ( .A(\regs_matrix[4][11] ), .B(n367), .C(\regs_matrix[6][11] ), 
        .D(n360), .Y(n266) );
  NOR2X1 U387 ( .A(n269), .B(n268), .Y(n264) );
  OAI21X1 U388 ( .A(\regs_matrix[3][11] ), .B(n34), .C(n270), .Y(n269) );
  AOI21X1 U389 ( .A(n383), .B(n271), .C(N13), .Y(n270) );
  INVX2 U390 ( .A(\regs_matrix[1][11] ), .Y(n271) );
  OAI22X1 U391 ( .A(\regs_matrix[5][11] ), .B(n4), .C(\regs_matrix[7][11] ), 
        .D(n24), .Y(n268) );
  NOR2X1 U392 ( .A(n272), .B(n273), .Y(n263) );
  OAI22X1 U393 ( .A(\regs_matrix[8][11] ), .B(n388), .C(\regs_matrix[10][11] ), 
        .D(n384), .Y(n273) );
  OAI22X1 U394 ( .A(\regs_matrix[12][11] ), .B(n35), .C(\regs_matrix[14][11] ), 
        .D(n31), .Y(n272) );
  NOR2X1 U395 ( .A(n274), .B(n275), .Y(n262) );
  OAI21X1 U396 ( .A(\regs_matrix[11][11] ), .B(n386), .C(n276), .Y(n275) );
  AOI21X1 U397 ( .A(n27), .B(n277), .C(n67), .Y(n276) );
  INVX2 U398 ( .A(\regs_matrix[9][11] ), .Y(n277) );
  OAI22X1 U399 ( .A(\regs_matrix[13][11] ), .B(n391), .C(\regs_matrix[15][11] ), .D(n33), .Y(n274) );
  AOI22X1 U400 ( .A(n279), .B(n280), .C(n281), .D(n282), .Y(n278) );
  NOR2X1 U401 ( .A(n283), .B(n284), .Y(n282) );
  OAI22X1 U402 ( .A(outreg_data[12]), .B(n363), .C(\regs_matrix[2][12] ), .D(
        n375), .Y(n284) );
  OAI22X1 U403 ( .A(n366), .B(\regs_matrix[4][12] ), .C(\regs_matrix[6][12] ), 
        .D(n361), .Y(n283) );
  NOR2X1 U404 ( .A(n285), .B(n286), .Y(n281) );
  OAI21X1 U405 ( .A(\regs_matrix[3][12] ), .B(n379), .C(n287), .Y(n286) );
  AOI21X1 U406 ( .A(n383), .B(n288), .C(N13), .Y(n287) );
  INVX2 U407 ( .A(\regs_matrix[1][12] ), .Y(n288) );
  OAI22X1 U408 ( .A(\regs_matrix[5][12] ), .B(n377), .C(\regs_matrix[7][12] ), 
        .D(n368), .Y(n285) );
  NOR2X1 U409 ( .A(n289), .B(n290), .Y(n280) );
  OAI22X1 U410 ( .A(\regs_matrix[8][12] ), .B(n363), .C(\regs_matrix[10][12] ), 
        .D(n384), .Y(n290) );
  OAI22X1 U411 ( .A(\regs_matrix[12][12] ), .B(n35), .C(\regs_matrix[14][12] ), 
        .D(n31), .Y(n289) );
  NOR2X1 U412 ( .A(n291), .B(n292), .Y(n279) );
  OAI21X1 U413 ( .A(\regs_matrix[11][12] ), .B(n386), .C(n293), .Y(n292) );
  AOI21X1 U414 ( .A(n27), .B(n294), .C(n67), .Y(n293) );
  INVX2 U415 ( .A(\regs_matrix[9][12] ), .Y(n294) );
  OAI22X1 U416 ( .A(\regs_matrix[13][12] ), .B(n391), .C(\regs_matrix[15][12] ), .D(n33), .Y(n291) );
  AOI22X1 U417 ( .A(n296), .B(n297), .C(n298), .D(n299), .Y(n295) );
  NOR2X1 U418 ( .A(n301), .B(n300), .Y(n299) );
  OAI22X1 U419 ( .A(outreg_data[13]), .B(n363), .C(\regs_matrix[2][13] ), .D(
        n374), .Y(n301) );
  OAI22X1 U420 ( .A(\regs_matrix[4][13] ), .B(n367), .C(\regs_matrix[6][13] ), 
        .D(n361), .Y(n300) );
  NOR2X1 U421 ( .A(n302), .B(n303), .Y(n298) );
  OAI21X1 U422 ( .A(\regs_matrix[3][13] ), .B(n34), .C(n304), .Y(n303) );
  AOI21X1 U423 ( .A(n383), .B(n305), .C(N13), .Y(n304) );
  INVX2 U424 ( .A(\regs_matrix[1][13] ), .Y(n305) );
  OAI22X1 U425 ( .A(\regs_matrix[5][13] ), .B(n377), .C(\regs_matrix[7][13] ), 
        .D(n368), .Y(n302) );
  NOR2X1 U426 ( .A(n306), .B(n307), .Y(n297) );
  OAI22X1 U427 ( .A(\regs_matrix[8][13] ), .B(n388), .C(\regs_matrix[10][13] ), 
        .D(n374), .Y(n307) );
  OAI22X1 U428 ( .A(\regs_matrix[12][13] ), .B(n35), .C(\regs_matrix[14][13] ), 
        .D(n361), .Y(n306) );
  NOR2X1 U429 ( .A(n308), .B(n309), .Y(n296) );
  OAI21X1 U430 ( .A(\regs_matrix[11][13] ), .B(n386), .C(n310), .Y(n309) );
  AOI21X1 U431 ( .A(n27), .B(n311), .C(n67), .Y(n310) );
  INVX2 U432 ( .A(\regs_matrix[9][13] ), .Y(n311) );
  OAI22X1 U433 ( .A(\regs_matrix[13][13] ), .B(n391), .C(\regs_matrix[15][13] ), .D(n33), .Y(n308) );
  AOI22X1 U434 ( .A(n313), .B(n314), .C(n315), .D(n316), .Y(n312) );
  NOR2X1 U435 ( .A(n317), .B(n318), .Y(n316) );
  OAI22X1 U436 ( .A(outreg_data[14]), .B(n363), .C(\regs_matrix[2][14] ), .D(
        n374), .Y(n318) );
  OAI22X1 U437 ( .A(\regs_matrix[4][14] ), .B(n366), .C(\regs_matrix[6][14] ), 
        .D(n361), .Y(n317) );
  NOR2X1 U438 ( .A(n319), .B(n320), .Y(n315) );
  OAI21X1 U439 ( .A(\regs_matrix[3][14] ), .B(n379), .C(n321), .Y(n320) );
  AOI21X1 U440 ( .A(n383), .B(n322), .C(N13), .Y(n321) );
  INVX2 U441 ( .A(\regs_matrix[1][14] ), .Y(n322) );
  OAI22X1 U442 ( .A(\regs_matrix[5][14] ), .B(n377), .C(\regs_matrix[7][14] ), 
        .D(n368), .Y(n319) );
  NOR2X1 U443 ( .A(n323), .B(n324), .Y(n314) );
  OAI22X1 U444 ( .A(\regs_matrix[8][14] ), .B(n363), .C(\regs_matrix[10][14] ), 
        .D(n374), .Y(n324) );
  OAI22X1 U445 ( .A(\regs_matrix[12][14] ), .B(n387), .C(\regs_matrix[14][14] ), .D(n31), .Y(n323) );
  NOR2X1 U446 ( .A(n325), .B(n326), .Y(n313) );
  OAI21X1 U447 ( .A(\regs_matrix[11][14] ), .B(n386), .C(n327), .Y(n326) );
  AOI21X1 U448 ( .A(n27), .B(n328), .C(n67), .Y(n327) );
  INVX2 U449 ( .A(\regs_matrix[9][14] ), .Y(n328) );
  OAI22X1 U450 ( .A(\regs_matrix[13][14] ), .B(n391), .C(\regs_matrix[15][14] ), .D(n33), .Y(n325) );
  AOI22X1 U451 ( .A(n330), .B(n331), .C(n332), .D(n333), .Y(n329) );
  NOR2X1 U452 ( .A(n334), .B(n335), .Y(n333) );
  OAI22X1 U453 ( .A(outreg_data[15]), .B(n364), .C(\regs_matrix[2][15] ), .D(
        n374), .Y(n335) );
  OAI22X1 U454 ( .A(\regs_matrix[4][15] ), .B(n367), .C(\regs_matrix[6][15] ), 
        .D(n360), .Y(n334) );
  NOR2X1 U455 ( .A(n336), .B(n337), .Y(n332) );
  OAI21X1 U456 ( .A(\regs_matrix[3][15] ), .B(n34), .C(n338), .Y(n337) );
  AOI21X1 U457 ( .A(n383), .B(n339), .C(N13), .Y(n338) );
  INVX2 U458 ( .A(\regs_matrix[1][15] ), .Y(n339) );
  OAI22X1 U459 ( .A(\regs_matrix[5][15] ), .B(n377), .C(\regs_matrix[7][15] ), 
        .D(n368), .Y(n336) );
  NOR2X1 U460 ( .A(n340), .B(n341), .Y(n331) );
  OAI22X1 U461 ( .A(\regs_matrix[8][15] ), .B(n388), .C(\regs_matrix[10][15] ), 
        .D(n374), .Y(n341) );
  OAI22X1 U462 ( .A(\regs_matrix[12][15] ), .B(n35), .C(\regs_matrix[14][15] ), 
        .D(n31), .Y(n340) );
  NOR2X1 U463 ( .A(n342), .B(n343), .Y(n330) );
  OAI21X1 U464 ( .A(\regs_matrix[11][15] ), .B(n386), .C(n344), .Y(n343) );
  AOI21X1 U465 ( .A(n27), .B(n345), .C(n67), .Y(n344) );
  INVX2 U466 ( .A(\regs_matrix[9][15] ), .Y(n345) );
  OAI22X1 U467 ( .A(\regs_matrix[13][15] ), .B(n391), .C(\regs_matrix[15][15] ), .D(n33), .Y(n342) );
  NOR2X1 U468 ( .A(n346), .B(n347), .Y(n62) );
  OAI21X1 U469 ( .A(outreg_data[16]), .B(n364), .C(n348), .Y(n347) );
  AOI21X1 U470 ( .A(n385), .B(n349), .C(N13), .Y(n348) );
  INVX2 U471 ( .A(\regs_matrix[2][16] ), .Y(n349) );
  OAI22X1 U472 ( .A(\regs_matrix[4][16] ), .B(n387), .C(\regs_matrix[6][16] ), 
        .D(n361), .Y(n346) );
  NOR2X1 U473 ( .A(n350), .B(n351), .Y(n63) );
  OAI22X1 U474 ( .A(\regs_matrix[3][16] ), .B(n386), .C(\regs_matrix[1][16] ), 
        .D(n369), .Y(n351) );
  OAI22X1 U475 ( .A(\regs_matrix[5][16] ), .B(n4), .C(\regs_matrix[7][16] ), 
        .D(n33), .Y(n350) );
  NOR3X1 U476 ( .A(n352), .B(n353), .C(n354), .Y(n64) );
  OAI22X1 U477 ( .A(\regs_matrix[10][16] ), .B(n374), .C(\regs_matrix[8][16] ), 
        .D(n388), .Y(n354) );
  NAND3X1 U478 ( .A(n37), .B(n16), .C(n356), .Y(n76) );
  NAND3X1 U479 ( .A(N11), .B(n37), .C(n356), .Y(n83) );
  NOR2X1 U480 ( .A(\regs_matrix[12][16] ), .B(n387), .Y(n353) );
  NAND3X1 U481 ( .A(n36), .B(n356), .C(n16), .Y(n77) );
  OAI22X1 U482 ( .A(\regs_matrix[9][16] ), .B(n369), .C(\regs_matrix[14][16] ), 
        .D(n31), .Y(n352) );
  NAND3X1 U483 ( .A(n36), .B(n356), .C(N11), .Y(n75) );
  NAND3X1 U484 ( .A(N10), .B(n37), .C(n355), .Y(n102) );
  NOR2X1 U485 ( .A(n357), .B(n358), .Y(n65) );
  OAI21X1 U486 ( .A(\regs_matrix[11][16] ), .B(n386), .C(N13), .Y(n358) );
  OAI22X1 U487 ( .A(\regs_matrix[15][16] ), .B(n33), .C(\regs_matrix[13][16] ), 
        .D(n4), .Y(n357) );
  NAND3X1 U488 ( .A(N12), .B(N10), .C(n355), .Y(n84) );
  INVX8 U489 ( .A(n372), .Y(n374) );
  INVX4 U490 ( .A(n68), .Y(r1_data[0]) );
  INVX2 U491 ( .A(n83), .Y(n370) );
  INVX2 U492 ( .A(\regs_matrix[3][5] ), .Y(n381) );
  NAND2X1 U493 ( .A(n380), .B(n168), .Y(n167) );
  NAND2X1 U494 ( .A(n381), .B(n28), .Y(n380) );
  INVX1 U495 ( .A(n26), .Y(n369) );
  AND2X2 U496 ( .A(n382), .B(n28), .Y(n106) );
  INVX4 U497 ( .A(n76), .Y(n362) );
  INVX4 U498 ( .A(n376), .Y(n377) );
  INVX8 U499 ( .A(n362), .Y(n363) );
  BUFX2 U500 ( .A(n375), .Y(n384) );
  INVX2 U501 ( .A(n384), .Y(n385) );
  BUFX2 U502 ( .A(n379), .Y(n386) );
  INVX4 U503 ( .A(n92), .Y(r1_data[1]) );
  INVX4 U504 ( .A(n365), .Y(n367) );
  BUFX2 U505 ( .A(n366), .Y(n387) );
  BUFX2 U506 ( .A(n363), .Y(n388) );
  INVX4 U507 ( .A(n193), .Y(r1_data[7]) );
  INVX2 U508 ( .A(n386), .Y(n390) );
  INVX4 U509 ( .A(n362), .Y(n364) );
  INVX4 U510 ( .A(n359), .Y(n361) );
  INVX4 U511 ( .A(n359), .Y(n360) );
  INVX4 U512 ( .A(n261), .Y(r1_data[11]) );
  INVX4 U513 ( .A(n227), .Y(r1_data[9]) );
  INVX1 U514 ( .A(n393), .Y(n391) );
  AOI22X1 U515 ( .A(n397), .B(n396), .C(n395), .D(n394), .Y(n398) );
  INVX2 U516 ( .A(n398), .Y(r2_data[16]) );
  MUX2X1 U517 ( .B(n399), .A(n400), .S(n678), .Y(r2_data[0]) );
  NAND2X1 U518 ( .A(n401), .B(n402), .Y(n400) );
  NOR2X1 U519 ( .A(n403), .B(n404), .Y(n402) );
  OAI22X1 U520 ( .A(\regs_matrix[8][0] ), .B(n25), .C(\regs_matrix[10][0] ), 
        .D(n655), .Y(n404) );
  OAI22X1 U521 ( .A(\regs_matrix[12][0] ), .B(n659), .C(\regs_matrix[14][0] ), 
        .D(n663), .Y(n403) );
  NOR2X1 U522 ( .A(n409), .B(n410), .Y(n401) );
  OAI22X1 U523 ( .A(\regs_matrix[11][0] ), .B(n38), .C(\regs_matrix[9][0] ), 
        .D(n671), .Y(n410) );
  OAI22X1 U524 ( .A(\regs_matrix[13][0] ), .B(n673), .C(\regs_matrix[15][0] ), 
        .D(n677), .Y(n409) );
  NAND2X1 U525 ( .A(n415), .B(n416), .Y(n399) );
  NOR2X1 U526 ( .A(n417), .B(n418), .Y(n416) );
  OAI22X1 U527 ( .A(outreg_data[0]), .B(n25), .C(\regs_matrix[2][0] ), .D(n655), .Y(n418) );
  OAI22X1 U528 ( .A(\regs_matrix[4][0] ), .B(n659), .C(\regs_matrix[6][0] ), 
        .D(n663), .Y(n417) );
  NOR2X1 U529 ( .A(n419), .B(n420), .Y(n415) );
  OAI22X1 U530 ( .A(\regs_matrix[3][0] ), .B(n665), .C(\regs_matrix[1][0] ), 
        .D(n671), .Y(n420) );
  OAI22X1 U531 ( .A(\regs_matrix[5][0] ), .B(n673), .C(\regs_matrix[7][0] ), 
        .D(n677), .Y(n419) );
  MUX2X1 U532 ( .B(n421), .A(n422), .S(n679), .Y(r2_data[1]) );
  NAND2X1 U533 ( .A(n423), .B(n424), .Y(n422) );
  NOR2X1 U534 ( .A(n425), .B(n426), .Y(n424) );
  OAI22X1 U535 ( .A(\regs_matrix[8][1] ), .B(n25), .C(\regs_matrix[10][1] ), 
        .D(n655), .Y(n426) );
  OAI22X1 U536 ( .A(\regs_matrix[12][1] ), .B(n659), .C(\regs_matrix[14][1] ), 
        .D(n663), .Y(n425) );
  NOR2X1 U537 ( .A(n427), .B(n428), .Y(n423) );
  OAI22X1 U538 ( .A(\regs_matrix[11][1] ), .B(n665), .C(\regs_matrix[9][1] ), 
        .D(n671), .Y(n428) );
  OAI22X1 U539 ( .A(\regs_matrix[13][1] ), .B(n674), .C(\regs_matrix[15][1] ), 
        .D(n677), .Y(n427) );
  NAND2X1 U540 ( .A(n429), .B(n430), .Y(n421) );
  NOR2X1 U541 ( .A(n431), .B(n432), .Y(n430) );
  OAI22X1 U542 ( .A(outreg_data[1]), .B(n25), .C(\regs_matrix[2][1] ), .D(n655), .Y(n432) );
  OAI22X1 U543 ( .A(\regs_matrix[4][1] ), .B(n659), .C(\regs_matrix[6][1] ), 
        .D(n663), .Y(n431) );
  NOR2X1 U544 ( .A(n433), .B(n434), .Y(n429) );
  OAI22X1 U545 ( .A(\regs_matrix[3][1] ), .B(n667), .C(\regs_matrix[1][1] ), 
        .D(n671), .Y(n434) );
  OAI22X1 U546 ( .A(\regs_matrix[5][1] ), .B(n674), .C(\regs_matrix[7][1] ), 
        .D(n677), .Y(n433) );
  MUX2X1 U547 ( .B(n435), .A(n436), .S(n678), .Y(r2_data[2]) );
  NAND2X1 U548 ( .A(n437), .B(n438), .Y(n436) );
  NOR2X1 U549 ( .A(n439), .B(n440), .Y(n438) );
  OAI22X1 U550 ( .A(\regs_matrix[8][2] ), .B(n651), .C(\regs_matrix[10][2] ), 
        .D(n655), .Y(n440) );
  OAI22X1 U551 ( .A(\regs_matrix[12][2] ), .B(n659), .C(\regs_matrix[14][2] ), 
        .D(n663), .Y(n439) );
  NOR2X1 U552 ( .A(n441), .B(n442), .Y(n437) );
  OAI22X1 U553 ( .A(\regs_matrix[11][2] ), .B(n666), .C(\regs_matrix[9][2] ), 
        .D(n671), .Y(n442) );
  OAI22X1 U554 ( .A(\regs_matrix[13][2] ), .B(n673), .C(\regs_matrix[15][2] ), 
        .D(n677), .Y(n441) );
  NAND2X1 U555 ( .A(n443), .B(n444), .Y(n435) );
  NOR2X1 U556 ( .A(n445), .B(n446), .Y(n444) );
  OAI22X1 U557 ( .A(outreg_data[2]), .B(n650), .C(\regs_matrix[2][2] ), .D(
        n655), .Y(n446) );
  OAI22X1 U558 ( .A(\regs_matrix[4][2] ), .B(n659), .C(\regs_matrix[6][2] ), 
        .D(n662), .Y(n445) );
  NOR2X1 U559 ( .A(n447), .B(n448), .Y(n443) );
  OAI22X1 U560 ( .A(\regs_matrix[3][2] ), .B(n666), .C(\regs_matrix[1][2] ), 
        .D(n671), .Y(n448) );
  OAI22X1 U561 ( .A(\regs_matrix[5][2] ), .B(n673), .C(\regs_matrix[7][2] ), 
        .D(n677), .Y(n447) );
  MUX2X1 U562 ( .B(n449), .A(n450), .S(n679), .Y(r2_data[3]) );
  NAND2X1 U563 ( .A(n451), .B(n452), .Y(n450) );
  NOR2X1 U564 ( .A(n453), .B(n454), .Y(n452) );
  OAI22X1 U565 ( .A(\regs_matrix[8][3] ), .B(n650), .C(\regs_matrix[10][3] ), 
        .D(n655), .Y(n454) );
  OAI22X1 U566 ( .A(\regs_matrix[12][3] ), .B(n659), .C(\regs_matrix[14][3] ), 
        .D(n40), .Y(n453) );
  NOR2X1 U567 ( .A(n455), .B(n456), .Y(n451) );
  OAI22X1 U568 ( .A(\regs_matrix[11][3] ), .B(n666), .C(\regs_matrix[9][3] ), 
        .D(n671), .Y(n456) );
  OAI22X1 U569 ( .A(\regs_matrix[13][3] ), .B(n673), .C(\regs_matrix[15][3] ), 
        .D(n677), .Y(n455) );
  NAND2X1 U570 ( .A(n457), .B(n458), .Y(n449) );
  NOR2X1 U571 ( .A(n459), .B(n460), .Y(n458) );
  OAI22X1 U572 ( .A(outreg_data[3]), .B(n650), .C(\regs_matrix[2][3] ), .D(
        n655), .Y(n460) );
  OAI22X1 U573 ( .A(\regs_matrix[4][3] ), .B(n659), .C(\regs_matrix[6][3] ), 
        .D(n662), .Y(n459) );
  NOR2X1 U574 ( .A(n461), .B(n462), .Y(n457) );
  OAI22X1 U575 ( .A(\regs_matrix[3][3] ), .B(n666), .C(\regs_matrix[1][3] ), 
        .D(n671), .Y(n462) );
  OAI22X1 U576 ( .A(\regs_matrix[5][3] ), .B(n673), .C(\regs_matrix[7][3] ), 
        .D(n677), .Y(n461) );
  NAND2X1 U577 ( .A(n465), .B(n466), .Y(n464) );
  NOR2X1 U578 ( .A(n467), .B(n468), .Y(n466) );
  OAI22X1 U579 ( .A(\regs_matrix[8][4] ), .B(n650), .C(\regs_matrix[10][4] ), 
        .D(n656), .Y(n468) );
  OAI22X1 U580 ( .A(\regs_matrix[12][4] ), .B(n660), .C(\regs_matrix[14][4] ), 
        .D(n663), .Y(n467) );
  NOR2X1 U581 ( .A(n469), .B(n470), .Y(n465) );
  OAI22X1 U582 ( .A(\regs_matrix[11][4] ), .B(n667), .C(\regs_matrix[9][4] ), 
        .D(n671), .Y(n470) );
  OAI22X1 U583 ( .A(\regs_matrix[13][4] ), .B(n674), .C(\regs_matrix[15][4] ), 
        .D(n677), .Y(n469) );
  NAND2X1 U584 ( .A(n471), .B(n472), .Y(n463) );
  NOR2X1 U585 ( .A(n473), .B(n474), .Y(n472) );
  OAI22X1 U586 ( .A(outreg_data[4]), .B(n651), .C(\regs_matrix[2][4] ), .D(
        n656), .Y(n474) );
  OAI22X1 U587 ( .A(\regs_matrix[4][4] ), .B(n660), .C(\regs_matrix[6][4] ), 
        .D(n41), .Y(n473) );
  NOR2X1 U588 ( .A(n475), .B(n476), .Y(n471) );
  OAI22X1 U589 ( .A(\regs_matrix[3][4] ), .B(n39), .C(\regs_matrix[1][4] ), 
        .D(n671), .Y(n476) );
  OAI22X1 U590 ( .A(\regs_matrix[5][4] ), .B(n673), .C(\regs_matrix[7][4] ), 
        .D(n677), .Y(n475) );
  MUX2X1 U591 ( .B(n477), .A(n478), .S(n679), .Y(r2_data[5]) );
  NAND2X1 U592 ( .A(n479), .B(n480), .Y(n478) );
  NOR2X1 U593 ( .A(n481), .B(n482), .Y(n480) );
  OAI22X1 U594 ( .A(\regs_matrix[8][5] ), .B(n650), .C(\regs_matrix[10][5] ), 
        .D(n656), .Y(n482) );
  OAI22X1 U595 ( .A(\regs_matrix[12][5] ), .B(n660), .C(\regs_matrix[14][5] ), 
        .D(n41), .Y(n481) );
  NOR2X1 U596 ( .A(n483), .B(n484), .Y(n479) );
  OAI22X1 U597 ( .A(\regs_matrix[11][5] ), .B(n38), .C(\regs_matrix[9][5] ), 
        .D(n671), .Y(n484) );
  OAI22X1 U598 ( .A(\regs_matrix[13][5] ), .B(n674), .C(\regs_matrix[15][5] ), 
        .D(n677), .Y(n483) );
  NAND2X1 U599 ( .A(n485), .B(n486), .Y(n477) );
  NOR2X1 U600 ( .A(n487), .B(n488), .Y(n486) );
  OAI22X1 U601 ( .A(outreg_data[5]), .B(n651), .C(\regs_matrix[2][5] ), .D(
        n656), .Y(n488) );
  OAI22X1 U602 ( .A(\regs_matrix[4][5] ), .B(n660), .C(\regs_matrix[6][5] ), 
        .D(n40), .Y(n487) );
  NOR2X1 U603 ( .A(n489), .B(n490), .Y(n485) );
  OAI22X1 U604 ( .A(\regs_matrix[3][5] ), .B(n665), .C(\regs_matrix[1][5] ), 
        .D(n671), .Y(n490) );
  OAI22X1 U605 ( .A(\regs_matrix[5][5] ), .B(n673), .C(\regs_matrix[7][5] ), 
        .D(n677), .Y(n489) );
  MUX2X1 U606 ( .B(n491), .A(n492), .S(n678), .Y(r2_data[6]) );
  NAND2X1 U607 ( .A(n493), .B(n494), .Y(n492) );
  NOR2X1 U608 ( .A(n495), .B(n496), .Y(n494) );
  OAI22X1 U609 ( .A(\regs_matrix[8][6] ), .B(n650), .C(\regs_matrix[10][6] ), 
        .D(n656), .Y(n496) );
  OAI22X1 U610 ( .A(\regs_matrix[12][6] ), .B(n660), .C(\regs_matrix[14][6] ), 
        .D(n662), .Y(n495) );
  NOR2X1 U611 ( .A(n497), .B(n498), .Y(n493) );
  OAI22X1 U612 ( .A(\regs_matrix[11][6] ), .B(n38), .C(\regs_matrix[9][6] ), 
        .D(n670), .Y(n498) );
  OAI22X1 U613 ( .A(\regs_matrix[13][6] ), .B(n674), .C(\regs_matrix[15][6] ), 
        .D(n676), .Y(n497) );
  NAND2X1 U614 ( .A(n499), .B(n500), .Y(n491) );
  NOR2X1 U615 ( .A(n501), .B(n502), .Y(n500) );
  OAI22X1 U616 ( .A(outreg_data[6]), .B(n651), .C(\regs_matrix[2][6] ), .D(
        n656), .Y(n502) );
  OAI22X1 U617 ( .A(\regs_matrix[4][6] ), .B(n660), .C(\regs_matrix[6][6] ), 
        .D(n663), .Y(n501) );
  NOR2X1 U618 ( .A(n503), .B(n504), .Y(n499) );
  OAI22X1 U619 ( .A(\regs_matrix[3][6] ), .B(n39), .C(\regs_matrix[1][6] ), 
        .D(n670), .Y(n504) );
  OAI22X1 U620 ( .A(\regs_matrix[5][6] ), .B(n673), .C(\regs_matrix[7][6] ), 
        .D(n676), .Y(n503) );
  MUX2X1 U621 ( .B(n505), .A(n506), .S(n679), .Y(r2_data[7]) );
  NAND2X1 U622 ( .A(n507), .B(n508), .Y(n506) );
  NOR2X1 U623 ( .A(n509), .B(n510), .Y(n508) );
  OAI22X1 U624 ( .A(\regs_matrix[8][7] ), .B(n651), .C(\regs_matrix[10][7] ), 
        .D(n656), .Y(n510) );
  OAI22X1 U625 ( .A(\regs_matrix[12][7] ), .B(n660), .C(\regs_matrix[14][7] ), 
        .D(n40), .Y(n509) );
  NOR2X1 U626 ( .A(n511), .B(n512), .Y(n507) );
  OAI22X1 U627 ( .A(\regs_matrix[11][7] ), .B(n665), .C(\regs_matrix[9][7] ), 
        .D(n670), .Y(n512) );
  OAI22X1 U628 ( .A(\regs_matrix[13][7] ), .B(n674), .C(\regs_matrix[15][7] ), 
        .D(n676), .Y(n511) );
  NAND2X1 U629 ( .A(n513), .B(n514), .Y(n505) );
  NOR2X1 U630 ( .A(n515), .B(n516), .Y(n514) );
  OAI22X1 U631 ( .A(outreg_data[7]), .B(n650), .C(\regs_matrix[2][7] ), .D(
        n656), .Y(n516) );
  OAI22X1 U632 ( .A(\regs_matrix[4][7] ), .B(n660), .C(\regs_matrix[6][7] ), 
        .D(n41), .Y(n515) );
  NOR2X1 U633 ( .A(n517), .B(n518), .Y(n513) );
  OAI22X1 U634 ( .A(\regs_matrix[3][7] ), .B(n667), .C(\regs_matrix[1][7] ), 
        .D(n670), .Y(n518) );
  OAI22X1 U635 ( .A(\regs_matrix[5][7] ), .B(n674), .C(\regs_matrix[7][7] ), 
        .D(n676), .Y(n517) );
  MUX2X1 U636 ( .B(n519), .A(n520), .S(n678), .Y(r2_data[8]) );
  NAND2X1 U637 ( .A(n521), .B(n522), .Y(n520) );
  NOR2X1 U638 ( .A(n523), .B(n524), .Y(n522) );
  OAI22X1 U639 ( .A(\regs_matrix[8][8] ), .B(n25), .C(\regs_matrix[10][8] ), 
        .D(n656), .Y(n524) );
  OAI22X1 U640 ( .A(\regs_matrix[12][8] ), .B(n660), .C(\regs_matrix[14][8] ), 
        .D(n41), .Y(n523) );
  NOR2X1 U641 ( .A(n525), .B(n526), .Y(n521) );
  OAI22X1 U642 ( .A(\regs_matrix[11][8] ), .B(n667), .C(\regs_matrix[9][8] ), 
        .D(n670), .Y(n526) );
  OAI22X1 U643 ( .A(\regs_matrix[13][8] ), .B(n674), .C(\regs_matrix[15][8] ), 
        .D(n676), .Y(n525) );
  NAND2X1 U644 ( .A(n527), .B(n528), .Y(n519) );
  NOR2X1 U645 ( .A(n529), .B(n530), .Y(n528) );
  OAI22X1 U646 ( .A(outreg_data[8]), .B(n651), .C(\regs_matrix[2][8] ), .D(
        n656), .Y(n530) );
  OAI22X1 U647 ( .A(\regs_matrix[4][8] ), .B(n660), .C(\regs_matrix[6][8] ), 
        .D(n40), .Y(n529) );
  NOR2X1 U648 ( .A(n531), .B(n532), .Y(n527) );
  OAI22X1 U649 ( .A(\regs_matrix[3][8] ), .B(n39), .C(\regs_matrix[1][8] ), 
        .D(n670), .Y(n532) );
  OAI22X1 U650 ( .A(\regs_matrix[5][8] ), .B(n674), .C(\regs_matrix[7][8] ), 
        .D(n676), .Y(n531) );
  NAND2X1 U651 ( .A(n535), .B(n536), .Y(n534) );
  NOR2X1 U652 ( .A(n537), .B(n538), .Y(n536) );
  OAI22X1 U653 ( .A(\regs_matrix[8][9] ), .B(n650), .C(\regs_matrix[10][9] ), 
        .D(n656), .Y(n538) );
  OAI22X1 U654 ( .A(\regs_matrix[12][9] ), .B(n660), .C(\regs_matrix[14][9] ), 
        .D(n662), .Y(n537) );
  NOR2X1 U655 ( .A(n539), .B(n540), .Y(n535) );
  OAI22X1 U656 ( .A(\regs_matrix[11][9] ), .B(n667), .C(\regs_matrix[9][9] ), 
        .D(n670), .Y(n540) );
  OAI22X1 U657 ( .A(\regs_matrix[13][9] ), .B(n673), .C(\regs_matrix[15][9] ), 
        .D(n676), .Y(n539) );
  NAND2X1 U658 ( .A(n541), .B(n542), .Y(n533) );
  NOR2X1 U659 ( .A(n543), .B(n544), .Y(n542) );
  OAI22X1 U660 ( .A(outreg_data[9]), .B(n651), .C(\regs_matrix[2][9] ), .D(
        n656), .Y(n544) );
  OAI22X1 U661 ( .A(\regs_matrix[4][9] ), .B(n660), .C(\regs_matrix[6][9] ), 
        .D(n662), .Y(n543) );
  NOR2X1 U662 ( .A(n545), .B(n546), .Y(n541) );
  OAI22X1 U663 ( .A(\regs_matrix[3][9] ), .B(n665), .C(\regs_matrix[1][9] ), 
        .D(n670), .Y(n546) );
  OAI22X1 U664 ( .A(\regs_matrix[5][9] ), .B(n674), .C(\regs_matrix[7][9] ), 
        .D(n676), .Y(n545) );
  MUX2X1 U665 ( .B(n547), .A(n548), .S(n678), .Y(r2_data[10]) );
  NAND2X1 U666 ( .A(n549), .B(n550), .Y(n548) );
  NOR2X1 U667 ( .A(n551), .B(n552), .Y(n550) );
  OAI22X1 U668 ( .A(\regs_matrix[8][10] ), .B(n651), .C(\regs_matrix[10][10] ), 
        .D(n657), .Y(n552) );
  OAI22X1 U669 ( .A(\regs_matrix[12][10] ), .B(n660), .C(\regs_matrix[14][10] ), .D(n663), .Y(n551) );
  NOR2X1 U670 ( .A(n553), .B(n554), .Y(n549) );
  OAI22X1 U671 ( .A(\regs_matrix[11][10] ), .B(n39), .C(\regs_matrix[9][10] ), 
        .D(n670), .Y(n554) );
  OAI22X1 U672 ( .A(\regs_matrix[13][10] ), .B(n673), .C(\regs_matrix[15][10] ), .D(n676), .Y(n553) );
  NAND2X1 U673 ( .A(n555), .B(n556), .Y(n547) );
  NOR2X1 U674 ( .A(n557), .B(n558), .Y(n556) );
  OAI22X1 U675 ( .A(outreg_data[10]), .B(n650), .C(\regs_matrix[2][10] ), .D(
        n657), .Y(n558) );
  OAI22X1 U676 ( .A(\regs_matrix[4][10] ), .B(n660), .C(\regs_matrix[6][10] ), 
        .D(n41), .Y(n557) );
  NOR2X1 U677 ( .A(n559), .B(n560), .Y(n555) );
  OAI22X1 U678 ( .A(\regs_matrix[3][10] ), .B(n667), .C(\regs_matrix[1][10] ), 
        .D(n670), .Y(n560) );
  OAI22X1 U679 ( .A(\regs_matrix[5][10] ), .B(n673), .C(\regs_matrix[7][10] ), 
        .D(n676), .Y(n559) );
  MUX2X1 U680 ( .B(n561), .A(n562), .S(n679), .Y(r2_data[11]) );
  NAND2X1 U681 ( .A(n563), .B(n564), .Y(n562) );
  NOR2X1 U682 ( .A(n565), .B(n566), .Y(n564) );
  OAI22X1 U683 ( .A(\regs_matrix[8][11] ), .B(n651), .C(\regs_matrix[10][11] ), 
        .D(n657), .Y(n566) );
  OAI22X1 U684 ( .A(\regs_matrix[12][11] ), .B(n660), .C(\regs_matrix[14][11] ), .D(n40), .Y(n565) );
  NOR2X1 U685 ( .A(n567), .B(n568), .Y(n563) );
  OAI22X1 U686 ( .A(\regs_matrix[11][11] ), .B(n39), .C(\regs_matrix[9][11] ), 
        .D(n670), .Y(n568) );
  OAI22X1 U687 ( .A(\regs_matrix[13][11] ), .B(n673), .C(\regs_matrix[15][11] ), .D(n676), .Y(n567) );
  NAND2X1 U688 ( .A(n569), .B(n570), .Y(n561) );
  NOR2X1 U689 ( .A(n571), .B(n572), .Y(n570) );
  OAI22X1 U690 ( .A(outreg_data[11]), .B(n651), .C(\regs_matrix[2][11] ), .D(
        n657), .Y(n572) );
  OAI22X1 U691 ( .A(\regs_matrix[4][11] ), .B(n660), .C(\regs_matrix[6][11] ), 
        .D(n662), .Y(n571) );
  NOR2X1 U692 ( .A(n573), .B(n574), .Y(n569) );
  OAI22X1 U693 ( .A(\regs_matrix[3][11] ), .B(n665), .C(\regs_matrix[1][11] ), 
        .D(n670), .Y(n574) );
  OAI22X1 U694 ( .A(\regs_matrix[5][11] ), .B(n674), .C(\regs_matrix[7][11] ), 
        .D(n676), .Y(n573) );
  MUX2X1 U695 ( .B(n575), .A(n576), .S(n678), .Y(r2_data[12]) );
  NAND2X1 U696 ( .A(n577), .B(n578), .Y(n576) );
  NOR2X1 U697 ( .A(n579), .B(n580), .Y(n578) );
  OAI22X1 U698 ( .A(\regs_matrix[8][12] ), .B(n651), .C(\regs_matrix[10][12] ), 
        .D(n657), .Y(n580) );
  OAI22X1 U699 ( .A(\regs_matrix[12][12] ), .B(n660), .C(\regs_matrix[14][12] ), .D(n662), .Y(n579) );
  NOR2X1 U700 ( .A(n581), .B(n582), .Y(n577) );
  OAI22X1 U701 ( .A(\regs_matrix[11][12] ), .B(n665), .C(\regs_matrix[9][12] ), 
        .D(n669), .Y(n582) );
  OAI22X1 U702 ( .A(\regs_matrix[13][12] ), .B(n674), .C(\regs_matrix[15][12] ), .D(n676), .Y(n581) );
  NAND2X1 U703 ( .A(n583), .B(n584), .Y(n575) );
  NOR2X1 U704 ( .A(n585), .B(n586), .Y(n584) );
  OAI22X1 U705 ( .A(outreg_data[12]), .B(n651), .C(\regs_matrix[2][12] ), .D(
        n657), .Y(n586) );
  OAI22X1 U706 ( .A(\regs_matrix[4][12] ), .B(n660), .C(\regs_matrix[6][12] ), 
        .D(n663), .Y(n585) );
  NOR2X1 U707 ( .A(n587), .B(n588), .Y(n583) );
  OAI22X1 U708 ( .A(\regs_matrix[3][12] ), .B(n38), .C(\regs_matrix[1][12] ), 
        .D(n669), .Y(n588) );
  OAI22X1 U709 ( .A(\regs_matrix[5][12] ), .B(n674), .C(\regs_matrix[7][12] ), 
        .D(n676), .Y(n587) );
  MUX2X1 U710 ( .B(n589), .A(n590), .S(n679), .Y(r2_data[13]) );
  NAND2X1 U711 ( .A(n591), .B(n592), .Y(n590) );
  NOR2X1 U712 ( .A(n593), .B(n594), .Y(n592) );
  OAI22X1 U713 ( .A(\regs_matrix[8][13] ), .B(n650), .C(\regs_matrix[10][13] ), 
        .D(n657), .Y(n594) );
  OAI22X1 U714 ( .A(\regs_matrix[12][13] ), .B(n660), .C(\regs_matrix[14][13] ), .D(n662), .Y(n593) );
  NOR2X1 U715 ( .A(n595), .B(n596), .Y(n591) );
  OAI22X1 U716 ( .A(\regs_matrix[11][13] ), .B(n38), .C(\regs_matrix[9][13] ), 
        .D(n669), .Y(n596) );
  OAI22X1 U717 ( .A(\regs_matrix[13][13] ), .B(n674), .C(\regs_matrix[15][13] ), .D(n676), .Y(n595) );
  NAND2X1 U718 ( .A(n597), .B(n598), .Y(n589) );
  NOR2X1 U719 ( .A(n599), .B(n600), .Y(n598) );
  OAI22X1 U720 ( .A(outreg_data[13]), .B(n651), .C(\regs_matrix[2][13] ), .D(
        n657), .Y(n600) );
  OAI22X1 U721 ( .A(\regs_matrix[4][13] ), .B(n660), .C(\regs_matrix[6][13] ), 
        .D(n41), .Y(n599) );
  NOR2X1 U722 ( .A(n601), .B(n602), .Y(n597) );
  OAI22X1 U723 ( .A(\regs_matrix[3][13] ), .B(n39), .C(\regs_matrix[1][13] ), 
        .D(n669), .Y(n602) );
  OAI22X1 U724 ( .A(\regs_matrix[5][13] ), .B(n673), .C(\regs_matrix[7][13] ), 
        .D(n676), .Y(n601) );
  NAND2X1 U725 ( .A(n605), .B(n606), .Y(n604) );
  NOR2X1 U726 ( .A(n607), .B(n608), .Y(n606) );
  OAI22X1 U727 ( .A(\regs_matrix[8][14] ), .B(n650), .C(\regs_matrix[10][14] ), 
        .D(n657), .Y(n608) );
  OAI22X1 U728 ( .A(\regs_matrix[12][14] ), .B(n659), .C(\regs_matrix[14][14] ), .D(n41), .Y(n607) );
  NOR2X1 U729 ( .A(n609), .B(n610), .Y(n605) );
  OAI22X1 U730 ( .A(\regs_matrix[11][14] ), .B(n39), .C(\regs_matrix[9][14] ), 
        .D(n669), .Y(n610) );
  OAI22X1 U731 ( .A(\regs_matrix[13][14] ), .B(n673), .C(\regs_matrix[15][14] ), .D(n677), .Y(n609) );
  NAND2X1 U732 ( .A(n611), .B(n612), .Y(n603) );
  NOR2X1 U733 ( .A(n614), .B(n613), .Y(n612) );
  OAI22X1 U734 ( .A(outreg_data[14]), .B(n651), .C(\regs_matrix[2][14] ), .D(
        n657), .Y(n614) );
  OAI22X1 U735 ( .A(\regs_matrix[4][14] ), .B(n659), .C(\regs_matrix[6][14] ), 
        .D(n40), .Y(n613) );
  NOR2X1 U736 ( .A(n615), .B(n616), .Y(n611) );
  OAI22X1 U737 ( .A(\regs_matrix[3][14] ), .B(n38), .C(\regs_matrix[1][14] ), 
        .D(n669), .Y(n616) );
  OAI22X1 U738 ( .A(\regs_matrix[5][14] ), .B(n673), .C(\regs_matrix[7][14] ), 
        .D(n676), .Y(n615) );
  MUX2X1 U739 ( .B(n617), .A(n618), .S(n679), .Y(r2_data[15]) );
  NAND2X1 U740 ( .A(n619), .B(n620), .Y(n618) );
  NOR2X1 U741 ( .A(n621), .B(n622), .Y(n620) );
  OAI22X1 U742 ( .A(\regs_matrix[8][15] ), .B(n650), .C(\regs_matrix[10][15] ), 
        .D(n657), .Y(n622) );
  OAI22X1 U743 ( .A(\regs_matrix[12][15] ), .B(n659), .C(\regs_matrix[14][15] ), .D(n41), .Y(n621) );
  NOR2X1 U744 ( .A(n623), .B(n624), .Y(n619) );
  OAI22X1 U745 ( .A(\regs_matrix[11][15] ), .B(n666), .C(\regs_matrix[9][15] ), 
        .D(n669), .Y(n624) );
  OAI22X1 U746 ( .A(\regs_matrix[13][15] ), .B(n673), .C(\regs_matrix[15][15] ), .D(n676), .Y(n623) );
  NAND2X1 U747 ( .A(n625), .B(n626), .Y(n617) );
  NOR2X1 U748 ( .A(n627), .B(n628), .Y(n626) );
  OAI22X1 U749 ( .A(outreg_data[15]), .B(n650), .C(\regs_matrix[2][15] ), .D(
        n657), .Y(n628) );
  OAI22X1 U750 ( .A(\regs_matrix[4][15] ), .B(n659), .C(\regs_matrix[6][15] ), 
        .D(n40), .Y(n627) );
  NOR2X1 U751 ( .A(n629), .B(n630), .Y(n625) );
  OAI22X1 U752 ( .A(\regs_matrix[3][15] ), .B(n666), .C(\regs_matrix[1][15] ), 
        .D(n669), .Y(n630) );
  OAI22X1 U753 ( .A(\regs_matrix[5][15] ), .B(n673), .C(\regs_matrix[7][15] ), 
        .D(n677), .Y(n629) );
  NOR2X1 U754 ( .A(n631), .B(n632), .Y(n394) );
  OAI21X1 U755 ( .A(\regs_matrix[6][16] ), .B(n41), .C(n633), .Y(n632) );
  AOI22X1 U756 ( .A(n652), .B(n349), .C(n649), .D(n634), .Y(n633) );
  INVX2 U757 ( .A(outreg_data[16]), .Y(n634) );
  OAI21X1 U758 ( .A(\regs_matrix[4][16] ), .B(n681), .C(n680), .Y(n631) );
  NOR2X1 U759 ( .A(n635), .B(n636), .Y(n395) );
  OAI22X1 U760 ( .A(\regs_matrix[3][16] ), .B(n667), .C(\regs_matrix[1][16] ), 
        .D(n669), .Y(n636) );
  OAI22X1 U761 ( .A(\regs_matrix[5][16] ), .B(n673), .C(\regs_matrix[7][16] ), 
        .D(n676), .Y(n635) );
  NOR2X1 U762 ( .A(n637), .B(n638), .Y(n396) );
  OAI21X1 U763 ( .A(\regs_matrix[12][16] ), .B(n681), .C(n639), .Y(n638) );
  AOI22X1 U764 ( .A(n654), .B(n640), .C(n647), .D(n641), .Y(n639) );
  INVX2 U765 ( .A(\regs_matrix[8][16] ), .Y(n641) );
  NAND3X1 U766 ( .A(n644), .B(n17), .C(n642), .Y(n405) );
  INVX2 U767 ( .A(\regs_matrix[10][16] ), .Y(n640) );
  NAND3X1 U768 ( .A(n683), .B(n643), .C(n644), .Y(n406) );
  NAND3X1 U769 ( .A(n18), .B(n642), .C(n644), .Y(n407) );
  OAI22X1 U770 ( .A(\regs_matrix[9][16] ), .B(n669), .C(\regs_matrix[14][16] ), 
        .D(n40), .Y(n637) );
  NAND3X1 U771 ( .A(n18), .B(n683), .C(n644), .Y(n408) );
  NOR2X1 U772 ( .A(n645), .B(n646), .Y(n397) );
  OAI21X1 U773 ( .A(\regs_matrix[11][16] ), .B(n38), .C(n678), .Y(n646) );
  OAI22X1 U774 ( .A(\regs_matrix[15][16] ), .B(n677), .C(\regs_matrix[13][16] ), .D(n674), .Y(n645) );
  NAND3X1 U775 ( .A(n683), .B(n1), .C(n18), .Y(n414) );
  BUFX4 U776 ( .A(n647), .Y(n649) );
  INVX8 U777 ( .A(n649), .Y(n650) );
  INVX8 U778 ( .A(n648), .Y(n651) );
  INVX8 U779 ( .A(n658), .Y(n660) );
  INVX8 U780 ( .A(n672), .Y(n673) );
  BUFX2 U781 ( .A(n660), .Y(n681) );
  INVX4 U782 ( .A(n668), .Y(n670) );
  INVX4 U783 ( .A(n668), .Y(n669) );
  INVX4 U784 ( .A(n683), .Y(n642) );
  INVX2 U785 ( .A(N15), .Y(n682) );
  INVX4 U786 ( .A(n682), .Y(n683) );
  INVX2 U787 ( .A(w_en), .Y(n736) );
  INVX2 U788 ( .A(w_sel[1]), .Y(n737) );
  INVX2 U789 ( .A(w_sel[2]), .Y(n738) );
  INVX2 U790 ( .A(w_sel[3]), .Y(n739) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  AND2X2 U2 ( .A(w_data_sel[0]), .B(n36), .Y(n1) );
  AND2X2 U3 ( .A(n36), .B(n3), .Y(n2) );
  INVX2 U4 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n1), .C(ext_data1[15]), .D(n2), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n1), .C(ext_data1[14]), .D(n2), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n1), .C(ext_data1[13]), .D(n2), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n1), .C(ext_data1[12]), .D(n2), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n1), .C(ext_data1[11]), .D(n2), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n1), .C(ext_data1[10]), .D(n2), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n1), .C(ext_data1[9]), .D(n2), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n1), .C(ext_data1[8]), .D(n2), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n1), .C(ext_data1[7]), .D(n2), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n1), .C(ext_data1[6]), .D(n2), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n1), .C(ext_data1[5]), .D(n2), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n1), .C(ext_data1[4]), .D(n2), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n1), .C(ext_data1[3]), .D(n2), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n1), .C(ext_data1[2]), .D(n2), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n1), .C(ext_data1[1]), .D(n2), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n1), .C(ext_data1[0]), .D(n2), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, data_ready, 
        load_coeff, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   syncDR, syncLC, overflow, count_up, clear;
  wire   [2:0] operation;
  wire   [3:0] source1;
  wire   [3:0] source2;
  wire   [3:0] destination;
  wire   [16:0] dpout;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_1 syn1 ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(
        syncDR) );
  sync_0 syn2 ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(
        syncLC) );
  controller ctlr ( .clk(clk), .n_reset(n_reset), .dr(syncDR), .lc(syncLC), 
        .overflow(overflow), .cnt_up(count_up), .clear(clear), .modwait(
        modwait), .op(operation), .src1({SYNOPSYS_UNCONNECTED__0, source1[2:0]}), .src2(source2), .dest(destination), .err(err) );
  counter cnt ( .clk(clk), .n_reset(n_reset), .cnt_up(count_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  magnitude mag ( .in(dpout), .out(fir_out) );
  datapath dp ( .clk(clk), .n_reset(n_reset), .op(operation), .src1({1'b0, 
        source1[2:0]}), .src2(source2), .dest(destination), .ext_data1(
        sample_data), .ext_data2(fir_coefficient), .outreg_data(dpout), 
        .overflow(overflow) );
endmodule

