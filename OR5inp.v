`timescale 1ns / 1ps

module OR5inp(
    input a,
    input b,
    input c,
    input d,
    input e,
    output op
    );
    wire w1,w2,w3;
     OR v1(.a(a), .b(b), .op(w1)); //a|b
      OR v2(.a(c), .b(d), .op(w2)); //c|d
       OR v3(.a(e), .b(w1), .op(w3)); // e | a|b
        OR v4(.a(w3), .b(w2), .op(op)); //e | a|b  | c|d 
endmodule
