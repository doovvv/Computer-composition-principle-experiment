`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/16 16:01:18
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk,
    output wire  CLK
    

    );
    reg temp = 0;
    reg [31:0]count = 0;
    always@(posedge clk)begin
        count = count+1;
        if(count == 100000000)begin
            temp <= ~temp;
            count = 0;
        end
    end
    assign CLK = temp;
    
endmodule
