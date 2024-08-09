`timescale 1ns / 1ps

module mem_buf(
     input a,
    input d1,d2,RD, //decoder1_w =d1, decoder2_w =d2, Read from cpu= RD 
    output op
    );
    wire d_en,buf_en;
    AND s(.a(d1), .b(d2), .op(d_en));
    AND s1(.a(d_en), .b(RD), .op(buf_en));
    bufif1 no_instantiation_name(op,a,buf_en);
endmodule
