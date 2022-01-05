// https://five-embeddev.com/riscv-isa-manual/latest/rv32.html

`include "dff.v"
`include "arith/adder.v"
`include "mux.v"
`include "regfile.v"

module KY32_cpu(
  output  [31:0]  pc,
  output          datac,                  // dmem control 
  output  [31:0]  alu,
  output  [31:0]  data,
  input           clk, rst,
  input   [31:0]  ins
);
  wire  [6:0]   op      = ins[6:0];
  wire  [4:0]   rd      = ins[11:7];
  wire  [4:0]   rs1     = ins[19:15];
  wire  [4:0]   rs2     = ins[24:20];
  wire  [2:0]   func3   = ins[14:12];
  wire  [6:0]   func7   = ins[31:25];
  wire  [11:0]  immi    = ins[31:20];     // I type imm
  wire  [19:0]  immuj   = ins[31:12];     // U/J type imm
  
  wire  [3:0]   aluc;
  wire  [1:0]   pcc;                      // pc source
  wire          regc;                     // register control (write = 1)
  wire          regrs1;                   // reg selection rs1
  wire          mem2reg;                  // lw
  wire          shift;                  
  wire          aluimm;                   // alu input b is I32
  wire          jal;            
  wire          sext;                     // sign extension

  wire  [31:0]  incrpc;                   // pc+4
  wire  [31:0]  bpc;                      // branch target addr
  wire  [31:0]  npc;                      // next pc
  wire  [31:0]  rega;                     // reg out a
  wire  [31:0]  regb;                     // reg out b
  wire  [31:0]  alua;                     // alu input a
  wire  [31:0]  alub;                     // alu input b
  wire  [31:0]  regdata;                  // reg write data
  wire  [31:0]  r;                        // alu out or mem
  wire  [31:0]  shamt = ins[4:0]          // shift ammount
  wire  [4:0]   reg_type;                 // rs1 or rs2
  wire  [4:0]   wn    = reg_type | {5{jal}}; // regfile write addr
  wire          zr;                       // alu zero
  wire  [19:0]  s20   = {20{sext & ins[31]}}; // 20-bit sign
  wire  [31:0]  imm32 = {s20, immuj};       // 32-bit immediate
  wire  [31:0]  dis   = {s20[13:0], immuj, 2'b00};
  wire  [31:0]  jpc   = {incrpc[31:28],  

  // control unit 
  // KY32_ctrl cu();

  // datapath
  KY32_dffe dff(pc, npc, clk, rst);
  KY32_cla32 pcincr(incrpc, pc, 32'h4, 1'b0);
  KY32_cla32 br_addr(bpc, incrpc, dis, 1'b0);
  KY32_mux2x32 aluia(alua, rega, shamt, shift);
  KY32_mux2x32 aluib(alub, rega, imm32, aluimm);
  KY32_mux2x32 alu_or_mem(r, alu, data, mem2reg);
  KY32_mux2x32 r_or_incrpc(regdata, r, incrpc, jal);
  KY32_mux2x5 rs1_or_rs2(reg_type, rd, rs1, regrs1);
  //KY32_mux4x32 next_pc(npc, incrpc, bpc, rega, jpc, pcc);
  KY32_regfile rf(rega. regb, rs1, rs2, regdata, wn, regc, clk, rst);
  KY32_alu alu(alu, zr, alua, alub, aluc);
  assign data = regb;
endmodule
