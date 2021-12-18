`include "not.v"
`include "and.v"

module Mux(output reg out, input a, b, sel);
  always @ (a, b, sel) begin
    if (sel==0) begin
      out = a;
    end
    else 
      out = b;
  end
endmodule

module Mux16(out, a, b, sel);
  input [15:0] a, b;
  input sel;
  output [15:0] out;

  Mux d0(out[0], a[0], b[0], sel);
  Mux d1(out[1], a[1], b[1], sel);
  Mux d2(out[2], a[2], b[2], sel);
  Mux d3(out[3], a[3], b[3], sel);
  Mux d4(out[4], a[4], b[4], sel);
  Mux d5(out[5], a[5], b[5], sel);
  Mux d6(out[6], a[6], b[6], sel);
  Mux d7(out[7], a[7], b[7], sel);
  Mux d8(out[8], a[8], b[8], sel);
  Mux d9(out[9], a[9], b[9], sel);
  Mux d10(out[10], a[10], b[10], sel);
  Mux d11(out[11], a[11], b[11], sel);
  Mux d12(out[12], a[12], b[12], sel);
  Mux d13(out[13], a[13], b[13], sel);
  Mux d14(out[14], a[14], b[14], sel);
  Mux d15(out[15], a[15], b[15], sel);
endmodule 

module Mux4Way16(out, a, b, c, d, sel);
  input [15:0] a, b, c, d;
  input [1:0] sel;

  output [15:0] out;
  wire [15:0] o_ab, o_cd;

  Mux16 g0(o_ab, a, b, sel[0]);
  Mux16 g1(o_cd, c, d, sel[0]);
  Mux16 g2(out, o_ab, o_cb, sel[1]);
endmodule
  
module Mux8Way16(out, a, b, c, d, e, f, g, h, sel);
  input [15:0] a, b, c, d, e, f, g, h;
  input [2:0] sel;

  output [15:0] out;
  wire [15:0] o_ad, o_eh;

  Mux4Way16 g0(o_ad, a, b, c, d, sel[1:0]);
  Mux4Way16 g1(o_eh, e, f, g, h, sel[1:0]);
  Mux16     g2(out, o_ad, o_eh, sel[2]);
endmodule

module DMux(output a, b, input in, sel);
  Not g0(s1, sel);
  And g1(a, in, s1);
  And g3(b, in, sel);
endmodule

module DMux4Way(a, b, c, d, in, sel);
  input in;
  input [1:0] sel;

  output a, b, c, d;

  Not g0(s1, sel[1]);
  Not g1(s0, sel[0]);
  And g3(sel00, s1, s2);
  And g4(sel01, s1, sel[0]);
  And g5(sel10, s0, sel[1]);
  And g6(sel11, sel[0], sel[1]);
  DMux g7(a, d0, sel00, in);
  DMux g8(b, d1, sel01, in);
  DMux g9(c, d2, sel10, in);
  DMux g10(d, d3, sel11, in);
endmodule

module DMux8Way(a, b, c, d, e, f, g, h, in, sel);
  input in;
  input [2:0] sel;

  output a, b, c, d, e, f, g, h;

  Not g0(sel2, sel[2]);
  And g1(s2h, in, sel[2]);
  And g2(s2l, s2, in);
  DMux4Way g3(e, f, g, h, s2, sel[1:0]);
  DMux4Way g4(a, b, c, d, s2l, sel[1:0]);
endmodule
