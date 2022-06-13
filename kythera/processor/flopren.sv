// resettable flip-flop with enable
module flopren(input  logic       clk, reset, en,
               input  logic [7:0] d,
               output logic [7:0] q);

  always_ff @ (posedge clk, posedge reset)
    if (reset)    q <= 0;
    else if (en)  q <= d;
endmodule
