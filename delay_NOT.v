`timescale 1ns / 1ps


module delay_NOT(
    input wseq2,wseq3,wseq4,wseq5,wseq6,
    output dwseq2,dwseq3,dwseq4,dwseq5,dwseq6
    );
    parameter delay=10;
    wire [ ((delay*5)+4):0] dw;
    NOT s2(.a(wseq2), .op(dw[0]));
    NOT s3(.a(wseq3), .op(dw[(delay+1)]));
    NOT s4(.a(wseq4), .op(dw[( (delay*2)+2)]));
    NOT s5(.a(wseq5), .op(dw[( (delay*3)+3)]));
    NOT s6(.a(wseq6), .op(dw[( (delay*4)+4)]));
    
    genvar i,j;
    generate
     for(j=0;j<5;j=j+1) begin 
      for(i=( (delay*j)+j ); i< ( (delay*j)+j+delay  ); i=i+1) begin
             NOT s(.a(dw[ i ]), .op(dw[(  i+1   )]) );
           end 
         end      
    endgenerate
    
    NOT ds2(.a(dw[10]), .op(dwseq2));
    NOT ds3(.a(dw[21]), .op(dwseq3));
    NOT ds4(.a(dw[32]), .op(dwseq4));
    NOT ds5(.a(dw[43]), .op(dwseq5));
    NOT ds6(.a(dw[54]), .op(dwseq6));
    
endmodule
