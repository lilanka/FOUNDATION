module And(output reg out, input a, b);
  always @ (a, b) begin
    if (a==1'b1 & b==1'b1) begin
      out = 1'b1; 
    end
    else
      out = 1'b0; 
    end
endmodule
