module KY32_cmos_or(output out, input a, b);
  supply1 vdd;
  supply0 gnd;

  wire p1_o, p2_o;

  pmos p1(p1_o, vdd, a);
  pmos p2(p2_o, p1_o, b);
  nmos n1(p2_o, gnd, a);
  nmos n2(p2_o, gnd, b);
  nmos n3(out, gnd, p2_o);
  pmos p3(out, vdd, p2_o);
endmodule
