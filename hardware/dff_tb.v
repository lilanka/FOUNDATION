`include "dff.v"

module dff_tb;
  reg clk, in, ld;
  wire out;

  Dff d0(out, in, clk, ld);

  initial begin
    $monitor("in=%b, clk=%b, ld=%b, out=%b", in, clk, ld, out);
    clk=1'b1;
    ld=1'b1;
    in=1'b1;
    in=1'b0;
    #10

    #10
    clk=1'b0;
    ld=1'b0;
    in=1'b0;
    in=1'b1;
  end

endmodule
