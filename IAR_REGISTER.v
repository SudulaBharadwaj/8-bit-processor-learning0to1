`timescale 1ns / 1ps

module IAR_REGISTER(
    input [7:0] cpu_bus,
    input IIAR,
    input OIAR,
    input reset,
    output [7:0] CPU_BUS
   // output wire [7:0] wiar //------*****-------- IAR is accessed directly to stop the clock -------****
    );
    wire IIAR_reset;
    OR o(.a(IIAR), .b(reset), .op(IIAR_reset));
    //----------************----------------&*********************88
    // wire [7:0] wiar;  //removing this line of code so that I can access IAR data directly  
    //-------------**********--------------&&&&&&*************88
    wire [7:0] cpu_bus_reset;
    NOT n(.a(reset), .op(zeros));
    genvar k;
    generate
       for(k=0;k<=7;k=k+1)begin
          AND m(.a(cpu_bus[k]), .b(zeros), .op(cpu_bus_reset[k]));
        end
    endgenerate
    
    wire [7:0] wiar;
    genvar i;
    generate
       for(i=0;i<=7;i=i+1)begin
          reg_DFF m1(.D(cpu_bus_reset[i]), .en(IIAR_reset), .Q(wiar[i]));
        end
    endgenerate
    // *cpu_bus-IAR
    
    // bUFFER
    genvar j;
    generate
       for(j=0;j<=7;j=j+1)begin
          bufif1 m2(CPU_BUS[j], wiar[j], OIAR);
        end
    endgenerate
endmodule