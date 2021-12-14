`include "dff.v"

module dff_tb;
  reg clk, in;
  wire q, qb;
  integer i;

  Dff d0(q, qb, in, clk);

  initial begin
    $monitor("in=%b, clk=%b, q=%b, qb=%b", in, clk, q, qb);
    #10 in=0;
    #10 in=1;

    #10 in=0;
    #10 in=1;
  end

  initial begin
    clk=0;
    for(i=0;i<20;i=i+1)
      #1 clk=~clk;
    end
endmodule
