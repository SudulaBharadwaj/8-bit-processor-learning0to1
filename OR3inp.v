`timescale 1ns / 1ps

module OR3inp(
    input a,
    input b,
    input c,
    output op
    );
    wire w1;
    OR v(.a(a), .b(b), .op(w1));
    OR v1(.a(w1), .b(c), .op(op)); 
endmodule
