`timescale 1ns / 1ps

module dummy_clk(
    input clk,          //50M cycles  --> 120% = 60M cycles
    output reg dclk=0   // 10M cycles = 0.2 seconds
    );                  // 8M = 0.16sec (+ve) , 2M = 0.04sec (-ve)
    integer counter=0; 
    always@(posedge clk)
    begin
       if(counter<=7999999)  //<8M cycles  
         begin
         dclk<=1;               //0.16 sec +Ve
         counter <= counter+1;
         end
       else if (counter> 7999999 && counter < 10000000) //>8M && < 10M
         begin
            counter <= counter+1;
            dclk <=0;            //0.04 sec -Ve
         end
         else 
             counter=0;
    end
    
endmodule
