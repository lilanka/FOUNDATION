`timescale 1ns/1ns

`include "../cmos_not.v"

module KY32_cmos_not_tb;
  reg in;
  wire out;

  KY32_cmos_not cn(out, in);
  initial begin
        in = 0;
    #1  in = 1;
    #1  in = 0;
    #1  $finish;
  end 
  initial begin
    $monitor("%2d:\ta = %b\tf = %b", $time, in, out);
  end
endmodule
