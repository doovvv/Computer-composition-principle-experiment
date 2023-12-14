`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/07 13:50:53
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
	input wire CLK,rst,
	input [3:0]ra_debug_4_button,
	input [15:0] sw,
	output [3:0] an,
	output [6:0] seg
    );
    wire clk;
    div_clk div_clk_moudle(
        .CLK(CLK),
        .clk(clk));
	wire[31:0] pc,instr,readdata,writedata,dataadr,readdata_mem;
	reg[31:0] temp;
	wire memwrite;
	wire [31:0] rd_debug;
	wire[4:0]ra_debug;
	assign ra_debug = {1'b0,ra_debug_4_button};
	mips mips(clk,rst,pc,instr,memwrite,dataadr,writedata,readdata,ra_debug,rd_debug);
    //create imem and dmem by yourself
	inst_mem imem(clk,pc/4,instr); 
	data_mem dmem(~clk,memwrite,dataadr[7:0],writedata,readdata_mem);
	assign readdata = (dataadr[14] == 0)?readdata_mem:{16'b0,sw};
	display U2(.clk(CLK),.reset(rst),.s(rd_debug[15:0]),.ans(an),.seg(seg));
endmodule
