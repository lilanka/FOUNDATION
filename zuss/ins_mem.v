module ZUSS_INS_MEM(
  input       [31:0]  addr,
  input               clk,
  output reg  [31:0]  out
);

  reg [31:0] mem [1023:0];

  always @ (posedge clk) begin
    out <= mem[addr[9:0]];
  end
endmodule
