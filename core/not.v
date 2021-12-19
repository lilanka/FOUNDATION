module Not(output reg out, input a);
  always @ (a) begin
    if (a==1'b0) begin
      out = 1'b1;
    end
    else
      out = 1'b0;
    end
endmodule

module Not16(out, a);
  input [15:0] a;
  output [15:0] out;

  Not d0(out[0], a[0]);
  Not d1(out[1], a[1]);
  Not d2(out[2], a[2]);
  Not d3(out[3], a[3]);
  Not d4(out[4], a[4]);
  Not d5(out[5], a[5]);
  Not d6(out[6], a[6]);
  Not d7(out[7], a[7]);
  Not d8(out[8], a[8]);
  Not d9(out[9], a[9]);
  Not d10(out[10], a[10]);
  Not d11(out[11], a[11]);
  Not d12(out[12], a[12]);
  Not d13(out[13], a[13]);
  Not d14(out[14], a[14]);
  Not d15(out[15], a[15]);
endmodule
