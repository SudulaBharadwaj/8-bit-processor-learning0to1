`timescale 1ns / 1ps


module OPCODE(
    input seq5,ORA,ORB,IRB,
    input [7:0] IR,
    output [7:0] ALU_SEL ,
     output [7:0] data_mov,
     output OR0,OR1,OR2,OR3,IR0,IR1,IR2,IR3
    );
    // -- NON-COMPUTING (CPT) --
    wire [7:0] non_cpt;
    wire ncpt;
   
    NOT n(.a(IR[7]), .op(ncpt) );
    decoder3x8 nc(.a(IR[6:4]), .op(non_cpt[7:0]));
    genvar i;
   generate
      for(i=0;i<=7;i=i+1) begin
          AND a0(.a(ncpt), .b(non_cpt[i]), .op(data_mov[i]));
      end
    endgenerate
    // * NON-CPT*
  
    // -- COMPUTING CPT --
    wire [2:0] s;
    AND3inp S0(.a(IR[7]), .b(seq5), .c(IR[6]), .op(s[2]));
    AND3inp S1(.a(IR[7]), .b(seq5), .c(IR[5]), .op(s[1]));
    AND3inp S2(.a(IR[7]), .b(seq5), .c(IR[4]), .op(s[0]));
    decoder3x8 cp(.a(s[2:0]), .op(ALU_SEL[7:0]));
    // *CPT*
    
    // -- REGISTER selection --
    wire [3:0] regA_dw;
    wire [3:0] regB_dw;
    decoder2x4 d0(.a(IR[3:2]), .op(regA_dw[3:0]));
    decoder2x4 d1(.a(IR[1:0]), .op(regB_dw[3:0]));
    genvar j;
    wire [3:0] tA;
    wire [3:0] tB;
    generate
      for(j=0;j<=3;j=j+1) begin
        AND n0(.a(ORA), .b(regA_dw[j]), .op(tA[j]));
        AND n1(.a(ORB), .b(regB_dw[j]), .op(tB[j]));
      end
    endgenerate
    //output ctrl of R0,R1,R2,R3 (RA | RB)
    OR r0(.a(tA[0]), .b(tB[0]), .op(OR0)); 
    OR r1(.a(tA[1]), .b(tB[1]), .op(OR1));
    OR r2(.a(tA[2]), .b(tB[2]), .op(OR2));
    OR r3(.a(tA[3]), .b(tB[3]), .op(OR3));
   
    // input ctrl of R0,R1,R2,R3 (RB)
    AND m0(.a(IRB), .b(regB_dw[0]), .op(IR0));
    AND m1(.a(IRB), .b(regB_dw[1]), .op(IR1));
    AND m2(.a(IRB), .b(regB_dw[2]), .op(IR2));
    AND m3(.a(IRB), .b(regB_dw[3]), .op(IR3));

    // * REGISTER*
endmodule
