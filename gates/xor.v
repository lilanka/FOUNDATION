module Xor(output reg out, input a, b);
  always @ (a, b) begin
    if (a!=b) begin
      out = 1'b1; 
    end
    else
      out = 1'b0; 
    end
endmodule
