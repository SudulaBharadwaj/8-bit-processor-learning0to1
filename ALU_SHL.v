`timescale 1ns / 1ps

module ALU_SHL(
    input [7:0] a,
    output [7:0] op,
    input cin,
    output c
    );
    assign c=a[7];
    assign op[7:0] = {a[6:0],cin};
endmodule
