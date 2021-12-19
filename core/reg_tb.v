`include "reg.v"

module reg_tb;
  reg [15:0] in;
  reg clk, ld;
  wire [15:0] out;

  Reg16 u0(out, in, clk, ld);
    initial begin
    in=16'd10;clk=1'b1;ld=1'b1;
    # 10
    # 10 
    in=16'd2001;clk=1'b0;ld=1'b1;
    end
  initial begin
    $monitor("out=%b, in=%b, clk=%b, ld=%b", out, in, clk, ld);
  end
endmodule
