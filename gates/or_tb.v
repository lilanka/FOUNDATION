`include "or.v"

/*
module or_tb;
  reg a, b;
  wire out;
  Or dut(out, a, b);
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

module or16_tb;
  reg [15:0] a = 16'b0000000000000001;
  reg [15:0] b = 16'b0000000000000000;
  wire [15:0] out;

  Or16 u1(out, a, b);

  initial begin
    $monitor("a=%b, b=%b, out=%b", a, b, out);
  end
endmodule 
*/
module or8way_tb;
  reg [7:0] a = 8'b00100100;
  wire out = 1;

  Or8Way u1(out, a);

  initial begin
    $monitor("a=%b, out=%b", a, out);
  end
endmodule 



