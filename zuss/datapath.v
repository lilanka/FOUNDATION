`include "reg_file.v"
`include "alu.v"

module ZUSS_DATAPATH(
  input [4:0] r_addr1, r_addr2, w_addr,
  input [4:0] op,
  input       we, clk,
  output      zr
);

  wire [31:0] r_data1, r_data2, w_data;

  ZUSS_REG_FILE reg_file(r_addr1, r_addr2, w_addr, w_data, re, clk, r_data1, r_data2);
  ZUSS_ALU      alu(r_data1, r_data2, op, zr, w_data);
endmodule
