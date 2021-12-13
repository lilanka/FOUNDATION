module Incr16(out, a);
  input [15:0] a;
  output reg [15:0] out;

  always @ (a) begin
    out = a + 16'b0000000000000001;
  end
endmodule
