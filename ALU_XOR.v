`timescale 1ns / 1ps


module ALU_XOR(
           
        input [7:0] B,
          input [7:0] a,
          output [7:0] EXOR_op,
          output Gr,E
    );
    genvar i;
    generate  // Bitwise XOR 
      for(i=0;i<=7;i=i+1) begin
         XOR x(.a(a[i]), .b(B[i]), .op(EXOR_op[i]));
      end
    endgenerate
    //Greater flag "Gr"
    wire [7:0] Bbar;
    genvar j;
     generate  
      for(j=0;j<=7;j=j+1) begin
         NOT y( .a(B[j]), .op(Bbar[j]));
      end
    endgenerate
    wire [7:0] eq;
     genvar k;
     generate  
      for(k=0;k<=7;k=k+1) begin
         XNOR z( .a(a[k]), .b(B[k]), .op(eq[k]));
      end
    endgenerate
    wire [7:0] gr;
   genvar l;
     generate  //a[i]>b[i] ? --> gr[i]
      for(l=0;l<=7;l=l+1) begin
        AND q(.a(a[l]), .b(Bbar[l]), .op(gr[l]));  
            end
    endgenerate
    
    wire b,c,d,e,f,g,h;
    wire w1,w2,w3,w4,w5,w6,w7,w8,w9,fw1,w11,w12,w13,gw1,gw2,r11,r12,r13,r14,hw1,hw2,o1,o2,oo1,oo2;
    AND e1(.a(eq[7]), .b(gr[6]), .op(b) ); // B
   
    AND f1(.a(eq[7]), .b(eq[6]), .op(w1) );
    AND g1(.a(w1), .b(gr[5]), .op(c) ); //C
   
    AND h1(.a(eq[7]), .b(eq[6]), .op(w2) );
    AND r(.a(w2), .b(eq[5]), .op(w3) );
    AND p(.a(w3), .b(gr[4]), .op(d) ); //d
   
    AND p1(.a(eq[7]), .b(eq[6]), .op(w4) );
    AND p2(.a(eq[5]), .b(eq[4]), .op(w5) );
    AND p3(.a(w4), .b(w5), .op(w6) );
    AND p4(.a(w6), .b(gr[3]), .op(e) ); //e
   
    AND p5(.a(eq[7]), .b(eq[6]), .op(w7) );
    AND p6(.a(eq[5]), .b(eq[4]), .op(w8) );
    AND p7(.a(eq[3]), .b(gr[2]), .op(w9) );
    AND p8(.a(w7), .b(w8), .op(fw1));
    AND p9(.a(fw1), .b(w9), .op(f)); //f
   
    AND q1(.a(eq[7]), .b(eq[6]), .op(w11) );
    AND q2(.a(eq[5]), .b(eq[4]), .op(w12) );
    AND q3(.a(eq[3]), .b(eq[2]), .op(w13) );
    AND q4(.a(w13), .b(gr[1]), .op(gw1));
    AND q5(.a(w11), .b(w12), .op(gw2));
    AND q6(.a(gw1), .b(gw2), .op(g) ); //g
    
    AND t1(.a(eq[7]), .b(eq[6]), .op(r11) );
    AND t2(.a(eq[5]), .b(eq[4]), .op(r12) );
    AND t3(.a(eq[3]), .b(eq[2]), .op(r13) );
    AND t4(.a(eq[1]), .b(gr[0]), .op(r14));
    AND t5(.a(r11), .b(r12), .op(hw1));
    AND t6(.a(r13), .b(r14), .op(hw2) ); 
    AND t7(.a(hw1), .b(hw2), .op(h) ); //h
    
    OR m(.a(gr[7]), .b(b), .op(o1));
    OR m1(.a(c), .b(d), .op(o2));
    OR m2(.a(e), .b(f), .op(o3));
    OR m3(.a(g), .b(h), .op(o4));
    OR m4(.a(o1), .b(o2), .op(oo1));
    OR m5(.a(o3), .b(o4), .op(oo2));
    OR m6(.a(oo1), .b(oo2), .op(Gr)); //**-- greater flag --**
    
    //Equal flag
    AND4inp s(.a(eq[0]), .b(eq[1]), .c(eq[2]), .d(eq[3]), .op(eqw1));
    AND4inp s1(.a(eq[7]), .b(eq[6]), .c(eq[5]), .d(eq[4]), .op(eqw2));
    AND s2(.a(eqw1), .b(eqw2), .op(E));
endmodule