`include "or.v"
`include "increment.v"
`include "and.v"
`include "mux.v"
`include "reg.v"

module Pc(out, in, clk, ld, incr, rst);
  input [15:0] in;
  input clk, ld, incr, rst;

  output [15:0] out;
  wire [15:0] if1, if2, if3, o_inc, o;

  Or g0(ld_incr, ld, incr);
  Or g1(ld_incr_rst, ld_incr, rst);
  Incr16 incr(o_incr, o);
  And16 g2(out, o, o);
  Mux16 g3(if1, o, o_inc, incr);
  Mux16 g4(if2, if1, in, ld);

  Reg16 r0(o, if3, clk, ld_incr_rst);
endmodule
