module ram(input  logic [5:0]   addr,
           input  logic [31:0]  din,
           input  logic         clk,
           input  logic         we,
           output logic [31:0]  dout);

  logic [31:0]  mem[2**6-1:0]

  always @ (posedge clk) begin
    if (we) mem[addr]  <= din;
  end

  assign dout = mem[addr];
endmodule
