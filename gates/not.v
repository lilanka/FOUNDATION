module Not(output reg out, input a);
  always @ (a) begin
    if (a==1'b0) begin
      out = 1'b1;
    end
    else
      out = 1'b0;
    end
endmodule
