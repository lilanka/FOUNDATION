module regfile(input  logic [5:0]   addr1, addr2,  // dout1, dout2
               input  logic [5:0]   addr3,         // din
               input  logic [31:0]  din,
               input  logic         clk,
               input  logic         we,
               output logic [31:0]  dout1, dout2);

  logic [31:0]  rf[31:0];
  
  always @ (posedge clk) begin
    if (we) rf[addr3] <= din;
  end

  assign dout1 = (addr1 != 0) ? rf[addr1] : 0;
  assign dout2 = (addr2 != 0) ? rf[addr2] : 0;
endmodule
