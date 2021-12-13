module Or(output reg out, input a, b);
  always @ (a, b) begin
    if (a==1'b0 & b==1'b0) begin
      out = 1'b0; 
    end
    else
      out = 1'b1; 
    end
endmodule

module Or16(out, a, b);
  input [15:0] a, b;
  output [15:0] out;

  Or d0(out[0], a[0], b[0]);
  Or d1(out[1], a[1], b[1]);
  Or d2(out[2], a[2], b[2]);
  Or d3(out[3], a[3], b[3]);
  Or d4(out[4], a[4], b[4]);
  Or d5(out[5], a[5], b[5]);
  Or d6(out[6], a[6], b[6]);
  Or d7(out[7], a[7], b[7]);
  Or d8(out[8], a[8], b[8]);
  Or d9(out[9], a[9], b[9]);
  Or d10(out[10], a[10], b[10]);
  Or d11(out[11], a[11], b[11]);
  Or d12(out[12], a[12], b[12]);
  Or d13(out[13], a[13], b[13]);
  Or d14(out[14], a[14], b[14]);
  Or d15(out[15], a[15], b[15]);
endmodule 

module Or8Way(out, a);
  input [7:0] a;
  output out;

  Or d0(out, a[0], a[1]);
  Or d1(out, a[2], a[3]);
  Or d2(out, a[4], a[5]);
  Or d3(out, a[6], a[7]);
endmodule
