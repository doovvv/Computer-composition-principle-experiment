`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/16 15:53:00
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
    output memtoreg,memwrite,
    output pcsrc,alusrc,
    output regdst,regwrite,
    output jump,
    output branch,
    output [2:0]alucontrol,
    output [3:0]an,
    output [6:0]seg
    );
    wire CLK;
    wire [31:0]pc;
    wire [31:0]inst_ce;
    wire [31:0] temp = 32'b0;
    wire [31:0]inst;
    Ins_Rom your_instance_name (
      .clka(CLK),    // input wire clka
      .addra(inst_ce[7:0] / 4),  // input wire [7 : 0] addra
      .douta(inst)  // output wire [31 : 0] douta
    );
    PC p(
        .CLK(CLK),
        .rst(rst),
        .pc(pc),
        .inst_ce(inst_ce)
        );
    clk_div div(
        .clk(clk),
        .CLK(CLK));
     display disp(
        .clk(clk),
        .reset(rst),
        .s(inst),
        .seg(seg),
        .ans(an)
        );
        wire zero = 1;
     controller(
        .op(inst[31:26]),
        .funct(inst[5:0]),
        .zero(zero),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol)
        );
     
endmodule
