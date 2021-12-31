module KY32_cmos_not(output out, input in);
  supply1 vdd;
  supply0 gnd;

  pmos p1(out, vdd, in);
  nmos n1(out, gnd, in);
endmodule
