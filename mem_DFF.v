`timescale 1ns / 1ps

module mem_DFF(
    input D,
    input en_w1,en_w2,ST, MW, WR,
    inout Q
    ); 
    
    wire en,en_wire0,en_wire1;
    wire Nand1w1,Dbar,Nand1w2,Qbar;
    wire mw_wr;
    //en --> digital design
    OR mw_wr_or( .a(MW) , .b(WR) , .op(mw_wr) ); // MW+WR
    AND mw(.a(mw_wr), .b(ST), .op(en_wire1) );  // (MW+WR).ST
    AND en_And(.a(en_w1), .b(en_w2), .op(en_wire0) ); //decoder1_w.decoder2_w
    
    AND en_And1( .a(en_wire1), .b(en_wire0), .op(en) ); // (MW.ST + WR).(decoder1_w.decoder2_w)   en pin is ready
     NOT Not1(.a(D), .op(Dbar) );
     NAND Nand1(.a(D), .b(en), .op(Nand1w1));
     NAND Nand2(.a(Dbar), .b(en), .op(Nand1w2));
     NAND Nand3(.a(Nand1w1), .b(Qbar), .op(Q));
     NAND Nand4(.a(Nand1w2), .b(Q), .op(Qbar));   
endmodule
