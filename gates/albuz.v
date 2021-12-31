`include "cpu.v"
`include "mem.v"

module Albuz(input clk, rst);
  wire [15:0] in, out, I;
  wire [14:0] addr, pc;

  Memory  ram(out, in, addr, !clk, ld);
  Rom32K  rom(I, pc);
  Cpu     cpu(in, ld, addr, pc, out, I, clk, rst);
endmodule
