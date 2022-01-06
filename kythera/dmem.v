module KY32_dmem(
  output  [31:0]  out,
  input   [31:0]  data,        // data into memory
  input   [31:0]  addr,        // ram addr
  input           clk, e
);
  reg [31:0]  dmem [31:0];
  assign out = dmem[addr[19:15]];
  integer i; 

  always @ (posedge clk) begin
    if (e) 
      dmem[addr[19:15]] = data;
  end
endmodule
