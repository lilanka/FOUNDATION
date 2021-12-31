// decoder with enable control

module KY32_decoder3x8(
  output [7:0] out,
  input  [2:0] n,
  input        ena
);
  wire [2:0] nn;

  not not1(nn[0], n[0]);
  not not2(nn[1], n[1]);
  not not3(nn[2], n[2]);

  and and0(d[0], nn[0], nn[1], nn[2], ena);  
  and and1(d[1], n[0], nn[1], nn[2], ena);  
  and and2(d[2], nn[0], n[1], nn[2], ena);  
  and and3(d[3], n[0], n[1], nn[2], ena);  
  and and4(d[4], nn[0], nn[1], n[2], ena);  
  and and5(d[5], n[0], nn[1], n[2], ena);  
  and and6(d[6], nn[0], n[1], n[2], ena);  
  and and7(d[7], n[0], n[1], n[2], ena);  
endmodule
