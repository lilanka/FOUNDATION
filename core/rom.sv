module rom(input  logic [1:0] addr,
           output logic [2:0] dout);

  always @ * begin
    case (addr)
      2'b00: dout = 3'b011;
      2'b01: dout = 3'b110;
      2'b10: dout = 3'b100;
      2'b11: dout = 3'b010;
    endcase
  end
endmodule
