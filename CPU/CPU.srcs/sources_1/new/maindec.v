`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:21:30
// Design Name: 
// Module Name: maindec
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


module maindec(
	input wire[5:0] op,

	output reg memtoreg,memwrite,
	output reg branch,alusrc,
	output reg regdst,regwrite,
	output reg jump,
	output reg [1:0] aluop
    );
    always@(*)begin
    case(op)
        6'b000000:begin  regwrite = 1;
                   regdst = 1;
                   alusrc = 0;
                   branch = 0;
                   memwrite = 0;
                   memtoreg = 0;
                   jump = 0;
                   aluop = 2'b10;
                 end
        6'b100011:begin  regwrite =1;
                  regdst = 0;
                  alusrc = 1;
                  branch = 0;
                  memwrite = 0;
                  memtoreg = 1;
                  jump = 0;
                  aluop = 2'b00;
                 end
       6'b101011:begin  regwrite = 0;
                  alusrc = 1;
                  branch = 0;
                  memwrite = 1;
                  jump = 0;
                  aluop = 2'b00;
                 end
       6'b000100:begin  regwrite = 0;
                  alusrc = 0; 
                  branch = 1;
                  memwrite =0;
                  jump = 0;
                  aluop = 2'b01;
                 end
       6'b001000:begin  regwrite = 1;
                  regdst = 0;
                  alusrc = 1;
                  branch = 0;
                  memwrite = 0;
                  memtoreg = 0;
                  jump = 0;
                  aluop = 2'b00;
                 end
       6'b000010:begin  regwrite = 0;
                  memwrite = 0;
                  jump =1;
                 end
       endcase
       end            

	//add your code here according to lab 7
endmodule

