`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 15:12:22
// Design Name: 
// Module Name: datapath
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


module datapath(
	input wire clk,rst,
	input wire memtoreg,pcsrc,
	input wire alusrc,regdst,
	input wire regwrite,jump,
	input wire[2:0] alucontrol,
	output wire overflow,zero,
	output wire[31:0] pc,
	input wire[31:0] instr,
	output wire[31:0] aluout,writedata,
	input wire[31:0] readdata,
	input wire[4:0]ra_debug,
	output wire[31:0]rd_debug
    );
    wire [31:0] inst_ce;
    wire [4:0]ra3;
    wire [31:0]SignImm;
    wire [31:0]rd1,rd2;
    wire [31:0] SrcA,SrcB;
    wire [31:0]ALUResult;
    wire [31:0] Result;
    wire [31:0]wd3;
    wire [31:0]tempimm;
    wire [31:0]PCBranch;
    wire [31:0] PC;
    wire [31:0]pc_temp;
    wire [31:0]pc_in;
    wire [31:0]PCPuls4;
    assign pc = PC;
    assign wd3 = Result;
    assign aluout = ALUResult; 
    assign writedata = rd2;
    assign SrcA = rd1;
    mux2 for_ra3(
        .d0(instr[20:16]),
        .d1(instr[15:11]),
        .s(regdst),
        .y(ra3));
    regfile reg_moudle(
        .clk(clk),
        .we3(regwrite),
        .ra1(instr[25:21]),
        .ra2(instr[20:16]),
        .wa3(ra3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2),
        .ra_debug(ra_debug),
        .rd_debug(rd_debug));
    signext sign_moudle(
            .a(instr[15:0]),
            .y(SignImm));
    mux2 for_SrcB(
    .d0(rd2),
    .d1(SignImm),
    .s(alusrc),
    .y(SrcB));
    alu alu_moudle(
        .a(SrcA),
        .b(SrcB),
        .op(alucontrol),
        .y(ALUResult),
        .overflow(overflow),
        .zero(zero)
        );
    mux2 for_wd3(
        .d0(ALUResult),
        .d1(readdata),
        .s(memtoreg),
        .y(Result));
	//add your code here
	sl2 for_tempimm(
	   .a(SignImm),
	   .y(tempimm));
	adder for_pc(
	   .a(tempimm),
	   .b(PCPuls4),
	   .y(PCBranch));
	mux2 for_pc_temp(
	   .d0(PCPuls4),
	   .d1(PCBranch),
	   .s(pcsrc),
	   .y(pc_temp));
	flopr pc_moudle(
	   .clk(clk),
	   .rst(rst),
	   .d(pc_in),
	   .q(PC));
	adder for_PCPuls4(
	   .a(PC),
	   .b(4),
	   .y(PCPuls4));
    mux2 for_pc_in(
        .d0(pc_temp),
        .d1({PCPuls4[31:28],instr[26:0],2'b00}),
        .s(jump),
        .y(pc_in));
endmodule
