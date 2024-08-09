`timescale 1ns / 1ps
//general purpose register --> memory cell

module mem_register(
    input D,
    input en,
    inout Q
    );
      wire w1,w0,Qbar;
      NOT q(.a(D), .op(Dbar) );
      NAND Nand1(.a(D), .b(en), .op(w0));
     NAND Nand2(.a(Dbar), .b(en), .op(w1));
     NAND Nand3(.a(w0), .b(Qbar), .op(Q));
     NAND Nand4(.a(w1), .b(Q), .op(Qbar));
endmodule
