`timescale 1ns / 1ps

module TEMP_register(
    input [7:0] cpu_bus,
    input ITEMP,
    input O_1,
    output [7:0] temp_1
    );
    wire [7:0] temp;
    genvar i;
    generate
       for(i=0;i<=7;i=i+1)begin
          reg_DFF m(.D(cpu_bus[i]), .en(ITEMP), .Q(temp[i]));
        end
    endgenerate   
    wire I_1bar;
    NOT n(.a(O_1), .op(O_1bar));           //O_1 (+1) is set high when +1 is required from TEMP register
    
    OR o(.a(O_1), .b(temp[0]), .op(temp_1[0]));
    
    genvar j;
    generate
      for(j=1;j<=7;j=j+1) begin
         AND o1(.a(temp[j]), .b(O_1bar), .op(temp_1[j]));
      end
    endgenerate
    
endmodule
