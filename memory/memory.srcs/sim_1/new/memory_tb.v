`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 19:18:50
// Design Name: 
// Module Name: memory_tb
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


module memory_tb;
    reg CLK;
    reg [7:0]sw;
    wire[10:0]display_out;
    memory m(
    .CLK(CLK),
    .sw(sw),
    .display_out(display_out)
    );
    initial begin
    CLK = 0;
    sw = 8'b00000000;
    #100;
    end
    parameter p = 20;
    always begin
    CLK = 0;
    #(p/2);
    CLK = 1;
    #(p/2);
    end
    

    
endmodule
