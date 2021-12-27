module ZUSS_DATA_MEM(
  input       [31:0] addr, data,
  input       [3:0]  we,
  input              clk,
  output reg  [31:0] out
);

  reg [7:0] dmem1[1023:0];
  reg [7:0] dmem2[1023:0];
  reg [7:0] dmem3[1023:0];
  reg [7:0] dmem4[1023:0];

  always @ (posedge clk) begin
    if (we[0]) begin
      dmem1[addr[11:2]] <= data[7:0];
    end
    out[7:0] <= dmem1[addr[11:2]];
  end

  always @ (posedge clk) begin
    if (we[1]) begin
      dmem2[addr[11:2]] <= data[15:8];
    end
    out[15:8] <= dmem2[addr[11:2]];
  end

  always @ (posedge clk) begin
    if (we[2]) begin
      dmem3[addr[11:2]] <= data[23:16];
    end
    out[23:16] <= dmem3[addr[11:2]];
  end

  always @ (posedge clk) begin
    if (we[3]) begin
      dmem4[addr[11:2]] <= data[31:24];
    end
    out[31:24] <= dmem4[addr[11:2]];
  end
endmodule
