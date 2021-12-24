// RISC-V based Register file
// see https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

module ZUSS_REG_FILE(
  input   wire [4:0]  r_addr1, r_addr2,     // addr of registers (read)
  input   wire [4:0]  w_addr,               // register writing addr
  input   wire [31:0] w_data,               // content to write
  input   wire        we,                   // write enable
  input   wire        clk,                  // clock
  output  reg  [31:0] o1, o2                // outputs 
);

  reg [31:0] registers [0:32];
 
  // read1 register value
  always @ (*) begin
    if (r_addr1 == 5'h0)
      o1 <= 32'b0;
    else begin
      o1 <= registers[r_addr1];
    end
  end 

  // read2 register value
  always @ (*) begin
    if (r_addr2 == 5'h0)
      o2 <= 32'b0;
    else begin
      o2 <= registers[r_addr2];
    end
  end 

  // write to registers
  always @ (posedge clk) begin
    registers[5'h0] <= 32'b0;
    if (we && w_addr != 5'h0) begin
      registers[w_addr] <= w_data;
    end
  end
endmodule
