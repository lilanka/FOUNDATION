`include "dlatch.v"

module KY32_dff_sync(
  output reg  q,
  input       in, clk, 
  input       clrn      // active low clear
);

  always @ (posedge clk) begin
    if (!clrn)  q <= 0;
    else        q <= in;
  end
endmodule

// with async reset
module KY32_dff(
  output reg  q,
  input       in, clk,
  input       clrn      // active low
);

  always @ (posedge clk or negedge clrn) begin
    if (!clrn)  q <= 0;
    else        q <= in;
  end
endmodule

module KY32_dffe(
  output reg  q,
  input       in, clk, 
  input       clrn,     // active low
  input       e         // enable control
);
  
  always @ (posedge clk or negedge clrn) begin
    if (!clrn)  q <= 0;
    else if (e) q <= in;
  end
endmodule
