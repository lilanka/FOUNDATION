`include "reg.v"

module reg_tb;
  reg [15:0] in;
  reg clk, lg;
  wire [15:0] q;

  Reg16 u1(q, in, clk, ld);

  initial begin
    $monitor("q=%b, in=%b, clk=%b", q, in, clk);
      clk=1'b0;
      in =16'b1101100011010101;
      #10

      #10
      clk = 1'b1;
      in =16'b1101111011011101;
  end
endmodule
