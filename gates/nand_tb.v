`include "nand.v"

module nand_tb;
  reg a, b;
  wire out;
  Nand dut(out, a, b);
    initial begin
      #000 a=0;b=0;
      #100 a=0;b=1;
      #100 a=1;b=0;
      #100 a=1;b=1;
    end
    initial begin
      $monitor($time, " a=%b, b=%b, out=%b", a, b, out);
  $dumpfile("dump.vcd");
  $dumpvars();
    end
endmodule
