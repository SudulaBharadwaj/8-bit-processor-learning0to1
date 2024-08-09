`timescale 1ns / 1ps

module FLAGS_REGISTER(
    input C,
    input IFLAGS,
    input Gr,
    input E,
    input Z,
    input ITEMP,
    input cpt5,
    output [3:0] flags,
    output cin
    );
    
    reg_DFF m3(.D(C), .en(IFLAGS), .Q(flags[3]));
    reg_DFF m2(.D(Gr), .en(IFLAGS), .Q(flags[2]));
    reg_DFF m1(.D(E), .en(IFLAGS), .Q(flags[1]));
    reg_DFF m0(.D(Z), .en(IFLAGS), .Q(flags[0]));
    
    // carry temp
    wire wcin;
    reg_DFF m(.D(flags[3]), .en(ITEMP), .Q(wcin));
    AND o(.a(wcin), .b(cpt5), .op(cin));
endmodule
