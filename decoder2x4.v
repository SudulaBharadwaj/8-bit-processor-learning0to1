`timescale 1ns / 1ps

module decoder2x4(
    input [1:0] a,
    output [3:0] op
    );
    wire a0bar,a1bar;
    NOT a0(.a(a[0]), .op(a0bar));
    NOT a1(.a(a[1]), .op(a1bar));
    AND d0(.a(a1bar), .b(a0bar), .op(op[0]));
    AND d1(.a(a1bar), .b(a[0]), .op(op[1]));
    AND d2(.a(a[1]), .b(a0bar), .op(op[2]));
    AND d3(.a(a[1]), .b(a[0]), .op(op[3]));    
endmodule