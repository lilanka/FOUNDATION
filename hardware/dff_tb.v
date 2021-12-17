`include "dff.v"

module dff_tb;
  reg clk, in;
  wire q, qb;
  integer i;

  Dff d0(q, qb, in, clk);

  initial begin
    $monitor("in=%b, clk=%b, q=%b, qb=%b", in, clk, q, qb);
    clk=1'b1;
    in=1'b1;
    in=1'b0;
    #10

    #10
    clk=1'b0;
    in=1'b0;
    in=1'b1;
  end

endmodule
