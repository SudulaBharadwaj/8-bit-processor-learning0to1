`timescale 1ns / 1ps

module IR_REGISTER(
    input [7:0] cpu_bus,
    input IIR,
    output [7:0] IR_BUS
    );
    
    wire [7:0] wir;
    genvar i;
    generate
       for(i=0;i<=7;i=i+1)begin
          reg_DFF m(.D(cpu_bus[i]), .en(IIR), .Q(IR_BUS[i]));
        end
    endgenerate
    // *cpu_bus-IR
    
    
endmodule
