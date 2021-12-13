/* currently have only 18 operations
0, 1, -1, 
x, y, !x, !y, -x, -y,
x+1, y+1, x-1, y-1, 
x+y, x-y, y-x,
x&y, x|y,
*/

`include "and.v"
`include "not.v"
`include "increment.v"
`include "add16.v"

module Alu16(out, zr, ng, a, b, c);
  input [5:0]   c;          // the control input (order: zx, nx, zy, ny, f, no)
  input [15:0]  a, b;

  output reg [15:0] out;
  output reg zr, ng;        // zero and negetive flags
  
  always @ (*) begin
    {zr, ng} = 1'b0;
    case (c)
      6'b101010: begin out = 16'd0; end                      // 0
      6'b111111: begin out = 16'd1; end                      // 1    
      6'b111010: begin out = -16'd1; end                     // -1
      6'b001100: begin out = a; end                          // a
      6'b110000: begin out = b; end                          // b
      6'b001111: begin out = -a; end                         // -a
      6'b110011: begin out = -b; end                         // -b

      /* todo: fix module calling error
      6'b001101: begin Not16 u0(out, a); end                 // !a
      6'b110001: begin Not16 u1(out, b); end                 // !b
      6'b011111: begin Incr16 u2(out, a); end                // a+1
      6'b110111: begin Incr16 u3(out, b); end                // b+1
      6'b001110: begin Add16 u3(out, a, -16'd1); end         // a-1
      6'b110010: begin Add16 u4(out, b, -16'd1); end         // b-1
      6'b000010: begin Add16 u5(out, a, b); end              // x+y
      6'b010011: begin Add16 u6(out, a, -b); end             // x-y
      6'b000111: begin Add16 u7(out, b, -a); end             // y-z
      6'b000000: begin And16 u8(out, a, b); end              // x&y
      6'b010101: begin Or16 u9(out, a, b); end               // x|y
      */
    endcase

    // check zr and ng
    if (out[15]==1'b0) begin
      zr = 1'b1;
    end
    if (out[15]==1'b1) begin
      ng = 1'b1;
    end
  end
endmodule
