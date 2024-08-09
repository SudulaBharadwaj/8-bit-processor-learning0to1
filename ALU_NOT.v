`timescale 1ns / 1ps

module ALU_NOT(
    input [7:0] a,
    output [7:0] op
    );
    genvar i;
    generate
       for(i=0;i<=7;i=i+1) begin
           NOT c(.a(a[i]),  .op(op[i]));
       end
    endgenerate
endmodule
