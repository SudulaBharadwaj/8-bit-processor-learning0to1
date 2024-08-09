`timescale 1ns / 1ps

module adder(
    input a,b,cin,
    
    output s,c
    );
    XOR v(.a(a), .b(b), .op(w1));
    XOR v1(.a(w1), .b(cin), .op(s));
    AND v2(.a(w1), .b(cin), .op(w2));
    AND v3(.a(a), .b(b), .op(w3));
    OR v4(.a(w2), .b(w3), .op(c));
    
endmodule