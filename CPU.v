`timescale 1ns / 1ps

module CPU(
    input clk,             //FREQUENCY_DIVIDER
    input [7:0] FPGA_inp, //RAM
    input MW,             //RAM & FREQUENCY_DIVIDER
    input A_D,            //RAM
    input ST,            //RAM 
    input reset,         // Universal
    output [7:0] DISPLAY //comes out of CPU_BUS
    //output [7:0] ram_cell_test_,
    //output [7:0] loc0
    
    );
   wire [7:0] CPU_BUS;
     wire [3:0] flags;
     wire _clk;
      wire [7:0] IR_BUS;
      
    
    
      
      
     // RAM v/s CPU  (reset & MW)
     RAM_vs_CPU cpuclk(
     .clk(clk), .reset(reset), .MW(MW),
     .CLK(_clk)   
    );
    
  
     
    // we need clk for anything to work, so let's start with FREQUENCY_DIVIDER
     wire dclk;
     wire Iclk, Oclk; //ib1
    FREQUENCY_DIVIDER ib1(   
     .MW(MW),
     .clk(_clk),
   .dclk(dclk),
     .Iclk(Iclk),
     .Oclk(Oclk)
    ); //* clk generated
    
    //CONTROL_UNIT
    wire C, Gr, E, Z;   // 
    wire [7:0] IR;
    wire O_1, OIAR, ORAM, OACC , OR0, OR1, OR2, OR3;
    wire [7:0] ALU_SEL;
    wire IR0,IR1,IR2,IR3,IIR, IMAR, IIAR, IACC , IRAM , ITEMP, IFLAGS, IDISP_REG;
    wire cpt5;
    wire OZERO_REG;
   CONTROL_UNIT ib2(  //-------dclk --> _clk----------
        .dclk(dclk), .Iclk(Iclk), .Oclk(Oclk), .reset(reset), 
        .C( flags[3]), .Gr(flags[2]), .E(flags[1]), .Z(flags[0]),
       .IR(IR_BUS[7:0]),
        .O_1(O_1), .OIAR(OIAR), .ORAM(ORAM), .OACC(OACC) , .OR0(OR0),
         .OR1(OR1), .OR2(OR2), .OR3(OR3),
         .ALU_SEL (ALU_SEL[7:0]) ,
         .IR0(IR0), .IR1(IR1), .IR2(IR2), .IR3(IR3), .IIR(IIR), 
         .IMAR(IMAR), .IIAR(IIAR), .IACC(IACC) , .IRAM(IRAM) , 
         .ITEMP(ITEMP), .IFLAGS(IFLAGS), .IDISP_REG(IDISP_REG),
        .cpt5(cpt5),  //it is acting as an internal wire & output port as well
     .CLR4(OZERO_REG) 
    ); //** control unit **
     
    //*** REGISTERS ***
    wire [7:0] wiar; 
    wire [7:0] ACC_BUS;
   wire ALU_C, ALU_Gr, ALU_E, ALU_Z;  //carry flags generated from ALU
   wire cin; //carry-in to ALU
   wire [7:0] temp_1;  //bus from Temp_1 - ALU
    REGISTERS ib3(
    .CPU_BUS(CPU_BUS[7:0]),
     .IIR(IIR),
      .IR_BUS(IR_BUS[7:0]),
    
    .cpu_bus(CPU_BUS[7:0]),
     .IIAR(IIAR),
      .OIAR(OIAR),
      //.wiar(wiar[7:0]),   //------*****-------- IAR is accessed directly to stop the clock -------****
      
  
     .ACC_BUS( ACC_BUS[7:0]),
     .IACC(IACC),
     .OACC(OACC),
    
     .IFLAGS(IFLAGS),
       .C(ALU_C),    //ALU_flag --> flags [3:0] --> Control_unit's C,Gr,E,Z
     .Gr(ALU_Gr),
     .E(ALU_E),
     .Z(ALU_Z),
     .ITEMP(ITEMP),
     .cpt5(cpt5),
      .flags(flags[3:0]),
     .cin(cin),
    
     .O_1(O_1),
    .temp_1(temp_1[7:0]),
    
    .OR0(OR0), .OR1(OR1), .OR2(OR2), .OR3(OR3), .IR0(IR0),
     .IR1(IR1), .IR2(IR2), .IR3(IR3),
     
      .IDISP_REG(IDISP_REG),
      .FPGA_OP(DISPLAY[7:0]),
     
      .OZERO_REG(OZERO_REG),
     .reset(reset)
    );
    //*** REGISTERS ***
    
    // **** ALU ****  
    ALU ib4(
   .CPU_BUS(CPU_BUS[7:0]),
    .temp_1(temp_1[7:0]),
     .c(cin),
   .ALU_SEL(ALU_SEL[7:0]),
     .ACC_BUS(ACC_BUS[7:0]),
     .Gr(ALU_Gr),
     .E(ALU_E),
     .C(ALU_C),
     .Z(ALU_Z)
    ); 
    //**** ALU ****
    
    //***** RAM *****
    RAM_module ib5(
    .cpu_bus(CPU_BUS[7:0]),  //bus from CPU - RAM
       .MW(MW), .ST(ST), .RD(ORAM), .WR(IRAM), .CU_in(IMAR), .A_D(A_D), //A/D -> A_D
        .Fi(FPGA_inp[7:0]),  //connected to physical input pins of FPGA
        .CPU_BUS(CPU_BUS[7:0])  //port mapped with cpu_bus  (bus from RAM - CPU)    
        //.ram_cell_test_(ram_cell_test_[7:0]),
       // .loc0(loc0[7:0])
    );
    //***** RAM *****
endmodule