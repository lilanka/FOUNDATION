`include "datapath.v"

module datapath_tb;
  reg [4:0] r_addr1, r_addr2, w_addr;
  reg [4:0] op;
  reg we, clk;

  ZUSS_DATAPATH datapath(r_addr1, r_addr2, w_addr, op, we, clk, zr);

  initial begin
    $dumpfile("output_wave.vcd");
    $dumpvars(0, datapath_tb);
  end

  initial begin
    #25 r_addr1 = 0; r_addr2 = 0;
    #20 r_addr1 = 0; r_addr2 = 1;
    #20 r_addr1 = 0; r_addr2 = 1;
    #20 r_addr1 = 1; r_addr2 = 2;
  end

  initial begin
    we = 0;
    #10
    we = 1;
  end

  initial begin
    op = 5'b00000;
  end

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial
    #200 $finish;
endmodule
