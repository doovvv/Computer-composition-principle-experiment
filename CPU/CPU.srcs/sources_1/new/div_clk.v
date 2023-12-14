`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 19:21:37
// Design Name: 
// Module Name: div_clk
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


module div_clk(
    input CLK,
    output reg clk
    );
    reg [19:0]count=0;
    parameter T1MS=50000;
    always@(posedge CLK)
        begin
            count<=count+1;
        if(count==T1MS)
            begin
                count<=0;
                clk = ~clk;
             end
        end
endmodule
