module Dff(output out, input in, clk, ld);
  reg q;
  assign out=q;
  always @ (posedge clk) begin
    if (ld) begin
      q=in;
    end
  end
endmodule
