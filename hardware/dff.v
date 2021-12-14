module Dff(output reg q, qb, input in, clk);
  always @ (posedge clk) begin
    if (in==1'b0) begin
      q = 0;
    end
    else 
      q = 1;
    end
    qb = ~q;
  end
endmodule
