module alu(input  logic [31:0]  a, b,
           input  logic [3:0]   op,
           output logic         zero,
           output logic [31:0]  y);

  always @ * begin
    case (op)
      4'b0000: y = a + b;
      4'b0001: y = a - b;
      4'b0010: y = a & b;
      4'b0011: y = a | b;
      4'b0100: y = a ^ b;
      4'b0101: y = ~a;
      4'b0110: y = a / b;
      4'b0111: y = a * b;
      4'b1000: y = a << b;
      4'b1001: y = a >> b;
      default: zero = 1'b0;
    endcase
  end
endmodule
