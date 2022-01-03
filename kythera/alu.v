`include "as.v"
`include "shift.v"

module KY32_alu(
  output  [31:0]  out,
  output          zr,
  input   [31:0]  a, b,
  input   [3:0]   c
);
  wire    [31:0]  and_o = a & b;
  wire    [31:0]  or_o  = a | b;
  wire    [31:0]  xor_o = a ^ b;
  wire    [31:0]  lui_o = {b[15:0], 16'h0};
  wire    [31:0]  sll_o = c[2] ? or_o : and_o;
  wire    [31:0]  srl_o = c[2] ? lui_o: xor_o;
  wire    [31:0]  as_o, sh_o;
  
  KY32_as32 andsub(as_o, a, b, c[2]);
  KY32_shift sh(sh_o, b, a[4:0], c[2], c[3]);
  KY32_mux4x32 mx(out, as_o, sll_o, srl_o, sh_o, c[1:0]);
  assign zr = ~|out;
endmodule
