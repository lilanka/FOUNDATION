module KY32_encoder8x3(
  output [2:0]  n,
  output        g,
  input  [7:0]  d,
  input         ena
);
  assign g = ena & |d;

  function [2:0] enc;
    input       e;
    input [7:0] d;
    casex ({e, d})
      9'b1_1xxxxxxx: enc = 3'd7;
      9'b1_01xxxxxx: enc = 3'd6;
      9'b1_001xxxxx: enc = 3'd5;
      9'b1_0001xxxx: enc = 3'd4;
      9'b1_00001xxx: enc = 3'd3;
      9'b1_000001xx: enc = 3'd2;
      9'b1_0000001x: enc = 3'd1;
      default      : enc = 3'd0;
    endcase
  endfunction
  assign n = enc(ena, d);
endmodule
