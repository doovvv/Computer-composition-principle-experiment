`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 19:59:43
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
        reg clk;
reg rst;
reg [2:0] op;
reg [4:0] raddr1;
reg [4:0] raddr2;
reg [4:0] waddr;
//input [7:0] num1,
reg MemtoReg;
wire [31:0] t0;
wire [3:0] ans; //select for seg
wire [6:0] seg;  //segment digital
    top t(.clk(clk),
        .rst(rst),
        .op(op),
        .raddr1(raddr1),
        .raddr2(raddr2),
        .waddr(waddr),
        .MemtoReg(MemtoReg),
        .t0(t0),
        .ans(ans),
        .seg(seg)
        );
 initial begin
 clk = 0;
 rst = 1;
 op = 0;
 raddr1 = 1;
 raddr2 = 2;
 waddr = 0;
 MemtoReg = 0;
 end
 always begin
 clk = 0;
 #10;
 clk = 1;
 #10;
 end
 always begin
 MemtoReg = 0;
 #20;
 MemtoReg = 1;
 #20;
 end
endmodule
