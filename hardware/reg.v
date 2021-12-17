`include "dff.v"

module Reg16(q, in, clk, ld);
  input [15:0] in; 
  input clk, ld;
  
  output wire [15:0] q;

  wire [15:0] qb;
  reg [15:0] d;

  initial begin
    d=in;
    $display("d=%b, in=%b, ", d, in);
  end

  Dff d0(q[0], qb[0], d[0], clk);
  Dff d1(q[1], qb[1], d[1], clk);
  Dff d2(q[2], qb[2], d[2], clk);
  Dff d3(q[3], qb[3], d[3], clk);
  Dff d4(q[4], qb[4], d[4], clk);
  Dff d5(q[5], qb[5], d[5], clk);
  Dff d6(q[6], qb[6], d[6], clk);
  Dff d7(q[7], qb[7], d[7], clk);
  Dff d8(q[8], qb[8], d[8], clk);
  Dff d9(q[9], qb[9], d[9], clk);
  Dff d10(q[10], qb[10], d[10], clk);
  Dff d11(q[11], qb[11], d[11], clk);
  Dff d12(q[12], qb[12], d[12], clk);
  Dff d13(q[13], qb[13], d[13], clk);
  Dff d14(q[14], qb[14], d[14], clk);
  Dff d15(q[15], qb[15], d[15], clk);
 
  always @ (clk, ld) begin 
    @ (posedge clk) begin
      if (ld==1'b1) begin
        d<=in;
      end
    end
  end
endmodule
