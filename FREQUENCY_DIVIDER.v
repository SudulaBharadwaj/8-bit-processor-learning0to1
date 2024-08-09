`timescale 1ns / 1ps

module FREQUENCY_DIVIDER(
    input MW,
    input clk,
    output reg dclk=0,
    output Iclk,
    output Oclk
    );
   wire MW_;
   reg [27:0] counter = 28'd0;
    parameter divisor = 28'd10;    // frequency divider : if fequency of fpga be F
    always @ (posedge clk)         // dclk = F/divisor                       
    begin                          // F= 50MHz & I want 50Hz for dclk     
    counter <= counter + 28'd1;    // 50MHz/divisor= 50Hz --> divisor = 1M (10_00_000)       
      if(counter >= (divisor-1) )       
         counter <= 0;
    dclk <= (counter < (divisor/2) ) ? 1'b1 : 1'b0;
    
    end  
   
   
  //------*******----------
   //Oclk vs Iclk old delay  
  NOT n(.a(MW), .op(MW_));
    wire D1, D2, D3;
               
   reg_DFF d1(.D(dclk), .en(MW_), .Q(D1));
   reg_DFF d2(.D(D1), .en(MW_), .Q(Iclk)); 
   reg_DFF d3(.D(D1), .en(MW_), .Q(D2));    //--> some delay in between Oclk & Iclk 
   reg_DFF d4(.D(D2), .en(MW_), .Q(D3)); 
   reg_DFF d5(.D(D3), .en(MW_), .Q(Oclk)); 
    
   //---*********-----------*******8
 
 /*  
   wire nn;
    NOT s1(.a(clk), .op(nn));
    NOT s2(.a(nn), .op(Oclk));
    
    delay_Oclk_Iclk delayed(.Oclk(Oclk), .Iclk(Iclk));
   */ 
    
   
endmodule 
