`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/09/25 10:35:04
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    input [2:0] op,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    //input [7:0] num1
    input MemtoReg,
    output [31:0]t0,
    output [3:0] ans, //select for seg
    output [6:0] seg  //segment digital
    );
    wire [31:0] num1;
    wire [31:0] num2;
    reg we = 1'b1;
    wire [31:0] s;
    wire[31:0] busW=(MemtoReg==1)? 32'b1: s;
    regfile r(.clk(clk),
        .raddr1(raddr1),
        .rdata1(num1),
        .raddr2(raddr2),
        .rdata2(num2),
        .t0(t0),
        .we(we),
        .waddr(waddr),
        .wdata(busW)
        );
    calculate U1(.Sign_extend(num1),.num2(num2),.op(op),.result(s));
    
    //display U2(.clk(clk),.reset(rst),.s(s),.ans(ans),.seg(seg));
endmodule
