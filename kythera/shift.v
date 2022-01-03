`include "mux.v"

module KY32_shift(
  output  reg [31:0]  out,
  input       [31:0]  in,
  input       [4:0]   sa,
  input               right,
  input               arith
);
 
  always @ (*) begin
    if (!right) begin
      out = in << sa;
    end
    else if (!arith) begin
      out = in >> sa;
    end
    else begin
      out = $signed(in) >>> sa;
    end
  end
endmodule
