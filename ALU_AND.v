`timescale 1ns / 1ps


module ALU_AND(
    input [7:0] a,
    input [7:0] b,
    output [7:0] op
    );
    genvar i;
    generate
       for(i=0;i<=7;i=i+1) begin
           AND c(.a(a[i]), .b(b[i]), .op(op[i]));
       end
    endgenerate
endmodule
