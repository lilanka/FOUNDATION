/* currently have only 18 operations
0, 1, -1, 
x, y, !x, !y, -x, -y,
x+1, y+1, x-1, y-1, 
x+y, x-y, y-x,
x&y, x|y,
*/

`include "and.v"
`include "not.v"

module Alu16(out, zr, ng, x, y, c);
  input [5:0]   c;          // the control input (order: zx, nx, zy, ny, f, no)
  input [15:0]  x, y;

  output [15:0] out;
  output zr, ng;            // zero and negetive flags

  always @ (*) begin  
    if (c==6'b101010) begin // 0
      out = 16'b0000000000000000;  
    end
    else if (c==6'b111111) begin // 1
      out = 16'b0000000000000001;      
    end
    else if (c==6'b111010) begin // -1
      out = 16'b1111111111111111; 
    end
    else if (c==6'b001100) begin // x
      out = x;
    end
    else if (c==6'b110000) begin // y
      out = y;
    end
    else if (c==6'b001101) begin // !x
      Not16 d0(out, x); 
    end
    else if (c==6'b110001) begin // !y
      Not16 d1(out, y);
    end
    else if (c==6'b001111) begin // -x
    
    // continue 
    if (c==6'b110011) // -y
    if (c==6'b011111) // x+1
    if (c==6'b110111) // y+1
    if (c==6'b001110) // x-1
    if (c==6'b110010) // y-1
    if (c==6'b000010) // x+y
    if (c==6'b010011) // x-y
    if (c==6'b000111) // y-x
    if (c==6'b000000) // x&y
    if (c==6'b010101) // x|y

