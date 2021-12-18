`include "ram.v"

module mem_tb;
  reg [15:0] in;
  reg [2:0] addr;
  reg clk, ld;
  
  wire [15:0] out;

  Ram8 d0(out, in, clk, ld);
    initial begin
    in=16'd15;clk=1'b1;ld=1'b1;addr=
