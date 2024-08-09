`timescale 1ns / 1ps


module reg_DFF(
    input D,
    input en,
    inout Q
    );
    wire Nand1w1,Dbar,Nand1w2,Qbar;
    NOT Not1(.a(D), .op(Dbar) );
     NAND Nand1(.a(D), .b(en), .op(Nand1w1));
     NAND Nand2(.a(Dbar), .b(en), .op(Nand1w2));
     NAND Nand3(.a(Nand1w1), .b(Qbar), .op(Q));
     NAND Nand4(.a(Nand1w2), .b(Q), .op(Qbar));   
endmodule
