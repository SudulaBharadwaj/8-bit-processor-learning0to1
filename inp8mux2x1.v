`timescale 1ns / 1ps


module inp8mux2x1(
    input [7:0] a,
    input [7:0] b,
    input s,
    output  [7:0] op 
    );
    
    genvar i;
    generate
      for(i=0;i<=7; i=i+1) begin
          mux2x1 w0(.a(a[i]), .b(b[i]), .s(s), .op(op[i]));
      end
    endgenerate
    
endmodule
