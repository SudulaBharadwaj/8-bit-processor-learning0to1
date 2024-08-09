`timescale 1ns / 1ps

module decoder3x8(
    input [2:0] a,
    output [7:0] op
    );   //d0= a0bar. a1bar. a2bar
    NOT n0(.a(a[0]), .op(a0bar)); //d1= a0. a1bar. a2bar
    NOT n1(.a(a[1]), .op(a1bar));
    NOT n2(.a(a[2]), .op(a2bar));   
    AND3inp d0(.a(a2bar), .b(a1bar), .c(a0bar), .op(op[0]));
    AND3inp d1(.a(a2bar), .b(a1bar), .c(a[0]), .op(op[1]));
    AND3inp d2(.a(a2bar), .b(a[1]), .c(a0bar), .op(op[2]));
    AND3inp d3(.a(a2bar), .b(a[1]), .c(a[0]), .op(op[3]));
    AND3inp d4(.a(a[2]), .b(a1bar), .c(a0bar), .op(op[4]));
    AND3inp d5(.a(a[2]), .b(a1bar), .c(a[0]), .op(op[5]));
    AND3inp d6(.a(a[2]), .b(a[1]), .c(a0bar), .op(op[6]));
    AND3inp d7(.a(a[2]), .b(a[1]), .c(a[0]), .op(op[7]));
endmodule
