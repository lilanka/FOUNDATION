`include "dff.v"

module Reg16(out, in, clk, ld);
  input [15:0] in; 
  input clk, ld;
  output [15:0] out;

  Dff d0(out[0], in[0], clk, ld);
  Dff d1(out[1], in[1], clk, ld);
  Dff d2(out[2], in[2], clk, ld);
  Dff d3(out[3], in[3], clk, ld);
  Dff d4(out[4], in[4], clk, ld);
  Dff d5(out[5], in[5], clk, ld);
  Dff d6(out[6], in[6], clk, ld);
  Dff d7(out[7], in[7], clk, ld);
  Dff d8(out[8], in[8], clk, ld);
  Dff d9(out[9], in[9], clk, ld);
  Dff d10(out[10], in[10], clk, ld);
  Dff d11(out[11], in[11], clk, ld);
  Dff d12(out[12], in[12], clk, ld);
  Dff d13(out[13], in[13], clk, ld);
  Dff d14(out[14], in[14], clk, ld);
  Dff d15(out[15], in[15], clk, ld);
endmodule
