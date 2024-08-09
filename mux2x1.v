`timescale 1ns / 1ps

module mux2x1(
    input a,
    input b,
    input s,
    output op
    );
    wire x,y;
    AND q(.a(a), .b(sbar), .op(x)); // a(~s) 
    NOT q1(.a(s), .op(sbar));  // ~s
    AND q2(.a(b), .b(s), .op(y));  //b(s)
    OR q3(.a(x), .b(y), .op(op)); // a(~s) + b(s)
    
endmodule
