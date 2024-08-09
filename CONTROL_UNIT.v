`timescale 1ns / 1ps

module CONTROL_UNIT(
       input dclk, Iclk, Oclk, reset, C, Gr, E, Z,
       input [7:0] IR,
       output O_1, OIAR, ORAM, OACC , OR0, OR1, OR2, OR3,
        output [7:0] ALU_SEL ,
        output IR0,IR1,IR2,IR3,IIR, IMAR, IIAR, IACC , IRAM , ITEMP, IFLAGS, IDISP_REG,
        output wire cpt5,  //it is acting as an internal wire & output port as well
       output wire CLR4
    );
     wire  seq1,seq2,seq3, seq4, seq5, seq6; //had to initialize over the top of everything due to some errors (IMPLICIT DECLARATION)
     wire flag;
     wire [7:0] data_mov;
     wire  cpt4,cpt6,LD4,LD5,ST4,ST5,DATA4,DATA5,DATA6,JMPR4,JMP4,JMP5,JCON4,JCON5,JCON6,DISP4;
    //OPCODE
    
    OPCODE c1(
    .seq5(seq5) , .ORA(ORA), .ORB(ORB), .IRB(IRB),
      .IR(IR[7:0]),
      .ALU_SEL(ALU_SEL[7:0]) ,
       .data_mov(data_mov[7:0]),
      .OR0(OR0), .OR1(OR1), .OR2(OR2), .OR3(OR3), .IR0(IR0), .IR1(IR1), .IR2(IR2), .IR3(IR3)
    ); // *** OPCODE ***
    
    //FLAG CHECKER
   
     FLAG_CHECKER c2(
     .C(C),
     .Gr(Gr),
     .E(E),
     .Z(Z),
      .IR(IR[7:0]),
     .flag(flag)
    ); // **FLAG CHECKER**
    
    //MICRO INSTRUCTION
           
    MICRO_INSTRUCTION c3(
         .seq4(seq4), .seq5(seq5), .seq6(seq6),
         .IR(IR[7:0]),
         .data_mov(data_mov[7:0] ),
         .flag(flag),
         .cpt4(cpt4),.cpt5(cpt5), .cpt6(cpt6), .LD4(LD4),
          .LD5(LD5), .ST4(ST4), .ST5(ST5), .DATA4(DATA4),
           .DATA5(DATA5), .DATA6(DATA6), .JMPR4(JMPR4), 
           .JMP4(JMP4), .JMP5(JMP5), .JCON4(JCON4), .JCON5(JCON5),
            .JCON6(JCON6), .CLR4(CLR4), .DISP4(DISP4)
    ); // *** MICRO INSTRUCTION ***
    
    //SEQUENCER
   
    SEQUENCER c4(
     .dummy_clk(dclk), .FPGA_inp_zero(reset),
     .seq1(seq1),
     .seq2(seq2),
     .seq3(seq3),
     .seq4(seq4),
     .seq5(seq5),
     .seq6(seq6)
    );  //**** SEQUENCER ****
    
    // RECEIVE
    RECEIVE_CONTROL c5(
     .Iclk(Iclk) , .Oclk(Oclk) , .seq1(seq1), .seq2 (seq2),
      .seq3 (seq3), .seq4(seq4), .seq5(seq5), .seq6(seq6),
     .cpt4(cpt4) , .cpt5 (cpt5), .cpt6(cpt6), .LD4(LD4), 
     .LD5(LD5), .ST4(ST4), .ST5(ST5), .DATA4(DATA4), .DATA5(DATA5), .DATA6(DATA6),
     .JMPR4(JMPR4), .JMP4(JMP4), .JMP5(JMP5), .JCON4(JCON4),
      .JCON5(JCON5), .JCON6(JCON6), .CLR4(CLR4), .DISP4(DISP4),
      .IIR(IIR), .IMAR(IMAR), .IIAR(IIAR), .IACC(IACC) ,
       .IRAM(IRAM) , .ITEMP(ITEMP), .IFLAGS(IFLAGS), .IRB(IRB), .IDISP_REG(IDISP_REG) 
    ); //***** RECEIVE *****
    
    // SEND
    
    SEND_CONTROL c6(
     .Iclk(Iclk), .Oclk(Oclk), .seq1(seq1), .seq2(seq2),
      .seq3(seq3), .seq4(seq4), .seq5(seq5), .seq6(seq6),
     .cpt4(cpt4), .cpt5(cpt5), .cpt6(cpt6), .LD4(LD4),
      .LD5(LD5), .ST4(ST4), .ST5(ST5), .DATA4(DATA4), .DATA5(DATA5), .DATA6(DATA6),
     .JMPR4(JMPR4), .JMP4(JMP4), .JMP5(JMP5), .JCON4(JCON4),
      .JCON5(JCON5), .JCON6(JCON6), .CLR4(CLR4), .DISP4(DISP4),
      .O_1(O_1), .OIAR(OIAR), .ORAM(ORAM), .OACC(OACC) , .ORB(ORB) , .ORA(ORA) 
    ); //****** SEND ******
    
    
endmodule
