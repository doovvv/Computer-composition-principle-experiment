`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/30 19:36:01
// Design Name: 
// Module Name: display_7seg_tb
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

module display_7seg_tb;   
	reg CLK;
	reg SW_in;
	wire [10:0] display_out;
	
	display_7seg uu(
	.CLK(CLK),
	.SW_in(SW_in),     
    .display_out(display_out)
    );
    
    initial begin
    CLK=0;
    SW_in=0;
	#100;
    end
	
	parameter PERIOD=20;
	
	
	always begin
	CLK=0;
	#(PERIOD/2);
	CLK=1;
	#(PERIOD/2);
	end
	
	always begin
	SW_in=0;
	#(PERIOD*50);
	SW_in=1;
	#(PERIOD*50);
	end
	
endmodule 
