`timescale 1ns / 1ps

module ALU_BUFFER(
    input [7:0] a,
    input en,
    output [7:0] op
    );
    genvar i;
    generate
      for(i=0;i<=7;i=i+1) begin
         bufif1(op[i], a[i], en);
      end
    endgenerate
endmodule
