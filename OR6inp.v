`timescale 1ns / 1ps


module OR6inp(
    input a,
    input b,
    input c,
    input d,
    input e,
    input f,
    output op
    );
    wire w1,w2,w3,w4;
    OR o1(.a(a), .b(b), .op(w1));
    OR o2(.a(c), .b(d), .op(w2));
    OR o3(.a(e), .b(f), .op(w3));
    OR o4(.a(w1), .b(w2), .op(w4));
    OR o5(.a(w4), .b(w3), .op(op));
endmodule
