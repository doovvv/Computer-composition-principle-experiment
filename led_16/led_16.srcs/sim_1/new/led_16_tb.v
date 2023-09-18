`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 20:23:02
// Design Name: 
// Module Name: led_16_tb
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


module led_16_tb; 
	reg CLK;
	reg SW_in;
	reg reset;
	wire [15:0] led;
	
	led_16 uu(
	.CLK(CLK),
	.SW_in(SW_in),
	.reset(reset),     
    .led(led)
    );
    
    initial begin
    CLK=0;
    SW_in=0;
    reset=0;
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


