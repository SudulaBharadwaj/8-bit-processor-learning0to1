`timescale 1ns / 1ps


module FLAG_CHECKER(
    input C,
    input Gr,
    input E,
    input Z,
    input [7:0] IR,
    output flag
    );
    wire w0,w1,w2,w3;
    AND o0(.a(C), .b(IR[3]), .op(w0));
    AND o1(.a(Gr), .b(IR[2]), .op(w1));
    AND o2(.a(E), .b(IR[1]), .op(w2));
    AND o3(.a(Z), .b(IR[0]), .op(w3));
    OR4inp o(.a(w0), .b(w1), .c(w2), .d(w3), .op(flag));
endmodule
