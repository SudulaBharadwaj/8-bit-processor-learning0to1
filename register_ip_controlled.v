`timescale 1ns / 1ps

module register_ip_controlled(
    input [7:0] a,
    input en,
    output [7:0] op
    );
    genvar i;
    generate
      for(i=0;i<=7;i=i+1) begin
        mem_register s(.D(a[i]), .en(en), .Q(op[i]));
      end
    endgenerate
    
endmodule

