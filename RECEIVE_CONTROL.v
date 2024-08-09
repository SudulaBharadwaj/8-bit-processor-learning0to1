`timescale 1ns / 1ps


module RECEIVE_CONTROL(
    input Iclk,Oclk, seq1,seq2,seq3,seq4,seq5,seq6,
    input cpt4,cpt5,cpt6,LD4,LD5,ST4,ST5,DATA4,DATA5,DATA6,
    input JMPR4,JMP4,JMP5,JCON4,JCON5,JCON6,CLR4,DISP4,
    output  IIR, IMAR, IIAR, IACC , IRAM , ITEMP, IFLAGS, IRB, IDISP_REG 
    );
    wire wIMAR, wIIAR, wIACC, wIFLAGS, wIRB;
    
    AND i1(.a(Iclk), .b(seq2), .op(IIR)); //IR
    
    OR6inp i2(.a(seq1), .b(DATA4), .c(JCON4), .d(LD4), .e(ST4), .f(JMP4), .op(wIMAR)); //MAR
    AND i2_(.a(Iclk), .b(wIMAR), .op(IMAR));
    
    OR6inp i3(.a(seq3), .b(JMPR4), .c(JMP5), .d(JCON5), .e(DATA6), .f(JCON6), .op(wIIAR)); //MAR
    AND i3_(.a(Iclk), .b(wIIAR), .op(IIAR));
    
    OR4inp i4(.a(seq1), .b(DATA4), .c(JCON4), .d(cpt5), .op(wIACC)); //ACC
    AND i4_(.a(Iclk), .b(wIACC), .op(IACC));
    
    AND i5(.a(ST5), .b(Iclk), .op(IRAM)); //RAM 
    
    AND i6(.a(cpt4), .b(Iclk), .op(ITEMP)); //TEMP ITMP
    
    OR i7(.a(CLR4), .b(cpt5), .op(wIFLAGS)); //FLAGS
    AND i7_(.a(Iclk), .b(wIFLAGS), .op(IFLAGS));
    
    OR3inp i8(.a(cpt6), .b(LD5), .c(DATA5), .op(wIRB)); //RB
    AND i8_(.a(Iclk), .b(wIRB), .op(IRB));
    
    AND i9(.a(DISP4), .b(Iclk), .op(IDISP_REG)); //DISPLAY reg enable
endmodule
