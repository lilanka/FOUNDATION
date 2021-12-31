`include "ram.v"
`include "alu.v"
`include "pc.v"

  output        wr;

  wire [15:0] d_in, d_out, i_out; 
              
 
  Mux16 g8(i_out, 
  Alu16 alu(alu_out, zr, ng, d_out, i_out, I[14:11]); 
  
endmodule
