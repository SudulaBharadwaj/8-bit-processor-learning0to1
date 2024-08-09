`timescale 1ns / 1ps

module AND3inp(
    input a,
    input b,
    input c,
    output op
    );
    wire w;
    AND a1(.a(a), .b(b), .op(w));
    AND a2(.a(w), .b(c), .op(op) );
endmodule

