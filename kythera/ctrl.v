module KY32_ctrl(
  output  [3:0] aluc,
  output  [1:0] pcsrc,
  output        regc,
  output        regrt1,
  output        mem2reg,
  output        shift,
  output        aluimm,
  output        jal,
  output        sext,
  output        memc,
  input   [6:0] op, 
  input   [2:0] func3,
  input   [6:0] func7,
  input         zr
);
  wire  rtype   = ~op[6]&op[5]&op[4]&~op[3]&~op[2]&op[1]&op[0];
  wire  itype   = ~op[6]&~op[5]&op[4]&~op[3]&~op[2]&op[1]&op[0];
  wire  b       = op[6]&op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
  
  wire  i_add   = rtype&~|func7&~|func3;
  wire  i_sub   = rtype&~func7[6]&func7[5]&~func7[4]&~func7[3]&~func7[2]&~func7[1]&~|func3;
  wire  i_and   = rtype&~|func7&func3;
  wire  i_or    = rtype&~|func7&func3[2]&func3[1]&~func3[0];
  wire  i_xor   = rtype&~|func7&func3[2]&~func3[1]&~func3[0];
  wire  i_sll   = rtype&~|func7&func3[2]&func3[1]~func3[0];
  wire  i_sra   = rtype&~func7[6]&func7[5]&~func7[4]&~func7[3]&~func7[2]&~func7[1]&func3[2]&~func3[1]&func3[0];
  wire  i_addi  = itype&~|func3;
  wire  i_aubi  = itype&func3;
  wire  i_ori   = itype&func3[2]&func3[1]&~func3[0];
  wire  i_xori  = itype&func3[2]&~func3[1]&~func3[0];
  wire  i_lw    = ~op[6]&~op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
  wire  i_beq   = b&~|func3;
  wire  i_jalr  = b&~|func3;
  wire  i_bne   = b&~func3[2]&~func3[1]&func3[0];
  wire  i_lui   = ~op[6]&op[5]&op[4]&~op[3]&op[2]&op[1]&op[0];
  wire  i_jal   = op[6]&op[5]&~op[4]&op[3]&op[2]&op[1]&op[0];

  // control signals
  assign regrt1   = i_addi | i_andi | i_ori | i_xori | i_lw | i_lui;
  assign jal      = i_jal;
  assign mem2reg  = i_lw;
  assign memc     = i_sw;
  assign aluc[3]  = i_sra;
  assign aluc[2]  = i_sub | i_or | i_sra | i_ori | i_lui;
  assign aluc[1]  = i_xor | i_sll | i_srl | i_sra | i_xori | i_beq | i_bne | i_lui;
  assign aluc[0]  = i_and | i_or | i_sll | i_srl | i_sra | i_andi | i_ori;
  assign shift    = i_sll | i_srl | i_sra;
  assign aluimm   = i_addi | i_andi | i_ori | i_xori | i_lw | i_lui | i_sw;
  assign sext     = i_addi | i_lw | i_sw | i_beq | i_bne;
  assign pcsrc[1] = i_jr | i_jal;
  assign pcsrc[0] = i_beq & zr | i_bne &~zr | i_jal;
  assign regc     = i_add | i_sub | i_and | i_or | i_xor | i_sll | i_srl | i_sra | i_addi | i_andi | i_ori | i_xori | i_lw | i_lui | i_jal; 
endmodule
