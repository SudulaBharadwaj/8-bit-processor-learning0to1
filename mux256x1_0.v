`timescale 1ns / 1ps

module mux256x1_0(
    input [2047:0] RAM_cell_op,
    input [7:0] MAR_BUS,
    input bit,
    output op
    );
    
   
    wire [1:0] s7;
    wire [1:0] s6;
    wire [1:0] s5;
    wire [1:0] s4;
    wire [1:0] s3;
    wire [1:0] s2;
    wire [1:0] s1;
    wire [1:0] s0;
    NOT l(.a(MAR_BUS[0]), .op(s0[0]));
    NOT l1(.a(s0[0]), .op(s0[1]));
    NOT l2(.a(MAR_BUS[1]), .op(s1[0]));
    NOT l3(.a(s1[0]), .op(s1[1]));
    NOT l4(.a(MAR_BUS[2]), .op(s2[0]));
    NOT l5(.a(s2[0]), .op(s2[1]));
    NOT l6(.a(MAR_BUS[3]), .op(s3[0]));
    NOT l7(.a(s3[0]), .op(s3[1]));
    NOT l8(.a(MAR_BUS[4]), .op(s4[0]));
    NOT l9(.a(s4[0]), .op(s4[1]));
    NOT l10(.a(MAR_BUS[5]), .op(s5[0]));
    NOT l11(.a(s5[0]), .op(s5[1]));
    NOT l12(.a(MAR_BUS[6]), .op(s6[0]));
    NOT l13(.a(s6[0]), .op(s6[1]));
    NOT l14(.a(MAR_BUS[7]), .op(s7[0]));
    NOT l15(.a(s7[0]), .op(s7[1]));
    
    wire [255:0] ram_cell_op_s;
    
    genvar q,w,e,r,t,y,u,i;
    generate
       for(q=0;q<2;q=q+1)begin
          for(w=0;w<2;w=w+1)begin
             for(e=0;e<2;e=e+1)begin
                 for(r=0;r<2;r=r+1)begin
                    for(t=0;t<2;t=t+1)begin
                        for(y=0;y<2;y=y+1)begin
                           for(u=0;u<2;u=u+1)begin
                                  for(i=0;i<2;i=i+1)begin
                                        AND8inp S(.A(s7[q]), .B(s6[w]), .C(s5[e]), .D(s4[r]), .E(s3[t]), .F(s2[y]), .G(s1[u]), .H(s0[i]), .I(RAM_cell_op[ ( ( ( (128*q)+(64*w)+(32*e)+(16*r)+(8*t)+(4*y)+(2*u)+(1*i) )*8 ) + bit ) ] ), .op(ram_cell_op_s[(  (128*q)+(64*w)+(32*e)+(16*r)+(8*t)+(4*y)+(2*u)+(1*i)  )] )    );
                                    end
                              end
                         end
                     end
                  end
             end
          end
       end
    endgenerate
    
    wire [127:0] lvl0;
    genvar i_;
    generate
      for(i_=0;i_<128;i_=i_+1) begin
      OR us0(.a(ram_cell_op_s[ (2*i_)  ]), .b(ram_cell_op_s[( (2*i_)+1 )]), .op(lvl0[i_]) ) ;
      end
      endgenerate 
      wire [63:0] lvl1;
      genvar j;
     generate
      for(j=0;j<64;j=j+1) begin
      OR us1(.a(lvl0[(2*j)]), .b(lvl0[( (2*j)+1)]), .op(lvl1[j]) ) ;
      end 
    endgenerate
    
     wire [31:0] lvl2;
      genvar k;
     generate
      for(k=0;k<32;k=k+1) begin
      OR us2(.a(lvl1[(2*k)]), .b(lvl1[( (2*k)+1)]), .op(lvl2[k]) ) ;
      end 
    endgenerate
    
     wire [15:0] lvl3;
      genvar l_;
     generate
      for(l_=0;l_<16;l_=l_+1) begin
      OR us3(.a(lvl2[(2*l_)]), .b(lvl2[( (2*l_)+1)]), .op(lvl3[l_]) ) ;
      end 
    endgenerate
    
    wire [7:0] lvl4;
      genvar m;
     generate
      for(m=0;m<8;m=m+1) begin
      OR us4(.a(lvl3[(2*m)]), .b(lvl3[( (2*m)+1)]), .op(lvl4[m]) ) ;
      end 
    endgenerate
    
     wire [3:0] lvl5;
      genvar n;
     generate
      for(n=0;n<4;n=n+1) begin
      OR us5(.a(lvl4[(2*n)]), .b(lvl4[( (2*n)+1)]), .op(lvl5[n]) ) ;
      end 
    endgenerate
    
    wire [1:0] lvl6;
      genvar o;
     generate
      for(o=0;o<2;o=o+1) begin
      OR us6(.a(lvl5[(2*o)]), .b(lvl5[( (2*o)+1)]), .op(lvl6[o]) ) ;
      end 
    endgenerate
    
    OR us7(.a(lvl6[0]), .b(lvl6[1]), .op(op));
    
    
endmodule
