`include "alu.v"
module alu_tb;
  reg [15:0] a = 16'd5;
  reg [15:0] b = 16'd6;
  reg [5:0] c = 6'b000000; // control signal

  wire [15:0] out;
  wire zr, ng;

  Alu16 u1(out, zr, ng, a, b, c);

  initial begin
    $monitor("a=%b, b=%b, out=%b, zr=%b, ng=%b", a, b, out, zr, ng);
  end
endmodule
