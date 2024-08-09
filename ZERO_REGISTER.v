`timescale 1ns / 1ps

module ZERO_REGISTER(
    input OZERO_REG,
    input reset,
    output [7:0] CPU_BUS
    );
    wire zeros;
    NOT n(.a(reset), .op(zeros) );
     wire [7:0] wzero;
    genvar i; 
    generate
       for(i=0;i<=7;i=i+1)begin
          reg_DFF m(.D(zeros), .en(reset), .Q(wzero[i]));
        end
    endgenerate
                                                          
    genvar j;
    generate
       for(j=0;j<=7;j=j+1)begin
          bufif1 m1(CPU_BUS[j], wzero[j], OZERO_REG);
        end
    endgenerate
endmodule
