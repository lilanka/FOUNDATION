// carry-lookahead adder

module add(
  output g, p, s, 
  input  a, b, c
);
  assign s = a ^ b ^ c;
  assign g = a & b;
  assign p = a | b;
endmodule

module gp(
  output      g_o, p_o, c_o,
  input [1:0] g, p,
  input       c
);
  assign g_o = g[1] | p[1] & g[0];
  assign p_o = p[1] & p[0];
  assign c_o = g[0] | p[0] & c;
endmodule

module cla2(
  output        g_o, p_o,
  output [1:0]  s,
  input  [1:0]  a, b,
  input         c
);

  wire [1:0]  g, p;
  wire        c_o;

  add a0(g[0], p[0], s[0], a[0], b[0], c);
  add a1(g[1], p[1], s[1], a[1], b[1], c_o);
  gp  gp0(g_o, p_o, c_o, g, p, c);
endmodule

module cla4(
  output        g_o, p_o, 
  output [3:0]  s,
  input  [3:0]  a, b,
  input         c
);
  wire [1:0]  g, p;
  wire        c_o;
  cla2 c0(g[0], p[0], s[1:0], a[1:0], b[1:0], c);
  cla2 c1(g[1], p[1], s[3:2], a[3:2], b[3:2], c_o);
  gp  gp0(g_o, p_o, c_o, g, p, c);
endmodule

module cla8(
  output        g_o, p_o,
  output [7:0]  s, 
  input  [7:0]  a, b,
  input         c
);
  wire [1:0]  g, p;
  wire        c_o;

  cla4 c0(g[0], p[0], s[3:0], a[3:0], b[3:0], c);
  cla4 c1(g[1], p[1], s[7:4], a[7:4], b[7:4], c_o);
  gp  gp0(g_o, p_o, c_o, g, p, c);
endmodule

  
module cla16(
  output         g_o, p_o,
  output [15:0]  s, 
  input  [15:0]  a, b,
  input          c
);
  wire [1:0]  g, p;
  wire        c_o;
  always @ * begin
    $display("cl31: a=%b, b=%b", a, b);
  end
  cla8 c0(g[0], p[0], s[7:0], a[7:0], b[7:0], c);
  cla8 c1(g[1], p[1], s[15:8], a[15:8], b[15:8], c_o);
  gp  gp0(g_o, p_o, c_o, g, p, c);
endmodule

module cla32(
  output         g_o, p_o,
  output [31:0]  s, 
  input  [31:0]  a, b,
  input          c
);
  wire [1:0]  g, p;
  wire        c_o;

  cla16 c0(g[0], p[0], s[15:0], a[15:0], b[15:0], c);
  cla16 c1(g[1], p[1], s[31:16], a[31:16], b[31:16], c_o);
  gp  gp0(g_o, p_o, c_o, g, p, c);
endmodule

module KY32_cla32(
  output  [31:0]  s,
  input   [31:0]  a, b,
  input           c
);
  wire g_o, p_o;

  cla32 c0(g_o, p_o, s, a, b, c);
endmodule
