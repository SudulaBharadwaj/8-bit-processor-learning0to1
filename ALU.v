`timescale 1ns / 1ps
module ALU(
    input [7:0] CPU_BUS,
    input [7:0] temp_1,
    input c,
    input [7:0] ALU_SEL,
    output [7:0] ACC_BUS,
    output Gr,
    output E,
    output C,
    output Z
    ); 
    // -- XOR --
    wire [7:0] buf_bus6;
    ALU_XOR a6(.B(temp_1), .a(CPU_BUS), .EXOR_op(buf_bus6[7:0]), .Gr(Gr), .E(E));
    // * XOR *
    
     // -- OR --
    wire [7:0] buf_bus5;
    ALU_OR a5(.a(CPU_BUS), .b(temp_1), .op(buf_bus5[7:0])); 
    // * OR *
    
    // -- AND --
    wire [7:0] buf_bus4;
    ALU_AND a4(.a(CPU_BUS), .b(temp_1), .op(buf_bus4[7:0])); 
    // * AND *

    // -- NOT --
    wire [7:0] buf_bus3;
    ALU_NOT a3(.a(CPU_BUS), .op(buf_bus3[7:0])); 
    // * NOT *
   
   // carry flag wires
   wire c2,c1,c0;
    // -- SHR --
     wire [7:0] buf_bus2;
     ALU_SHR a2(.a(CPU_BUS), .cin(c), .op(buf_bus2), .c(c2));
    // *SHR*
    
    // -- SHL --
     wire [7:0] buf_bus1;
     ALU_SHL a1(.a(CPU_BUS), .cin(c), .op(buf_bus1), .c(c1));
    // *SHL*
    
    // -- Adder --
    wire [7:0] buf_bus0;
    ALU_ADDER a0(.a(CPU_BUS), .b(temp_1), .cin(c), .s(buf_bus0), .c(c0));
    // * adder*
   
   // -- carry flag C -- 
    wire cw;
    OR co(.a(c0), .b(c1), .op(cw));
    OR coo(.a(cw), .b(c2), .op(C));
    // *C flag*
    
    // -- zero flag Z --
     wire z0,z1,z2,z3,z4,z5,z6;
     OR Z0(.a(ACC_BUS[0]), .b(ACC_BUS[1]), .op(z0));   
     OR Z1(.a(ACC_BUS[2]), .b(z0), .op(z1));
     OR Z2(.a(ACC_BUS[3]), .b(z1), .op(z2));
     OR Z3(.a(ACC_BUS[4]), .b(z2), .op(z3));
     OR Z4(.a(ACC_BUS[5]), .b(z3), .op(z4));
     OR Z5(.a(ACC_BUS[6]), .b(z4), .op(z5));    
     OR Z6(.a(ACC_BUS[7]), .b(z5), .op(z6));  
     NOT Z7(.a(z6), .op(Z));
     // * Zero Z *
     
     // -- BUFFER --
      ALU_BUFFER b6(.a(buf_bus6), .en(ALU_SEL[6]), .op(ACC_BUS));
      ALU_BUFFER b5(.a(buf_bus5), .en(ALU_SEL[5]), .op(ACC_BUS));
      ALU_BUFFER b4(.a(buf_bus4), .en(ALU_SEL[4]), .op(ACC_BUS));
     ALU_BUFFER b3(.a(buf_bus3), .en(ALU_SEL[3]), .op(ACC_BUS));
     ALU_BUFFER b2(.a(buf_bus2), .en(ALU_SEL[2]), .op(ACC_BUS));
     ALU_BUFFER b1(.a(buf_bus1), .en(ALU_SEL[1]), .op(ACC_BUS));
     ALU_BUFFER b0(.a(buf_bus0), .en(ALU_SEL[0]), .op(ACC_BUS));
     // *BUFFER*
     
endmodule