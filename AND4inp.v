`timescale 1ns / 1ps

module AND4inp(
    input a,
    input b,
    input c,
    input d,
    output op
    );
    wire w0,w1;
    AND s(.a(a), .b(b), .op(w0));
    AND s1(.a(c), .b(d), .op(w1));
    AND s2(.a(w0), .b(w1), .op(op));

endmodule