// single-cycle

module kythera32(
  output  [31:0]  pc,       // program counter
  output  [31:0]  ins,      // instruction 
  output  [31:0]  alu_o,    // alu output
  output  [31:0]  dmem_o,   // data memory output 
  input           clk, rst
);

  wire    [31:0]  data;        // data storing in dmem
  wire            datac;       // data memory write control
  
  KY32_cpu    cpu(pc, datac, alu_o, data, clk, rst, ins);
  //KY32_imem   imem(
  //KY32_dmem   dmem(
endmodule
