`include "reg.v"
`include "mux.v"

module Ram8(out, in, addr, clk, ld);
  input [15:0] in;
  input clk, ld;
  input [2:0] addr;

  output [15:0] out;
  wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7;

  DMux8Way g0(e0, e1, e2, e3, e4, e5, e6, e7, 1'b1, addr);

  And a0(l0, e0, ld); 
  And a1(l1, e1, ld); 
  And a2(l2, e2, ld);
  And a3(l3, e3, ld);
  And a4(l4, e4, ld);
  And a5(l5, e5, ld);
  And a6(l6, e6, ld);
  And a7(l7, e7, ld);

  Reg16 r0(o0, in, clk, l0);
  Reg16 r1(o1, in, clk, l1);
  Reg16 r2(o2, in, clk, l2);
  Reg16 r3(o3, in, clk, l3);
  Reg16 r4(o4, in, clk, l4);
  Reg16 r5(o5, in, clk, l5);
  Reg16 r6(o6, in, clk, l6);
  Reg16 r7(o7, in, clk, l7);

  Mux8Way16 g1(out, o0, o1, o2, o3, o4, o5, o6, o7, addr);
endmodule

module Ram64(out, in, addr, clk, ld);
  input [15:0] in;
  input clk, ld;
  input [5:0] addr;

  output [15:0] out;
  wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7;

  DMux8Way g0(e0, e1, e2, e3, e4, e5, e6, e7, 1'b1, addr[5:3]);

  And a0(l0, e0, ld); 
  And a1(l1, e1, ld); 
  And a2(l2, e2, ld);
  And a3(l3, e3, ld);
  And a4(l4, e4, ld);
  And a5(l5, e5, ld);
  And a6(l6, e6, ld);
  And a7(l7, e7, ld);

  Ram8 r0(o0, in, addr[2:0], clk, l0);
  Ram8 r1(o1, in, addr[2:0], clk, l1);
  Ram8 r2(o2, in, addr[2:0], clk, l2);
  Ram8 r3(o3, in, addr[2:0], clk, l3);
  Ram8 r4(o4, in, addr[2:0], clk, l4);
  Ram8 r5(o5, in, addr[2:0], clk, l5);
  Ram8 r6(o6, in, addr[2:0], clk, l6);
  Ram8 r7(o7, in, addr[2:0], clk, l7);

  Mux8Way16 g1(out, o0, o1, o2, o3, o4, o5, o6, o7, addr[5:3]);
endmodule
