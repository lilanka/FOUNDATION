`include "add16.v"

module adder_tb;
  reg [15:0] a = 16'b0000000000000001;
  reg [15:0] b = 16'b0000000000000011;
  wire [15:0] out;

  Add16 u1(out, a, b);

  initial begin
    $monitor($time, " a=%b, b=%b, out=%b", a, b, out);
  end
endmodule
