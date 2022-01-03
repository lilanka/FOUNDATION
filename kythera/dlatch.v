module KY32_sr_latch(
  output  q, qn,
  input   s, r
);
  nand n1(q, s, qn);
  nand n2(qn, r, q);
endmodule

module KY32_dlatch(
  output  q, qn,
  input   d, c   
);

  wire s, r, nd;
  nand ns(s, d, c);
  nand nr(r, ~d, c);
  sr_latch sr(q, qn, s, r);
endmodule

module KY32_dff(
  output  q, qn,
  inupt   in, clk
);

  wire q_o, qn_o, clkn, clknn;
  not nt1(clkn, clk);
  not nt2(clknn, clkn)'
  KY32_dlatch(q_o, qn_o, in, clkn);
  KY32_dlatch(q, qn, q_o, clknn);
endmodule
