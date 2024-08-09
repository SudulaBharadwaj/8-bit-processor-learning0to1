`timescale 1ns / 1ps

module AND8inp_END(
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    input H,
    output op
    );
    wire w1,w2;
    AND4inp j(.a(A), .b(B), .c(C), .d(D), .op(w1));
    AND4inp k(.a(E), .b(F), .c(G), .d(H), .op(w2));
    AND l(.a(w1), .b(w2),  .op(op));
endmodule
