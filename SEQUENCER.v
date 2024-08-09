`timescale 1ns / 1ps

module SEQUENCER(
    input dummy_clk,FPGA_inp_zero,
    output seq1,
    output seq2,
    output seq3,
    output seq4,
    output seq5,
    output seq6
    );
    wire wdummy_clk, neg, pos, seq;
    NOT n(.a(dummy_clk), .op(wdummy_clk));
    OR o1(.a(seq_reset), .b(wdummy_clk), .op(neg));
    OR o2(.a(seq_reset), .b(dummy_clk), .op(pos));
    NOT n1(.a(seq_reset), .op(seq));
    //D1
    wire wd1, wseq2bar;
    reg_DFF d1(.D(seq), .en(pos), .Q(wd1));
    reg_DFF d1_(.D(wd1), .en(neg), .Q(wseq2));
    NOT n2(.a(wseq2), .op(wseq2bar));
    //D2
      wire wd2, wseq3bar;
    reg_DFF d2(.D(wseq2), .en(pos), .Q(wd2));
    reg_DFF d2_(.D(wd2), .en(neg), .Q(wseq3));
    NOT n3(.a(wseq3), .op(wseq3bar));
    //D3
      wire wd3, wseq4bar;
    reg_DFF d3(.D(wseq3), .en(pos), .Q(wd3));
    reg_DFF d3_(.D(wd3), .en(neg), .Q(wseq4));
    NOT n4(.a(wseq4), .op(wseq4bar));
    //D4
      wire wd4, wseq5bar;
    reg_DFF d4(.D(wseq4), .en(pos), .Q(wd4));
    reg_DFF d4_(.D(wd4), .en(neg), .Q(wseq5));  
    NOT n5(.a(wseq5), .op(wseq5bar));
    //D5
      wire wd5, wseq6bar;
    reg_DFF d5(.D(wseq5), .en(pos), .Q(wd5));
    reg_DFF d5_(.D(wd5), .en(neg), .Q(wseq6));  
    NOT n6(.a(wseq6), .op(wseq6bar));
    //D6
      wire wd6, seq_resetbar, wseq_reset;
    reg_DFF d6(.D(wseq6), .en(pos), .Q(wd6));
    reg_DFF d6_(.D(wd6), .en(neg), .Q(wseq_reset));
    OR p(.a(wseq_reset), .b(FPGA_inp_zero), .op(seq_reset));
    NOT n7(.a(seq_reset), .op(seq_resetbar));
    
   
    //---------************-------------****************---------
    //                   DELAY
    
    wire dwseq2,dwseq3,dwseq4,dwseq5,dwseq6;
    // parameter delay=50;
    
    delay_NOT dd(.wseq2(wseq2), .wseq3(wseq3), .wseq4(wseq4), .wseq5(wseq5), .wseq6(wseq6), .dwseq2(dwseq2), .dwseq3(dwseq3), .dwseq4(dwseq4), .dwseq5(dwseq5), .dwseq6(dwseq6));
   
    
    //--------********___-----------*************-----------
    
   
    
    
    //SEQ 1,2,3,4,5,6
    OR s1(.a(seq_reset), .b(wseq2bar), .op(seq1));
    AND s2(.a(dwseq2), .b(wseq3bar), .op(seq2));
    AND s3(.a(dwseq3), .b(wseq4bar), .op(seq3));
    AND s4(.a(dwseq4), .b(wseq5bar), .op(seq4));
    AND s5(.a(dwseq5), .b(wseq6bar), .op(seq5));
    AND s6(.a(dwseq6), .b(seq_resetbar), .op(seq6));
    
endmodule
