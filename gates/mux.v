module Mux(output reg out, input a, b, sel);
  always @ (a, b, sel) begin
    if (sel==0) begin
      out = a;
    end
    else 
      out = b;
  end
endmodule

module Mux16(out, a, b, sel);
  input [15:0] a, b;
  input sel;
  output [15:0] out;

  Mux d0(out[0], a[0], b[0], sel);
  Mux d1(out[1], a[1], b[1], sel);
  Mux d2(out[2], a[2], b[2], sel);
  Mux d3(out[3], a[3], b[3], sel);
  Mux d4(out[4], a[4], b[4], sel);
  Mux d5(out[5], a[5], b[5], sel);
  Mux d6(out[6], a[6], b[6], sel);
  Mux d7(out[7], a[7], b[7], sel);
  Mux d8(out[8], a[8], b[8], sel);
  Mux d9(out[9], a[9], b[9], sel);
  Mux d10(out[10], a[10], b[10], sel);
  Mux d11(out[11], a[11], b[11], sel);
  Mux d12(out[12], a[12], b[12], sel);
  Mux d13(out[13], a[13], b[13], sel);
  Mux d14(out[14], a[14], b[14], sel);
  Mux d15(out[15], a[15], b[15], sel);
endmodule 
