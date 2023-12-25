`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 19:16:46
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input [4:0]raddr1,
    output [31:0]rdata1,
    input [4:0]raddr2,
    output [31:0]rdata2,
    output [31:0]t0,
    input we,
    input [4:0]waddr,
    input [31:0]wdata
    );
    reg [31:0] rf[31:0];
    assign t0 = rf[0];
    always@(posedge clk) begin
    rf[1] = 32'b1;
    rf[2] = 32'b1;
     if(we) rf[waddr]<=wdata;
    end
    assign rdata1 = (raddr1 == 5'b0)?32'b0:rf[raddr1];
    assign rdata2 = (raddr2 == 5'b0)?32'b0:rf[raddr2];
endmodule
