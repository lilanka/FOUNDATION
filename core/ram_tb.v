`include "ram.v"

module ram_tb;
  reg [15:0] in;
  reg ld, clk;
  reg [13:0] addr;

  wire [15:0] out;

  Ram16K u0(out, in, addr, clk, ld);

  initial begin
    clk=0;
    $monitor("in=%b, clk=%b, ld=%b, addr=%b, out=%b", $stime, in, clk, ld, addr, out);
      #10 in=3; ld=1; addr=2;
      #10 ld=0;
      #10 
      $finish;
  end

  always #2 begin
    clk=~clk;
  end
endmodule
