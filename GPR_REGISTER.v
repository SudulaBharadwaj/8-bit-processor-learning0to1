`timescale 1ns / 1ps

module GPR_REGISTER(
    input [7:0] cpu_bus,
    output [7:0] CPU_BUS,
    input OR0,OR1,OR2,OR3,IR0,IR1,IR2,IR3
    );
   //R0, R1, R2, R3
   wire [7:0] wreg0;
   wire [7:0] wreg1;
   wire [7:0] wreg2;
   wire [7:0] wreg3;
   genvar i;
    generate
       for(i=0;i<=7;i=i+1)begin
          reg_DFF reg0(.D(cpu_bus[i]), .en(IR0), .Q(wreg0[i]));
        end
    endgenerate 
    genvar j;
    generate
       for(j=0;j<=7;j=j+1)begin
          reg_DFF reg1(.D(cpu_bus[j]), .en(IR1), .Q(wreg1[j]));
        end
    endgenerate 
    genvar k;
    generate
       for(k=0;k<=7;k=k+1)begin
          reg_DFF reg0(.D(cpu_bus[k]), .en(IR2), .Q(wreg2[k]));
        end
    endgenerate 
    genvar l;
    generate
       for(l=0;l<=7;l=l+1)begin
          reg_DFF reg0(.D(cpu_bus[l]), .en(IR3), .Q(wreg3[l]));
        end
    endgenerate 
    
    //buffer - CPU_BUS
    genvar a;
    generate
       for(a=0;a<=7;a=a+1)begin
          bufif1 reg0(CPU_BUS[a], wreg0[a], OR0);
        end
    endgenerate
    genvar b;
    generate
       for(b=0;b<=7;b=b+1)begin
          bufif1 reg1(CPU_BUS[b], wreg1[b], OR1);
        end
    endgenerate
    genvar c;
    generate
       for(c=0;c<=7;c=c+1)begin
          bufif1 reg2(CPU_BUS[c], wreg2[c], OR2); //CULPRIT :( 
        end
    endgenerate
    
    genvar d;
    generate
       for(d=0;d<=7;d=d+1)begin
          bufif1 reg3(CPU_BUS[d], wreg3[d], OR3);
        end
    endgenerate
    
endmodule
