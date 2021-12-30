`timescale 1ns / 1ps

module tb();
	reg [7:0] A;
	integer file;

	initial begin
		file = $fopen("kythera32ins.kbin", "r");

		while (!$feof(file)) begin
			$fscanf(file, "%h\n", A); // read each line as hex
		end
		$fclose(file);
		#100
		$stop
	end
endmodule		 
