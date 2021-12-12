module Or(output reg out, input a, b);
  always @ (a, b) begin
    if (a==1'b0 & b==1'b0) begin
      out = 1'b0; 
    end
    else
      out = 1'b1; 
    end
endmodule
