`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:43 11/02/2016 
// Design Name: 
// Module Name:    master_control 
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
module master_control(
    input clk, input sw, input rst,
	 output reg [7:0] seg,
	 output reg [3:0] an
    );
	 
	 
	 wire sel, adj, pause;
	 wire clk_1hz, clk_2hz, clk_fast, clk_blink;
	 
	 clock clock1(.clk(clk), .rst(rst),
		  .sel(sel), .adj(adj), .pause(pause),
        .clk_1hz(clk_1hz), .clk_2hz(clk_2hz), .clk_fast(clk_fast),
        .clk_blink(clk_blink));
		  
	 wire [3:0] minutes_top = 0;
	 wire [3:0] minutes_bot = 0;
	 wire [3:0] seconds_top = 0;
	 wire [3:0] seconds_bot = 0;
	 counter counter1(.clk_1hz(clk_1hz), .clk_2hz(clk_2hz),
		.clk_fast(clk_fast),
		.rst(rst),
		  .sel(sel), .adj(adj), .pause(pause),
		  .minutes_top_digit(minutes_top),
		  .minutes_bot_digit(minutes_bot),
		  .seconds_top_digit(seconds_top),
		  .seconds_bot_digit(seconds_bot));

	 wire [7:0] seg_min_top;
	 wire [7:0] seg_min_bot;
	 wire [7:0] seg_sec_top;
	 wire [7:0] seg_sec_bot;
	 seven_segment seg_min1(minutes_top, seg_min_top);
	 seven_segment seg_min0(minutes_bot, seg_min_bot);
	 seven_segment seg_sec1(seconds_top, seg_sec_top);
	 seven_segment seg_sec0(seconds_bot, seg_sec_bot);
		  
	 //controller control(.clk(clk), .clk_1hz(clk_1hz), .clk_2hz(clk_2hz),
		//.clk_fast(clk_fast), .clk_blink(clk_blink)

endmodule
