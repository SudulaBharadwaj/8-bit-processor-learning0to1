`timescale 1ns / 1ps


module REGISTERS(
  output [7:0] CPU_BUS,
    input IIR,
    output [7:0] IR_BUS,
    
    input [7:0] cpu_bus,
    input IIAR,
    input OIAR,
    //output  [7:0] wiar, //------*****-------- IAR is accessed directly to stop the clock -------****
  
    input [7:0] ACC_BUS,
    input IACC,
    input OACC,
    
      input C,
    input IFLAGS,
    input Gr,
    input E,
    input Z,
    input ITEMP,
    input cpt5,
    output [3:0] flags,
    output cin,
    
    input O_1,  //I_1
    output [7:0] temp_1,
    
     input OR0,OR1,OR2,OR3,IR0,IR1,IR2,IR3,
     
     input IDISP_REG,
     output [7:0] FPGA_OP,
     
      input OZERO_REG,
    input reset
    );
    // ZERO REGISTER
    ZERO_REGISTER r0(.OZERO_REG(OZERO_REG), .reset(reset), .CPU_BUS(CPU_BUS[7:0]));
    //IR register instantiation
    IR_REGISTER r1(.cpu_bus(cpu_bus[7:0]), .IIR(IIR), .IR_BUS(IR_BUS[7:0]));
    //IAR register instantiation
    IAR_REGISTER r2(.cpu_bus(cpu_bus[7:0]), .IIAR(IIAR), .OIAR(OIAR), .reset(reset), .CPU_BUS(CPU_BUS[7:0]));
    //ACC Register
    ACC_REGISTER r3(.ACC_BUS(ACC_BUS[7:0]), .IACC(IACC), .CPU_BUS(CPU_BUS[7:0]), .OACC(OACC));
    //FLAG Register
    FLAGS_REGISTER r4(.C(C), .Gr(Gr), .E(E), .Z(Z), .IFLAGS(IFLAGS), .ITEMP(ITEMP), .cpt5(cpt5), .flags(flags[3:0]), .cin(cin));
    //TEMP Register
    TEMP_register r5(.cpu_bus(cpu_bus[7:0]), .ITEMP(ITEMP), .O_1(O_1), .temp_1(temp_1) );
    //GPR Register
    GPR_REGISTER r6(.cpu_bus(cpu_bus[7:0]), .CPU_BUS(CPU_BUS[7:0]), .OR0(OR0), .OR1(OR1), .OR2(OR2), .OR3(OR3), .IR0(IR0), .IR1(IR1), .IR2(IR2), .IR3(IR3) );
    //DISP_REG
    DISP_REGISTER r7(.cpu_bus(cpu_bus[7:0]), .IDISP_REG(IDISP_REG), .FPGA_OP(FPGA_OP[7:0]) );
    

endmodule
