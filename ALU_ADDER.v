`timescale 1ns / 1ps

module ALU_ADDER(
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    input cin,
    output c
    );
    wire c1,c2,c3,c4,c5,c6,c7;
    adder s0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .c(c1));
    adder s1(.a(a[1]), .b(b[1]), .cin(c1), .s(s[1]), .c(c2));
    adder s2(.a(a[2]), .b(b[2]), .cin(c2), .s(s[2]), .c(c3));
    adder s3(.a(a[3]), .b(b[3]), .cin(c3), .s(s[3]), .c(c4));
    adder s4(.a(a[4]), .b(b[4]), .cin(c4), .s(s[4]), .c(c5));
    adder s5(.a(a[5]), .b(b[5]), .cin(c5), .s(s[5]), .c(c6));
    adder s6(.a(a[6]), .b(b[6]), .cin(c6), .s(s[6]), .c(c7));
    adder s7(.a(a[7]), .b(b[7]), .cin(c7), .s(s[7]), .c(c));
endmodule

