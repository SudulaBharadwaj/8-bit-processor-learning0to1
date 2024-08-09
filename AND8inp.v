`timescale 1ns / 1ps


module AND8inp(
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    input H,
    input I,
    output op
    );
    wire w1,w2;
    AND4inp j(.a(A), .b(B), .c(C), .d(D), .op(w1));
    AND4inp k(.a(E), .b(F), .c(G), .d(H), .op(w2));
    AND3inp l(.a(w1), .b(w2), .c(I), .op(op));
endmodule
