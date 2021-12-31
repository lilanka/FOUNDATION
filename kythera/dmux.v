module KY32_dmux1x8(
  output  [7:0] out,
  input   [2:0] s,
  input         a
);
  assign out = (1 << s) & {8{a}};
endmodule
