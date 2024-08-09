`timescale 1ns / 1ps


module END_STOP_INSTRUCTION(
  input [7:0] wiar,
  output clk_stop_end
    );
    wire negated;
    AND8inp_END m(.A(wiar[0]), .B(wiar[1]), .C(wiar[2]), .D(wiar[3]), .E(wiar[4]), .F(wiar[5]), .G(wiar[6]), .H(wiar[7]), .op(negated));
    NOT i(.a(negated), .op(clk_stop_end));
endmodule
