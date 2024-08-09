`timescale 1ns / 1ps

module ALU_SHR(
    input [7:0] a,
    input cin,
    output [7:0] op,
    output c
    );
     assign c=a[0];
    assign op[7:0] = {cin,a[7:1]};
endmodule
