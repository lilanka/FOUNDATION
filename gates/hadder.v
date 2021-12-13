`include "and.v"

// add 2, 1-bits
module HAdder(output reg sum, carry, input a, b);
  And d0(carry, a, b);
  always @ (a, b) begin
    if (a == b) begin
      sum = 1'b0;
    end
    else
      sum = 1'b1;
  end
endmodule
