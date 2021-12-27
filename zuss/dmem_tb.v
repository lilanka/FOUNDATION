`include "data_mem.v"

module ZUSS_DATA_MEM_TB;
	reg [3:0] we;
	reg clk;
	reg [31:0] addr;
	reg [31:0] data;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ZUSS_DATA_MEM uut(
		.we(we), 
		.clk(clk), 
		.addr(addr), 
		.data(data), 
		.out(out)
	);
	always #10 clk = !clk;
	initial begin
		clk=1;
		// Initialize Inputs
		we = 4'b0001;
		addr = 500;
		data = 250;

		// Wait 100 ns for global reset to finish
		#100;
       we = 4'b0001;
		addr = 500;
		data = 100;
		// Add stimulus here
		#100
		we = 4'b0101;
		addr = 1000;
		data = 21'b111110000000000100101;
		#100
		we = 4'b0011;
		addr = 1000;
		data = 512;		
		#100
		we = 4'b0000;
		addr = 1000;
		data = 100;		
	end
      
endmodule
