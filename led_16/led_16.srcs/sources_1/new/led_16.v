`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 19:56:31
// Design Name: 
// Module Name: led_16
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


module led_16(
    input  CLK,
    input  SW_in,
    input  reset,
    output reg[15:0] led
    );

        
        
    reg[15:0]current_state;
    reg check;
     reg [27:0] cnt ;//����һ��28λ�ļĴ���������������Ŀ��һ��仯һ�Σ�����Ҫ������50M����Ӧһ��28λ�Ķ�������
    wire add_cnt ;//������־λ
    wire end_cnt ;//���������־λ
   
    assign add_cnt = 1; 
    assign end_cnt = add_cnt && cnt== 50000000 - 1; //ֻ�е�cnt=50M-1ʱ��������ʱ���Ѿ���1Sʱ��end_cnt��Ϊ1
   
    /*---����������ʵ��---*/
    always @(posedge CLK)begin//��ʱ�������ػ��߸�λ�ź��½���ʱִ��
   
    if(reset)begin
       cnt <= 'd0;
    end//��⵽��λ�źţ�������ֵ����
   
    else if(add_cnt)begin//�����
        if(end_cnt)
        cnt <= 'd0;//������Ŀ��ֵʱ����
        else
        cnt <= cnt + 1'b1;//������һ����
       end
   end
    always@(posedge CLK )begin
        if(reset)begin
            led <= 16'b1000000000000000;
            check = 1'b1;
        end else if(SW_in && end_cnt) begin
                led <= check?led>>1: led>>1;
        end    else if(end_cnt) begin 
                led<= check? led<<1:led<<1;
         end else begin
            led<=led;
         end
        if(led == 16'b1000000000000000) begin
            check = 1'b1;
        end else if(led == 16'b0000000000000001)begin
            check = 1'b0;
        end
    end
endmodule
