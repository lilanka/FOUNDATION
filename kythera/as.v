`include "arith/adder.v"

module KY32_as32(
  output  [31:0]  out,
  input   [31:0]  a, b,
  input           sub
);
  wire  [31:0]  b_temp = b ^ {32{sub}};
  KY32_cla32 as(out, a, b_temp, sub);
endmodule
