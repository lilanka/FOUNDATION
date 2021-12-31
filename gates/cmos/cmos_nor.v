module KY32_cmos_nor(output out, input a, b);
  supply1 vdd;
  supply0 gnd;
  
  wire p1_o;

  pmos p1(p1_o, vdd, a);
  pmos p2(out, p1_o, b);
  nmos n1(out, gnd, a);
  nmos n2(out, gnd, b);
endmodule
