module KY32_mux2x32(
  output [31:0] out,
  input  [31:0] a, b,
  input         s
);
  assign out = s ? a : b;
endmodule

module KY32_mux2x5(
  output  [4:0]  out,
  input   [4:0]  a, b,
  input           s
);
  assign out = s ? a : b;
endmodule 

module KY32_mux4x32(
  output [31:0] out,
  input  [31:0] a, b, c, d,
  input  [1:0]  s
);
  function [31:0] select;
    input  [31:0] a, b, c, d;
    input  [1:0]  s;
    case (s)
      2'b00: select = a;
      2'b01: select = b;
      2'b10: select = c;
      2'b11: select = d;
    endcase
  endfunction
  assign out = select(a, b, c, d, s);
endmodule
