`timescale 1ms / 1ns
module CPU_tb_SHL ; //testbench has no i/p or o/p ports
reg clk;
reg [7:0] FPGA_inp; //RAM
    reg MW;             //RAM & FREQUENCY_DIVIDER
    reg A_D;            //RAM
    reg ST;            //RAM 
    reg reset;   
    wire [7:0] DISPLAY; //comes out of CPU_BUS
    wire [7:0] ram_cell_test_;
    wire [7:0] loc0 ;
        wire [7:0] wiar;


 CPU CPU_DUT(
    .clk(clk),             //FREQUENCY_DIVIDER
      .FPGA_inp(FPGA_inp[7:0]), //RAM
     .MW(MW),             //RAM & FREQUENCY_DIVIDER
    .A_D(A_D),            //RAM
     .ST(ST),            //RAM 
     .reset(reset),         // Universal
      .DISPLAY(DISPLAY[7:0]), //comes out of CPU_BUS
    .ram_cell_test_(ram_cell_test_ [7:0]),
    .loc0(loc0[7:0])
    );
    
   initial 
      begin 
        clk=1'b0;
   FPGA_inp=8'h00;  //0th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1 
         ST=1'b0;   //Store 0
      reset=1'b0;
       
 #100   clk=1'b0;
   FPGA_inp=8'h00;  //0th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h20;  //0th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0; 
  
 #100   clk=1'b0;
   FPGA_inp=8'h20;  //0th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0 
         ST=1'b0;   //Store 0
      reset=1'b0;      
  
 #100   clk=1'b0;
   FPGA_inp=8'h01;  //1st location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;         
 
 #100   clk=1'b0;
   FPGA_inp=8'h01;  //1st location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h07;  //1st location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h07;  //1st location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h02;  //2nd location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h02;  //2nd location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h21;  //2nd location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h21;  //2nd location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;

 #100   clk=1'b0;
   FPGA_inp=8'h03;  //3rd location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0; 
 
 #100   clk=1'b0;
   FPGA_inp=8'h03;  //3rd location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h01;  //3rd location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h01;  //3rd location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #100   clk=1'b0;
   FPGA_inp=8'h04;  //4th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;     
 
 #100   clk=1'b0;
   FPGA_inp=8'h04;  //4th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h60;  //4th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h60;  //4th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h05;  //5th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h05;  //5th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h94;  //5th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
      
 #100   clk=1'b0;
   FPGA_inp=8'h94;  //5th location data
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0; 
      
 #100   clk=1'b0;
   FPGA_inp=8'h06;  //6th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;     
      
 #100   clk=1'b0;
   FPGA_inp=8'h06;  //6th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0; 
 
 #100   clk=1'b0;
   FPGA_inp=8'h70;  //6th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;     
          
 #100   clk=1'b0;
   FPGA_inp=8'h70;  //6th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;  
      
 #100   clk=1'b0;
   FPGA_inp=8'h07;  //7th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #100   clk=1'b0;
   FPGA_inp=8'h07;  //7th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #100   clk=1'b0;
   FPGA_inp=8'h22;  //7th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
      
 #100   clk=1'b0;
   FPGA_inp=8'h22;  //7th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 1
      reset=1'b0; 
      
 #100   clk=1'b0;
   FPGA_inp=8'h08;  //8th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;     
 
 #100   clk=1'b0;
   FPGA_inp=8'h08;  //8th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;     
 
 #100   clk=1'b0;
   FPGA_inp=8'h00;  //8th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h00;  //8th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;     
 
 #100   clk=1'b0;
   FPGA_inp=8'h09;  //9th location
         MW=1'b1;   //MW = 1
        A_D=1'b1;   //Address 1
         ST=1'b0;   //Store 0
      reset=1'b0;
 
 #100   clk=1'b0;
   FPGA_inp=8'h09;  //9th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;
      
 #100   clk=1'b0;
   FPGA_inp=8'h32;  //9th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b1;   //Store 1
      reset=1'b0;
           
 #100   clk=1'b0;
   FPGA_inp=8'h32;  //9th location
         MW=1'b1;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;  
      
 #100   clk=1'b0;
   FPGA_inp=8'h32;  
         MW=1'b0;   //MW = 1
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b0;    
      
 #100   clk=1'b0;
   FPGA_inp=8'h32;  
         MW=1'b0;   //MW = 0
        A_D=1'b0;   //Address 0
         ST=1'b0;   //Store 0
      reset=1'b1;  
         
 #100   clk=1'b1;
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