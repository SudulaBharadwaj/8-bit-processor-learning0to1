`timescale 1ns / 1ps

module DISP_REGISTER(
    input [7:0] cpu_bus,
    input IDISP_REG,
    output [7:0] FPGA_OP
    );
 
    genvar i;
    generate
       for(i=0;i<=7;i=i+1)begin
          reg_DFF m(.D(cpu_bus[i]), .en(IDISP_REG), .Q(FPGA_OP[i]));
        end
    endgenerate
    
   
endmodule
