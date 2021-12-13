`include "and.v"

// add 2, 1-bits
module HAdder(output sum, carry, input a, b);
  assign {carry, sum} = a + b;
endmodule
