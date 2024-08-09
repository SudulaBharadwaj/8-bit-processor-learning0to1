`timescale 1ns / 1ps
module SEND_CONTROL(
    input Iclk,Oclk, seq1,seq2,seq3,seq4,seq5,seq6,
    input cpt4,cpt5,cpt6,LD4,LD5,ST4,ST5,DATA4,DATA5,DATA6,
    input JMPR4,JMP4,JMP5,JCON4,JCON5,JCON6,CLR4,DISP4,
    output  O_1, OIAR, ORAM, OACC , ORB , ORA 
    );
    wire w_1, wOIAR, wORAM, wOACC, wORB, wORA;
    OR4inp o1(.a(seq1), .b(CLR4), .c(JCON4), .d(DATA4), .op( O_1)); //+1
    OR4inp o2(.a(seq1), .b(DATA4), .c(JMP4), .d(JCON4), .op(wOIAR) ); //IAR
    AND p2(.a(Oclk), .b(wOIAR), .op(OIAR));
    OR5inp o3(.a(seq2), .b(JCON6), .c(JMP5), .d(DATA5), .e(LD5), .op(wORAM) ); //RAM
    AND p3(.a(Oclk), .b(wORAM), .op(ORAM));
    OR4inp o4(.a(seq3), .b(JCON5), .c(DATA6), .d(cpt6), .op(wOACC) ); //ACC
    AND p4(.a(Oclk), .b(wOACC), .op(OACC));
    OR4inp o5(.a(cpt4), .b(ST5), .c(JMPR4), .d(DISP4), .op(wORB)); //RB
    AND p5(.a(Oclk), .b(wORB), .op(ORB));
    OR3inp o6(.a(ST4), .b(LD4), .c(cpt5), .op(wORA)); // O_RA
    AND p6(.a(Oclk), .b(wORA), .op(ORA)); 
endmodule