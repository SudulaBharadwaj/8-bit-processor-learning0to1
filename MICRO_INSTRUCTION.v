`timescale 1ns / 1ps

module MICRO_INSTRUCTION(
        input seq4,seq5,seq6,
        input [7:0] IR,
        input [7:0] data_mov,
        input flag,
        output cpt4,cpt5,cpt6,LD4,LD5,ST4,ST5,DATA4,DATA5,DATA6,
        JMPR4,JMP4,JMP5,JCON4,JCON5,JCON6,DISP4,
        output  CLR4   // MICRO_INSTRUCTION <-- CONTROL_UNIT <-- OZERO_REG
    );
    AND d0(.a(IR[7]), .b(seq4), .op(cpt4)); //steps 4,5,6 (sequencer)
    AND d1(.a(IR[7]), .b(seq5), .op(cpt5)); // ALU COMPuting
    AND d2(.a(IR[7]), .b(seq6), .op(cpt6));
    wire ncpt;
    NOT n(.a(IR[7]), .op(ncpt));
    // -- data_movement
    AND d3(.a(data_mov[0]), .b(seq4), .op(LD4)); //LOAD
    AND d4(.a(data_mov[0]), .b(seq5), .op(LD5));
    
    AND d5(.a(data_mov[1]), .b(seq4), .op(ST4));//STORE
    AND d6(.a(data_mov[1]), .b(seq5), .op(ST5));
    
    AND d7(.a(data_mov[2]), .b(seq4), .op(DATA4));//DATA
    AND d8(.a(data_mov[2]), .b(seq5), .op(DATA5));
    AND d9(.a(data_mov[2]), .b(seq6), .op(DATA6));
    
    AND d10(.a(data_mov[3]), .b(seq4), .op(JMPR4)); //JMPR
    
    AND d11(.a(data_mov[4]), .b(seq4), .op(JMP4)); //JMP
    AND d12(.a(data_mov[4]), .b(seq5), .op(JMP5));
    
    AND d13(.a(data_mov[5]), .b(seq4), .op(JCON4)); //JCON
    AND d14(.a(data_mov[5]), .b(seq5), .op(JCON5));
    AND3inp d15(.a(data_mov[5]), .b(seq6), .c(flag), .op(JCON6));
    
    AND d16(.a(data_mov[6]), .b(seq4), .op(CLR4)); //CLR
    
    AND d17(.a(data_mov[7]), .b(seq4), .op(DISP4)); //DISPLAY
    // *data*
    
    
endmodule
