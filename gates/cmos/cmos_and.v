module KY32_cmos_and(output out, input a, b);
  supply1 vdd;
  supply0 gnd;

  wire p1_o, n1_o;

  pmos p1(p1_o, vdd, b);
  pmos p2(p1_o, vdd, a);
  pmos p3(out, vdd, p1_o);
  nmos n1(n1_o, gnd, b);
  nmos n2(p1_o, n1_o, a);
  nmos n3(out, gnd, p1_o);
endmodule
