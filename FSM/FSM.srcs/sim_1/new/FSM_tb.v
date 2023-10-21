`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 20:25:02
// Design Name: 
// Module Name: FSM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_tb;
    reg clk;
    reg in;
     wire vaild;
     reg [11:0]seq;
     reg [3:0]i;
    FSM f(
        .clk(clk),
        .in(in),
        .vaild(vaild)
    );
     initial begin
    clk=0;
    in = 0;
    i = 0;
    seq= 12'b1110110110111011;
    #100;
    end
    parameter PERIOD=20;
    always begin
    if(i == 11)begin
         i = 0;
      end
    clk=0;
    in = seq[i];
    i = i+1;
    #(PERIOD/2);
    clk=1;
    #(PERIOD/2);
    end
    

    
endmodule
