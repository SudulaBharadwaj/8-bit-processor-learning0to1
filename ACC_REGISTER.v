`timescale 1ns / 1ps


module ACC_REGISTER(
    input [7:0] ACC_BUS,
    input IACC,
    output [7:0] CPU_BUS,
    input OACC
    );
    
    // acc_bus to ACC reg
    wire [7:0] wacc;
    genvar i;
    generate
       for(i=0;i<=7;i=i+1)begin
          reg_DFF m(.D(ACC_BUS[i]), .en(IACC), .Q(wacc[i]));
        end
    endgenerate
    // *ALU-ACC
    
    // bUFFER
    genvar j;
    generate
       for(j=0;j<=7;j=j+1)begin
          bufif1 m1(CPU_BUS[j],wacc[j], OACC);
        end
    endgenerate
    
    // *buf-CPU_BUS
endmodule
