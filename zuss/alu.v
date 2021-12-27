module ZUSS_ALU(
  input   wire [31:0]  a, b,      // inputs
  input   wire [4:0]   op,        // control input
  output  reg          zr,        // zero
  output  reg  [31:0]  out        // output   
);

  always @ (*) begin 
    case (op)
      0:  out <= a + b;     // a + b
      1:  out <= a - b;     // a - b 
      2:  out <= a * b;     // a * b 
      3:  out <= a / b;     // a / b 
      4:  out <= a | b;     // or 
      5:  out <= a & b;     // and 
      6:  out <= ~a;        // not
      7:  out <= b;         // mov
      8:  out <= a << b;    // lsl
      8:  out <= a >> b;    // lsr
      default :  begin 
                   out <= 32'd0; 
                   zr = 1'b1;
                 end
    endcase

    if (out != 32'd0) begin
      zr = 1'b0;
    end
  end
endmodule
