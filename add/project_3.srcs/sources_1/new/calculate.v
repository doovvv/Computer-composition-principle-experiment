`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 19:36:39
// Design Name: 
// Module Name: calculate
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


module calculate(
    input [7:0]A,
    input [7:0]B,
    input clk,
    input reset,
    output wire[10:0]display_out,
    output wire overflow
    );
    //wire [10:0]display_1;
    wire [8:0]sum;
   // wire overflow_1;
   assign sum = A+B;
   display d(.sum(sum),
             .clk(clk),
             .reset(reset),
             .display_out(display_out),
             .overflow(overflow) );
    //assign display_out = display_1;
    //assign overflow = overflow_1;
endmodule
