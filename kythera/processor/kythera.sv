module kythera(input  logic         clk, reset,
               input  logic [31:0]  instr,
               input  logic [31:0]  ReadData,
               output logic         DMemwe,
               output logic [31:0]  ALUOut, WriteData,
               output logic [31:0]  pc);

  logic       ALUMuxc, Regwe, Branch, Jump; 
  logic [1:0] Extendc, DMemMuxc;
  logic [2:0] ALUc;
