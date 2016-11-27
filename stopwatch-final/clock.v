`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:09 09/28/2016 
// Design Name: 
// Module Name:    sequential 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock(clk, clk_1hz, clk_2hz, clk_fast, clk_blink, clk_1min
    );

    reg [26:0] a100 = 0;
    output reg clk_1hz = 0;
    output reg clk_2hz = 0;
    output reg clk_fast = 0;
    output reg clk_blink = 0;
    output reg clk_1min = 0;
    reg [5:0] cnt_1min = 0;
	input clk;


	
	always @ (posedge clk) begin
        a100 <= a100 + 1'b1;
        if (a100 % 'd12_500_000 == 0) begin
            clk_blink <= ~clk_blink;
        end
        if (a100 == 'd50_000_000) begin
            clk_1hz <= ~clk_1hz;
			clk_2hz <= ~clk_2hz;
            a100 <= 0;
            cnt_1min <= cnt_1min + 1;
            //if (cnt_1min == 'd60) begin
            if (cnt_1min == 'd5) begin
                cnt_1min <= 0;
                clk_1min <= ~clk_1min;
            end
        end
		  if (a100 == 'd25_000_000) begin
            clk_2hz <= ~clk_2hz;
            
        end
        if (a100 % 'd200_000 == 0) begin
            clk_fast <= ~clk_fast;
        end

    end

endmodule
