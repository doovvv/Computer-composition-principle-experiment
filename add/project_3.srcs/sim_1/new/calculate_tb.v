`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 02:09:54
// Design Name: 
// Module Name: add_tb
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


module calculate_tb;
    reg [7:0] A;
    reg [7:0] B;
    reg clk;
    reg reset;
    wire  [10:0] display_out;
    wire  overflow;
    calculate uu(
    
        .A(A),
        .B(B),
        .clk(clk),
        .reset(reset),
        .display_out(display_out),
        .overflow(overflow)

    );
    initial begin
    clk=0;
    A=2;
    B=3;
    reset  = 1;
    #100;
    end
    parameter PERIOD=20;
    
    
    always begin
    clk=0;
    #(PERIOD/2);
    clk=1;
    #(PERIOD/2);
    end
    /*always begin
     #(PERIOD*50);
        A = A+1;
        if(A ==4'b1111)begin
        #(PERIOD*50);
        A=0;
        end
        end
   always begin
       #(PERIOD*50);
       B = B+1;
       if(B ==4'b1111)begin
        #(PERIOD*50);
        B=0;
        end
    end*/
     
endmodule
