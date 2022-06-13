module datapath(input   logic         clk, reset,
                input   logic [1:0]   DMemMuxc,
                input   logic         ALUMuxc,
                input   logic         Regwe,
                input   logic [1:0]   Extendc,
                input   logic [3:0]   ALUc,
                output  logic         Zero,
                output  logic [31:0]   
