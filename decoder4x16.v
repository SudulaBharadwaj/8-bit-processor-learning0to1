`timescale 1ns / 1ps

module decoder4x16( //a-> i0 , b-> i1 , c -> i2 , d -> i3 
    input a,        // i3 i2 i1 i0
    input b,        //MSB       LSB
    input c,
    input d,
    output [15:0] op  //why did I declare op as an input port? 
    );
    wire [1:0] i0;
    wire [1:0] i1;
    wire [1:0] i2;
    wire [1:0] i3;
    NOT j(.a(a), .op(i0[0])); // ~i0
    NOT j1(.a(i0[0]), .op(i0[1])); //i0 (buffer)
    NOT j2(.a(b), .op(i1[0])); // ~i1
    NOT j3(.a(i1[0]), .op(i1[1])); //i1 (buffer)
    NOT j4(.a(c), .op(i2[0])); // ~i2
    NOT j5(.a(i2[0]), .op(i2[1])); //i2 (buffer)
    NOT j6(.a(d), .op(i3[0])); // ~i3
    NOT j7(.a(i3[0]), .op(i3[1])); //i3 (buffer)
    
    genvar n,m,k,l;
    generate
      for(n=0;n<2;n=n+1) begin
          for(m=0;m<2;m=m+1) begin
              for(l=0;l<2;l=l+1) begin
                  for(k=0;k<2;k=k+1) begin
                      AND4inp f(.a(i3[n]), .b(i2[m]), .c(i1[l]), .d(i0[k]), .op(op[(8*n)+(4*m)+(2*l)+k ]));
                  end
              end
          end
      end
    endgenerate
    
    
endmodule
