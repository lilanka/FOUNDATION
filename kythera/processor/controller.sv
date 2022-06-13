module controller(input   logic [6:0] op,
                  input   logic [2:0] funct3,
                  input   logic       funct7b5,
                  output  logic       Regwe,
                  output  logic [1:0] DMemMuxc,
                  output  logic       DMemwe,
                  output  logic [3:0] ALUc,
                  output  logic       ALUMuxc,
                  output  logic [1:0] Extendc);

  logic         Branch, Jump;
  logic [1:0]   ALUOp;
  logic [10:0]  controls;

  assign {Regwe, DMemMuxc, DMemwe, ALUMuxc, Extendc, ALUOp, Branch, Jump} = controls;

  always_comb
    case (op)
    endcase     
  
