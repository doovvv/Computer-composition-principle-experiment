`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/19 15:39:56
// Design Name: 
// Module Name: adder
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


module adder(
    input CLK,
    input [31:0]pc,
    output [31:0]pc_out
    );
    reg [31:0] temp;
    always@(posedge CLK)begin
        temp = pc;
        temp = temp+4;
    end
    assign pc_out = temp;
endmodule
