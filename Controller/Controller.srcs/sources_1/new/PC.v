`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/19 15:11:20
// Design Name: 
// Module Name: PC
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


module PC(
    input CLK,
    input rst,
    output reg [31:0]pc,
    output reg [31:0]inst_ce
    );
    wire [31:0] pc_in;
    //assign pc_in = 0;
    adder add(
        .CLK(CLK),
        .pc(pc),
        .pc_out(pc_in));    
        always@(posedge CLK)begin
        if(rst)begin
            pc = 32'b0;
            inst_ce =32'b0;
         end
        else begin
         pc = pc_in;
         inst_ce = pc_in;
        end
   end 
endmodule
