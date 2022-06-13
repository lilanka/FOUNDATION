module top(input  logic         clk, reset,
           output logic [31:0]  WriteData, DataAddr,
           output logic         MemWrite);

  logic [31:0] PC, Instr, ReadData;

  // instatiate processor and memories
  kythera   ky(clk, reset, PC, Instr, MemWrite, DataAddr, WriteData, ReadData);
  instrMem  imem(PC, Instr);
  dataMem   dmem(clk, MemWrite, DataAddr, WriteData, ReadData);
endmodule
