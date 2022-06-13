module testbench();

  logic         clk;
  logic         reset;
  logic [31:0]  WriteData, DataAddr;
  logic         MemWrite;

  // instantiate device to be tested
  top dut(clk, reset, WriteData, DataAddr, MemWrite);

  // initialize test
  initial
    begin 
      reset <= 1; #22; reset <= 0;
  end

  // generate clock to sequence tests
  always 
    begin
      clk <= 1; #5; clk <= 0; #5;
  end

  // check results
  always @ (negedge clk)
    begin
      if (MemWrite) begin
        if (DataAddr === 100 & WriteData === 25) begin
          $display("Simulation succeeded");
          $stop;
        end else if (DataAddr !== 96) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule
