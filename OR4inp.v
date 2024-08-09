`timescale 1ns / 1ps

module OR4inp(
    input a,
    input b,
    input c,
    input d,
    output op
    );
    wire w0,w1;
    OR p0(.a(a), .b(b), .op(w0));
    OR p1(.a(c), .b(d), .op(w1));
    OR p2(.a(w0), .b(w1), .op(op));
endmodule