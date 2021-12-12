`include "not.v"
/*
module not_tb;
  reg a; 
  wire out;
  Not dut(out, a);
    initial begin
      #000 a=0;
      #100 a=1;
    end
    initial begin
      $monitor($time, " a=%b, out=%o", a, out);
  $dumpfile("dump.vcd");
  $dumpvars();
    end
endmodule
*/

module not16_tb;
  reg [15:0] a = 16'b0000000000000001;
  wire [15:0] out;

  Not16 u1(out, a);

  initial begin
    $monitor("a=%b, out=%b", a, out);
  end
endmodule
