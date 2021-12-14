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
`include "or.v"

module Alu16(out, zr, ng, a, b, c);
  input [5:0]   c;          // the control input (order: zx, nx, zy, ny, f, no)
  input [15:0]  a, b;

  output reg [15:0] out;
  output reg zr, ng;        // zero and negetive flags
 
  wire [15:0] not_out_a, not_out_b, incr_out_a, incr_out_b, add_out_a, add_out_b, add_out, sub_out_ab, sub_out_ba, and_out, or_out; 

  Not16 not_a(not_out_a, a);
  Not16 not_b(not_out_b, b);
  Incr16 incr_a(incr_out_a, a);
  Incr16 incr_b(incr_out_b, b);
  Add16 add_a(add_out_a, a, -16'd1);
  Add16 add_b(add_out_b, b, -16'd1);
  Add16 add(add_out, a, b);
  Add16 sub_ab(sub_out_ab, a, -b);
  Add16 sub_ba(sub_out_ba, b, -a);
  And16 and_ab(and_out, a, b);
  Or16 or_ab(or_out, a, b);

  always @ (*) begin
    {zr, ng} = 1'b0;
    case (c)
      6'b101010: begin out = 16'd0; end           // 0
      6'b111111: begin out = 16'd1; end           // 1    
      6'b111010: begin out = -16'd1; end          // -1
      6'b001100: begin out = a; end               // a
      6'b110000: begin out = b; end               // b
      6'b001111: begin out = -a; end              // -a
      6'b110011: begin out = -b; end              // -b
      6'b001101: begin out = not_out_a; end       // !a
      6'b110001: begin out = not_out_b; end       // !b
      6'b011111: begin out = incr_out_a; end      // a+1
      6'b110111: begin out = incr_out_b; end      // b+1
      6'b001110: begin out = add_out_a; end       // a-1
      6'b110010: begin out = add_out_b; end       // b-1
      6'b000010: begin out = add_out; end         // a+b
      6'b010011: begin out = sub_out_ab; end      // a-b
      6'b000111: begin out = sub_out_ba; end      // b-a
      6'b000000: begin out = and_out; end         // x&y
      6'b010101: begin out = or_out; end          // x|y
    endcase

    // check zr and ng
    if (out==1'b0) begin
      zr = 1'b1;
    end
    if (out==1'b1) begin
      ng = 1'b1;
    end
  end
endmodule
