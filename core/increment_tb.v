`include "increment.v"

module increment_tb;
  reg [15:0] a = 16'b0000000000000001;
  wire [15:0] out;

  Incr16 u1(out, a);

  initial begin
    $monitor($time, " a=%b, out=%b", a, out);
  end
endmodule
