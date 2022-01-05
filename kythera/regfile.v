module KY32_regfile(
  output [31:0]  a_o, b_o,
  input  [4:0]   a_addr, b_addr,
  input  [31:0]  wd,                             // write data
  input  [4:0]   w_addr,
  input  [4:0]   we,
  input          clk, rst
);
  reg [31:0] register [1:31];                         // reg 0 is 0 
  assign a_o = (a_addr == 0) ? 0 : register[a_addr];
  assign b_o = (b_addr == 0) ? 0 : register[b_addr];

  integer i;
  always @ (posedge clk or negedge rst) begin
    if (!rst)
      for (i=0; i<32; i=i+1)
        register[i] <= 0;
    else
      if ((w_addr != 0) && we)
        register[w_addr] <= wd;
  end
endmodule
