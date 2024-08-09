`timescale 1ns / 1ps

module RAM_vs_CPU(
    input clk,reset,MW,
    
    output CLK
    );
    wire resetbar, MWbar;
    NOT n(.a(reset), .op(resetbar));
    NOT nn(.a(MW), .op(MWbar));
    AND3inp ch(.a(resetbar), .b(MWbar), .c(clk), .op(CLK));
endmodule
