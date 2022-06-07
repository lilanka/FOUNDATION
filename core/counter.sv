module counter(input  logic         clk, 
               input  logic         reset,
               output logic [31:0]  Q);

  always @ (posedge clk, posedge reset) begin
    if (reset)  Q <= 0;
    else        Q <= Q + 1; 
  end
endmodule
