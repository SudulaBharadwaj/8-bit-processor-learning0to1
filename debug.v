`timescale 1ns / 1ps

module debug(  
    input clk, //processor clock for timing
    output  [7:0] display  // instructionCode = 00110000  (no registers required, just wiring accumulator data out to display output port)
    );
    
 
 //display output must be connected to a register
    reg [7:0] dummy_display;    
    reg carry_flag;
    reg  carry_in=0,greater_flag=0, equal_flag=0,zero_flag=0; 
    reg  carry_t=0,greater_t=0, equal_t=0,zero_t=0; 
    reg [7:0] Program_code [43:0]; //total instructions will be stored in this vector //each instruction is of 8bit size 
    reg [7:0] acc=8'b00000000; //accumulator
    reg [7:0] register[3:0];//reg [7:0] register[3:0]= {8'b00000000,8'b00000000,8'b00000000,8'b00000000}; 4 registers cooked in a single vector for easy accessing and each index holds 8 bits of data
    reg [5:0] pc=6'b000000; //pc --> program counter to update the(instruction)Program_code index value // 5'b11111 1+2+4+8+16
    reg [7:0] instruction;
    integer Rsel_A,Rsel_B; //register index storage for selecting register among 4
    reg [5:0] temp;
   
   initial begin   //***********INSTRUCTIONS SET for FIBONACCI SERIES **********//
   Program_code[6'b000000]= 8'b00100000; //DATA
   Program_code[6'b000001]= 8'b00000000; //"0"
   Program_code[6'b000010]= 8'b11110000; // DISP REG
   Program_code[6'b000011]= 8'b00100001; //DATA
   Program_code[6'b000100]= 8'b00000001; //"1"
   Program_code[6'b000101]= 8'b11110001; // DISP REG
   Program_code[6'b000110]= 8'b00100010; //DATA
   Program_code[6'b000111]= 8'b00100000; //@32 (33rd location)    
   Program_code[6'b001000]= 8'b01100000; //CLEAR
   Program_code[6'b001001]= 8'b10000100; //ADDITION
   Program_code[6'b001010]= 8'b01110000; //DISPLAY
   Program_code[6'b001011]= 8'b00011000; //STORE
   Program_code[6'b001100]= 8'b01100000; //CLEAR
   Program_code[6'b001101]= 8'b10000100; //ADDITION
   Program_code[6'b001110]= 8'b01110000; //DISPLAY
   Program_code[6'b001111]= 8'b00001001; //LOAD
   Program_code[6'b010000]= 8'b00100011; //DATA
   Program_code[6'b010001]= 8'b00000001; //"1"
   Program_code[6'b010010]= 8'b01100000; //CLEAR
   Program_code[6'b010011]= 8'b10001110; //ADDITION
   Program_code[6'b010100]= 8'b00011000; //STORE
   Program_code[6'b010101]= 8'b00100011; //DATA
   Program_code[6'b010110]= 8'b00101001; //41
   Program_code[6'b010111]= 8'b11101011; //COMPARE/XOR 
   Program_code[6'b011000]= 8'b01010010; //JUMP_CONDITION (JUMP IF EQUAL)
   Program_code[6'b011001]= 8'b01000000; //JUMP TO -->
   Program_code[6'b011010]= 8'b00001100; // @12
 /*Program_code[6'b011011]= 8'b00101011;
   Program_code[6'b011100]= 8'b00000000;
   Program_code[6'b011101]= 8'b00101011;
   Program_code[6'b011110]= 8'b00101011;
   Program_code[6'b011111]= 8'b00101011;
   Program_code[6'b100000]= 8'b00101011;
   Program_code[6'b100001]= 8'b00101011; */
   Program_code[6'b100010]= 8'b00000000;    //RESULTS STORAGE
   Program_code[6'b100011]= 8'b00000000;
   Program_code[6'b100100]= 8'b00000000;
   Program_code[6'b100101]= 8'b00000000;
   Program_code[6'b100110]= 8'b00000000;
   Program_code[6'b100111]= 8'b00000000;
   Program_code[6'b101000]= 8'b00000000;
   Program_code[6'b101001]= 8'b00000000;
   Program_code[6'b101010]= 8'b00000000;
   Program_code[6'b101011]= 8'b00000000;
   Program_code[6'b101100]= 8'b00000000;
   Program_code[6'b101101]= 8'b00000000;
  
  
   end
   
    always@(posedge clk)   //block of code runs at every positive edge of clk
    begin
         
    #1000  instruction= Program_code[pc]; //PROGRAM COUNTER
          
       #5000    case(instruction[3:2])                //register selection for "REG A"
                  2'b00 :  Rsel_A=0 ;   // this whole index selection can be reduced just by slicing instruction binary data out --> instruction[1:0]
                  2'b01 : Rsel_A=1 ;     //   and instruction[3:2]
                  2'b10 : Rsel_A=2 ;    
                  2'b11 : Rsel_A=3 ;      
                endcase
       #5000    case(instruction[1:0])                //register selection for "REG B"
                  2'b00 : Rsel_B=0 ;   // this whole index selection can be reduced just by slicing instruction binary data out --> instruction[1:0]
                  2'b01 : Rsel_B=1 ;     //   and instruction[3:2]
                  2'b10 : Rsel_B=2 ;    
                  2'b11 : Rsel_B=3 ;      
                endcase
          
       #10000    case (instruction[7]) //computing or Non-computing
              
                  1'b1 : begin   //ALU computing operations MSB --> 1 (other 7 bits can be either 1 or 0
                          
                       case(instruction[6:4])   //type of ALU operation
                             // instruction[6:4] 
                              4'b000 : begin  // '000' --> addition   <ADD R0,R1>
                                         {carry_flag,acc}= register[Rsel_A]+register[Rsel_B]+carry_in;  // data in register A & B added and result stored in acc
                                           register[Rsel_B]= acc;        // computed result stored in register B
                                         
                                           pc=pc+1;
                                        end
                              4'b001 : begin   // SHL shift left  <SHL R0>
                                         acc= register[Rsel_B] << 1;              //we will store result in acc then to reg B
                                         acc= {acc[7:1],carry_in};               //we will use carry_in as common carry for SHL, SHR, Addition
                                         register[Rsel_B]= acc;  
                                         pc=pc+1;
                                        end 
                              4'b010 : begin   // SHL shift right   <SHR R0>
                                         carry_flag = register[Rsel_A][7]  ;
                                         acc= register[Rsel_B] >> 1;   //we will store result in acc then to reg B
                                         acc= {carry_in,acc[6:0]};     //we will use carry_in as common carry for SHL, SHR, Addition
                                         register[Rsel_B]= acc; 
                                         pc=pc+1;                
                                        end 
                              4'b011 : begin   //NOT operation   <NOT R0
                                         acc= ~(register[Rsel_B]);
                                         register[Rsel_B]= acc;  
                                         pc=pc+1; 
                                        end 
                              4'b100 : begin     //AND    <AND R0,R1>
                                         acc= register[Rsel_A] & register[Rsel_B];
                                         register[Rsel_B]= acc; 
                                         pc=pc+1;
                                        end  
                              4'b101 : begin     //OR    <OR R0,R1>
                                         acc= register[Rsel_A] | register[Rsel_B];
                                         register[Rsel_B]= acc; 
                                         pc=pc+1;
                                        end  
                              4'b110 : begin     //XOR & CMP    <XOR R0,R1
                                         if(register[Rsel_A] > register[Rsel_B]) greater_flag=1; //greater assigned with 1 if A >B
                                         else if (register[Rsel_A] == register[Rsel_B]) equal_flag=1; //A==B 
                                         acc= register[Rsel_A] ^ register[Rsel_B];  //ASSIGN not used (https://youtube.com/live/k2cGq8wSIiI?feature=share 29:00)
                                         register[Rsel_B]= acc; 
                                         pc=pc+1;
                                       end   
                              4'b111 : begin // use this as output display in simulation   ******DISPLAY*****
                                         dummy_display=  register[Rsel_B];                 //generally we display accumulator data ?any other?
                                         pc=pc+1;   
                                    end                  
                           endcase
                                                
                     end  //end of COmputation part
              
                  1'b0 : begin   //NOn-computing (load,store, data...)
                      
                     case( instruction[6:4]) 
                          
                          4'b000 : begin   //load operation  <LOAD R1 R0>   R1 has address of data location & it stores it in R0
                                     temp=pc+1;   //
                                     pc= register[Rsel_A];  //reg A has the address 
                                     register[Rsel_B] = Program_code[pc];  // specify address from which location we are accessing data & reg to hold it(since nxt instruction locatiON contains data
                                     pc=temp;       
                                    end
                          4'b001 : begin   //store operation
                                     temp=pc+1; //temporary variable to store 'pc'
                                     pc=register[Rsel_A];   //pc must be updated with an address specified in a register say,REG A has the address
                                     Program_code[pc] = register[Rsel_B];  // Program_code is updated with reg B which has data 
                                     pc=temp;           
                                   end
                          4'b010 : begin  //LOAD & DATA instruction seems similar but when it comes to hardware level it's completely an another story ;)
                                     pc=pc+1;
                                     register[Rsel_B] =   Program_code[pc];
                                     pc=pc+1;
                                    end
                          4'b011 : begin   //JMPR jump program counter to location specified by reg-B
                                     pc=  register[Rsel_B];   
                                    end  
                          4'b100 : begin //nxt instruction itself contains the desired jump location   <JMP ADDR>
                                     pc= Program_code[ pc+1];
                                    end
                          4'b101 : begin // JCON --> JE / JGr / JZ / JC     // {carry_flag, greater_flag,equal_flag,zero_flag}=instruction[3:0]   <JCON 
                                    {carry_t, greater_t,equal_t,zero_t}={instruction[3],instruction[2],instruction[1],instruction[0]};    
                                     pc= ( (carry_flag&carry_t)==1'b1 || (greater_flag&greater_t) ==1'b1 || (equal_flag&equal_t)==1'b1 || (zero_flag&zero_t)==1'b1)? pc+3 : pc+1; 
                                    end
                          4'b110 : begin  //CLF clearing flags 
                                     carry_flag=0;
                                     greater_flag=0;
                                     equal_flag=0;
                                     zero_flag=0;
                                     pc=pc+1;
                                    end
                            
                            
                          4'b111 : begin // use this as output display in simulation   ******DISPLAY*****
                                     dummy_display= acc;                 //generally we display accumulator data ?any other?
                                     pc=pc+1;   
                                    end       
                     endcase
             end     //end of non-computation
           
           endcase 
           
    end //end of always block
 assign display=dummy_display;
endmodule
