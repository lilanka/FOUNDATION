`include "not.v"

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
