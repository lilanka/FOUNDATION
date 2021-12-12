`include "dmux.v"

module dmux_tb;
  reg in, sel;
  wire a, b;
  DMux dut(a, b, in, sel);
    initial begin
      #000 in=0;sel=0;
      #100 in=1;sel=0;
      #100 in=0;sel=1;
      #100 in=1;sel=1;
    end
    initial begin
      $monitor($time, " in=%b, sel=%b, a=%b, b=%b", in, sel, a, b);
  $dumpfile("dump.vcd");
  $dumpvars();
    end
endmodule
