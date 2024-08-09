`timescale 1ns / 1ps


module RAM_module(
       input [7:0] cpu_bus,  //bus from CPU - RAM
        input MW, ST, RD, WR, CU_in, A_D, //A/D -> A_D
        input [7:0] Fi,  //connected to physical input pins of FPGA
        output [7:0] CPU_BUS //port mapped with cpu_bus  (bus from RAM - CPU)    
        //output [7:0] ram_cell_test_,
        //output [7:0] loc0
    );
    wire [7:0] RAM_BUS;
    // -- mux 2x1 --> selecting between fPGA input and CPU BUS --
    inp8mux2x1 fpgavscpubus(.a(cpu_bus[7:0]), .b(Fi[7:0]), .s(MW), .op(RAM_BUS[7:0]));
    // *end selection between FPGA & CPU_BUS*
   // -- enable pin for MAR --
    wire MW_CU_in;
    wire MAR_en; 
    OR mar_en(.a(CU_in), .b(MW), .op(MW_CU_in)); 
    AND MW_AD(.a(A_D), .b(MW_CU_in), .op(MAR_en));   
    
    // * end of mar_en *
    // -- MAR register instantiation --
    wire [7:0] MAR_BUS;
    register_ip_controlled mar(.a(RAM_BUS [7:0]), .en(MAR_en), .op(MAR_BUS[7:0]));
    // *MAR register instantiated*
    //-- decoder1 --
    wire [15:0] decoder1_w;
    decoder4x16 decoder1(.a(MAR_BUS[0]), .b(MAR_BUS[1]), .c(MAR_BUS[2]), .d(MAR_BUS[3]), .op(decoder1_w[15:0]));
    //* decoder 1 *
    //-- decoder2 --
    wire [15:0] decoder2_w;
    decoder4x16 decoder2(.a(MAR_BUS[4]), .b(MAR_BUS[5]), .c(MAR_BUS[6]), .d(MAR_BUS[7]), .op(decoder2_w[15:0]));
    //* decoder 2 * 
    // --RAM cells 256 locations = 2048 cells --
     wire [2047:0] RAM_cell_op;
     genvar r,c,i;
     generate
        for(r=0;r<=15;r=r+1) begin
             for(c=0;c<=15;c=c+1) begin
                for(i=0;i<=7; i=i+1) begin
                      mem_DFF RAM_cell(.D(RAM_BUS[i]), .en_w1(decoder1_w[c]), .en_w2(decoder2_w[r]), .ST(ST), .MW(MW), .WR(WR), .Q(RAM_cell_op[(c*8)+(r*128)+i]));
                end
             end 
        end           
     endgenerate
    // *end of RAM cell instantiation*
    
    /*
    //*****-----****-----*******----------*********---------DFT-------***********-------*******------******----***
    wire [7:0] loc_;
    genvar ch;
    generate
      for(ch=0;ch<8;ch=ch+1) begin
        NOT ch1(.a(RAM_cell_op[ch]), .op(loc_[ch]));
        NOT ch2(.a(loc_[ch]), .op(loc0[ch]));
      end
    
    endgenerate
    
    
    genvar dft;
    generate
      for(dft=0;dft<8;dft=dft+1) begin
        mux256x1_0 ram_cell_test(.RAM_cell_op(RAM_cell_op[2047:0]), .MAR_BUS(MAR_BUS[7:0]), .bit(dft), .op(ram_cell_test_[dft]) );
      end
    
    endgenerate
    
    
    //*****-----****-----*******----------*********---------DFT-------***********-------*******------******----***
    */
    
    // -- Buffer --
     genvar R,C,I;
     generate
        for(R=0;R<=15;R=R+1) begin
             for(C=0;C<=15;C=C+1) begin
                for(I=0;I<=7; I=I+1) begin
                     mem_buf buffer(.a(RAM_cell_op[(C*8)+(R*128)+I]), .d1(decoder1_w[C]), .d2(decoder2_w[R]),  .RD(RD), .op(CPU_BUS[I]) );
                end
             end 
        end           
     endgenerate
    // * Buffer *
    
endmodule
