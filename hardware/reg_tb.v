`include "reg.v"

module reg_tb;
  reg [15:0] in;
  reg clk, ld;
  wire [15:0] q;

  Reg16 u0(q, in, clk, ld);
    initial begin
    in=16'd10;clk=1'b1;ld=1'b1;
    # 10
    # 10 
    in=16'd2001;clk=1'b0;ld=1'b1;
    # 10 
    in=16'd2051;clk=1'b1;ld=1'b0;
    # 10 
    in=16'd2351;clk=1'b0;ld=1'b0;
    end
  initial begin
    $monitor("q=%b, in=%b, clk=%b, ld=%b", q, in, clk, ld);
  end
endmodule
