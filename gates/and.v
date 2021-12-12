module And(output reg out, input a, b);
  always @ (a, b) begin
    if (a==1'b1 & b==1'b1) begin
      out = 1'b1; 
    end
    else
      out = 1'b0; 
    end
endmodule

module And16(out, a, b);
  input [15:0] a, b;
  output [15:0] out;

  And d0(out[0], a[0], b[0]);
  And d1(out[1], a[1], b[1]);
  And d2(out[2], a[2], b[2]);
  And d3(out[3], a[3], b[3]);
  And d4(out[4], a[4], b[4]);
  And d5(out[5], a[5], b[5]);
  And d6(out[6], a[6], b[6]);
  And d7(out[7], a[7], b[7]);
  And d8(out[8], a[8], b[8]);
  And d9(out[9], a[9], b[9]);
  And d10(out[10], a[10], b[10]);
  And d11(out[11], a[11], b[11]);
  And d12(out[12], a[12], b[12]);
  And d13(out[13], a[13], b[13]);
  And d14(out[14], a[14], b[14]);
  And d15(out[15], a[15], b[15]);
endmodule 
