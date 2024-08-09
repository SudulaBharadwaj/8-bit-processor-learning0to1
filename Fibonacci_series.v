`timescale 1ms / 1ns
module Fibonacci_series ; //testbench has no i/p or o/p ports
reg clk;
reg [7:0] FPGA_inp; //RAM
    reg MW;             //RAM & FREQUENCY_DIVIDER
    reg A_D;            //RAM
    reg ST;            //RAM 
    reg reset;   
    wire [7:0] DISPLAY; //comes out of CPU_BUS
    //wire [7:0] ram_cell_test_;
    //wire [7:0] loc0 ;
     wire [7:0] wiar;


 CPU CPU_DUT(
    .clk(clk),             //FREQUENCY_DIVIDER
      .FPGA_inp(FPGA_inp[7:0]), //RAM
     .MW(MW),             //RAM & FREQUENCY_DIVIDER
    .A_D(A_D),            //RAM
     .ST(ST),            //RAM 
     .reset(reset),         // Universal
      .DISPLAY(DISPLAY[7:0]) //comes out of CPU_BUS
   // .ram_cell_test_(ram_cell_test_ [7:0]),
   // .loc0(loc0[7:0])
    );
    
   initial 
      begin 
        clk=1'b0;
   FPGA_inp=8'h00;  //0th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1 
         ST=1'b0;   //Store 0
      reset=1'b0;
       
 #1   clk=1'b0;
   FPGA_inp=8'h00;  //0th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h20;  //0th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0; 
  
 #1   clk=1'b0;
   FPGA_inp=8'h20;  //0th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0 
         ST=1'b0;   //Store 0
      reset=1'b0;      
  
 #1   clk=1'b0;
   FPGA_inp=8'h01;  //1 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h01;  //1 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h00;  //1 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h00;  //1 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;


#1   clk=1'b0;
   FPGA_inp=8'h02;  //2 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h02;  //2 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h70;  //2 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h70;  //2 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h03;  //3 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h03;  //3 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h21;  //3 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h21;  //3 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h04;  //4 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h04;  //4 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h01;  //4 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h01;  //4 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h05;  //5 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h05;  //5 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h71;  //5 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h71;  //5 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h06;  //6 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h06;  //6 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h22;  //6 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h22;  //6 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h07;  //7 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h07;  //7 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h67;  //7 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h67;  //7 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h08;  //8 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h08;  //8 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h60;  //8 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h60;  //8 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h09;  //9 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h09;  //9 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h81;  //9 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h81;  //9 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h0a;  //10 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h0a;  //10 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h19;  //10 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h19;  //10 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h0b;  //11 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h0b;  //11 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h60;  //11 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h60;  //11 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h0c;  //12 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h0c;  //12 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h81;  //12 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h81;  //12 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h0d;  //13 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h0d;  //13 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h71;  //13 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h71;  //13 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h0e;  //14 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h0e;  //14 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h08;  //14 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h08;  //14 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h0f;  //15 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h0f;  //15 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h23;  //15 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h23;  //15 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h10;  //16 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h10;  //16 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h01;  //16 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h01;  //16 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h11;  //17 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h11;  //17 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h8e;  //17 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h8e;  //17 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h12;  //18 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h12;  //18 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h19;  //18 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h19;  //18 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h13;  //19 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h13;  //19 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h23;  //19 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h23;  //19 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h14;  //20 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h14;  //20 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h77;  //20 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h77;  //20 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h15;  //21 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h15;  //21 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'heb;  //21 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'heb;  //21 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h16;  //22 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h16;  //22 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h52;  //22 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h52;  //22 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h17;  //23 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h17;  //23 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h1a;  //23 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h1a;  //23 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h18;  //24 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h18;  //24 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h40;  //24 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h40;  //24 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h19;  //25 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h19;  //25 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h0b;  //25 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h0b;  //25 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h1a;  //26 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h1a;  //26 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h20;  //26 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h20;  //26 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h1b;  //27 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h1b;  //27 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h00;  //27 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h00;  //27 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

#1   clk=1'b0;
   FPGA_inp=8'h1c;  //28 location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #1   clk=1'b0;
   FPGA_inp=8'h1c;  //28 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #1   clk=1'b0;
   FPGA_inp=8'h30;  //28 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #1   clk=1'b0;
   FPGA_inp=8'h30;  //28 location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;


//MW=0 --->  
      
 #1   clk=1'b0;
   FPGA_inp=8'h32;  
         MW=1'b0;   //MW = 0
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;    
      
 #1   clk=1'b0;
   FPGA_inp=8'h32;  
         MW=1'b0;   //MW = 0
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b1;  
         
 #1   clk=1'b1;
   FPGA_inp=8'h32;  //9th location
         MW=1'b0;   //MW = 0
        A_D=1'b1;   //Address 1
         ST=1'b1;   //Store 1
      reset=1'b0;     
         
    forever begin
    #50;
     clk=~clk;  
     end 
      
      end
   
   
     endmodule