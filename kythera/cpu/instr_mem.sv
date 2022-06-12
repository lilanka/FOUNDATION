module instrMem(input   logic [31:0]  a,
                output  logic [31:0]  d);

  logic [31:0]  RAM[64:0];

  initial 
    $readmemh("test0.txt", RAM);

  assign d = RAM[a[31:2]]; // word aligned
endmodule
