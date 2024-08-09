`timescale 1ns / 1ps


module NOR(
    input a,
    input b,
    output op
    );
    assign op= ~(a|b);
endmodule
