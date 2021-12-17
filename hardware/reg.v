`include "dff.v"

module Reg16(q, in, clk, ld);
  output wire [15:0] q;
  input [15:0] in; 
  input clk, ld;
  
  wire [15:0] qb;
  reg [15:0] d;

  Dff d0(q[0], qb[0], in[0], clk);
  Dff d1(q[1], qb[1], in[1], clk);
  Dff d2(q[2], qb[2], in[2], clk);
  Dff d3(q[3], qb[3], in[3], clk);
  Dff d4(q[4], qb[4], in[4], clk);
  Dff d5(q[5], qb[5], in[5], clk);
  Dff d6(q[6], qb[6], in[6], clk);
  Dff d7(q[7], qb[7], in[7], clk);
  Dff d8(q[8], qb[8], in[8], clk);
  Dff d9(q[9], qb[9], in[9], clk);
  Dff d10(q[10], qb[10], in[10], clk);
  Dff d11(q[11], qb[11], in[11], clk);
  Dff d12(q[12], qb[12], in[12], clk);
  Dff d13(q[13], qb[13], in[13], clk);
  Dff d14(q[14], qb[14], in[14], clk);
  Dff d15(q[15], qb[15], in[15], clk);
  
  always @ (posedge clk) begin 
    if (clk) begin
      d = in;
    end
  end
endmodule
