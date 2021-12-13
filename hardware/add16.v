module Add16(out, a, b);
  input [15:0] a, b;
  output reg [15:0] out;
  
  always @ (a, b) begin
    out = a + b;
  end
endmodule
