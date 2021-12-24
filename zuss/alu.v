module ZUSS_ALU(
  input   wire [31:0]  a, b,      // inputs
  input   wire [3:0]   op,        // control input
  output  wire [1:0]   zr,        // zero
  output  reg  [31:0]  out        // output   
);

  assign zr = 1'b0;

  always @ (*) begin 
    case (op)
      4'b0000:  out <= a + b;     // a + b
      4'b0001:  out <= a - b;     // a - b 
      4'b0010:  out <= a | b;     // or 
      4'b0011:  out <= a & b;     // and 
    endcase
  end

  assign zr = 1'b1;
endmodule
