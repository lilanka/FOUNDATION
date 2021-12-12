module DMux(output reg a, b, input in, sel);
  always @ (in, sel) begin
    if (sel==0) begin
      a=in;b=0;
    end
    else
      a=0;b=in;
    end
endmodule
