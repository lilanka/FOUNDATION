module KY32_cmos_nand(output out, input a, b);
  supply1 vdd;
  supply0 gnd;
  
  wire n2_s; 

  pmos p1(out, vdd, a);
  pmos p2(out, vdd, b);
  nmos n2(n2_s, gnd, b);
  nmos n1(out, n2_s, a);
endmodule
