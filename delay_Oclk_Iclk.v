`timescale 1ns / 1ps


module delay_Oclk_Iclk(
    input Oclk,
    output Iclk
    );
    genvar i;
    parameter delay=10;
    wire [(delay):0] w;
    NOT g(.a(Oclk), .op(w[0]));
    
    generate
      
      for(i=0; i<delay; i=i+1) begin
             NOT s(.a(w[i]), .op(w[i+1]) );
           end 
             
    endgenerate
    
    NOT h(.a(w[delay]), .op(Iclk));
    
    
endmodule
