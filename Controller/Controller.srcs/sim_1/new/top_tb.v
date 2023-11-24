`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/19 15:48:14
// Design Name: 
// Module Name: top_tb
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


module top_tb;
    reg clk;
    reg rst;
    wire [6:0] seg;
    wire [3:0] ans;
    top t(
        .clk(clk),
        .rst(rst),
        .seg(seg),
        .an(ans));
 initial begin
clk = 0;
rst = 1;
#10000;
rst =0;
end
always begin
#100000;
clk = 0;
#100000;
clk = 1;
end


endmodule
