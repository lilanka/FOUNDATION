`include "cmos_nand.v"

module KY32_mux2to1(output out, input a, b, s);
  wire o1, o2, o3;

  KY32_cmos_nand nnd1(o1, s, s);
  KY32_cmos_nand nnd2(o2, o1, a);
  KY32_cmos_nand nnd3(o3, s, b);
  KY32_cmos_nand nnd4(out, o2, o3);
endmodule
