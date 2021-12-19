`include "ram.v"
`include "alu.v"

module Cpu(outM, wrM, addrM, pc, I, ins, clk, rst);
  input [15:0] inM, I;
  input clk, rst;

  output [15:0] outM;
  output [14:0] addrM, pc;
  output wrM;
