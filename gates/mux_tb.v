`include "mux.v"
/*
module mux_tb;
  reg a, b, sel;
  wire out;
  Mux dut(out, a, b, sel);
    initial begin
      #000 a=0;b=0;sel=0;
      #100 a=0;b=1;sel=0;
      #100 a=1;b=0;sel=0;
      #100 a=1;b=1;sel=0;
      #100 a=0;b=0;sel=1;
      #100 a=0;b=1;sel=1;
      #100 a=1;b=0;sel=1;
      #100 a=1;b=1;sel=1;
    end
    initial begin
      $monitor($time, " a=%b, b=%b, sel=%b, out=%b", a, b, sel, out);
  $dumpfile("dump.vcd");
  $dumpvars();
    end
endmodule
*/

module or16_tb;
  reg [15:0] a = 16'b0000000000000001;
  reg [15:0] b = 16'b0000000000000000;
  reg        sel = 0;
  wire [15:0] out;

  Mux16 u1(out, a, b, sel);

  initial begin
    $monitor("a=%b, b=%b, out=%b", a, b, out);
  end
endmodule 
