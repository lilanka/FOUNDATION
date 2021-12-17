module Dff(output reg q, qb, input in, clk);
  initial begin
    q=1'b0;
    qb=1'b1;
  end
  always @ (posedge clk) begin
    q=in;
    qb=~q;
  end
endmodule
