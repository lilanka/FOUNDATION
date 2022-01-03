`include "alu.v"

module alu_tb;
  reg   [31:0]  a, b;   
  reg   [3:0]   c;
  wire  [31:0]  out;
  wire          zr;

  KY32_alu a0(out, zr, a, b, c);
  initial begin
        a=32'd0;b=32'd1;c=4'bx000;
  end
  initial begin
    $monitor("a=%b, b=%b, c=%b, out=%b, zr=%b", a, b, c, out, zr);
  end
endmodule
