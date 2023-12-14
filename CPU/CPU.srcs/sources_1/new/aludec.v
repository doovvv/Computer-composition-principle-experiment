`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:27:24
// Design Name: 
// Module Name: aludec
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


module aludec(
	input wire[5:0] funct,
	input wire[1:0] aluop,
	output reg[2:0] alucontrol
    );
	always@(*)begin
	 case(aluop)
	   2'b00:alucontrol = 3'b010;
	   2'b01:alucontrol = 3'b110;
	   2'b10:begin
	       case(funct)
	           6'b100000:alucontrol = 3'b010;
	           6'b100010:alucontrol = 3'b110;
	           6'b100100:alucontrol = 3'b000;
	           6'b100101:alucontrol = 3'b001;
	           6'b101010:alucontrol = 3'b111;
	           6'b000100:alucontrol = 3'b011;
	           6'b000110:alucontrol = 3'b100;
	       endcase
	       end
	  endcase
	end
endmodule
