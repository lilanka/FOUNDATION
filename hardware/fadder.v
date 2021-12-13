// add 3, 1-bits
`include "hadder.v"

module FAdder(output carry, sum, input a, b, c);
  assign {carry, sum} = a + b + c;
endmodule
