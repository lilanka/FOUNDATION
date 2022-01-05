`include "dlatch.v"

module KY32_dff_sync(
  output reg  q,
  input       in, clk, rst  
);
  always @ (posedge clk) begin
    if (!rst)  q <= 0;
    else       q <= in;
  end
endmodule

// with async reset
module KY32_dff(
  output reg  q,
  input       in, clk, rst 
);
  always @ (posedge clk or negedge rst) begin
    if (!rst)  q <= 0;
    else       q <= in;
  end
endmodule

module KY32_dffe(
  output reg  q,
  input       in, clk, rst,
  input       e         // enable control
);
  
  always @ (posedge clk or negedge rst) begin
    if (!rst)  q <= 0;
    else if (e) q <= in;
  end
endmodule

module KY32_dff32(
  output reg [31:0] out,
  input      [31:0] in,
  input             clk, rst
);
  always @ (posedge clk or negedge rst) begin
    if (!rst) out <= 32'd0;
    else      out <= in;
  end
endmodule
