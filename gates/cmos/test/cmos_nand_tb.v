`timescale 1ns/1ns

`include "../cmos_nand.v"

module KY32_cmos_nand_tb;
  reg a, b; 
  wire out;

  KY32_cmos_nand cn(out, a, b);
  initial begin
        a = 0; b = 0;
    #1  a = 0; b = 1;
    #1  a = 1; b = 0;
    #1  a = 1; b = 1;
    #1  $finish;
  end 
  initial begin
    $monitor("%2d:\ta = %b\tb = %b\tf = %b", $time, a, b, out);
  end
endmodule
