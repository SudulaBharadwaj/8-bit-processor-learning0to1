`timescale 1ns / 1ps


module XNOR(
    input a,
    input b,
    output op
    );
    assign op= ~(a^b);
endmodule