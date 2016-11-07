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
	 output wire [7:0] seg,
	 output wire [3:0] an
    );
	 
	 
	 wire sel, adj, pause;
	 wire clk_1hz, clk_2hz, clk_fast, clk_blink;
	 
	 clock clock1(.clk(clk), .rst(rst),
		  .sel(sel), .adj(adj), .pause(pause),
        .clk_1hz(clk_1hz), .clk_2hz(clk_2hz), .clk_fast(clk_fast),
        .clk_blink(clk_blink));
		  
	 wire [3:0] minutes_top;
	 wire [3:0] minutes_bot;
	 wire [3:0] seconds_top;
	 wire [3:0] seconds_bot;
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
	 wire [7:0] seg_out;
	 wire [3:0] an_out;
	 seven_segment seg_min1(minutes_top, seg_min_top);
	 seven_segment seg_min0(minutes_bot, seg_min_bot);
	 seven_segment seg_sec1(seconds_top, seg_sec_top);
	 seven_segment seg_sec0(seconds_bot, seg_sec_bot);
	 display display1(.clk_fast(clk_fast), .clk_blink(clk_blink),
		.adj(adj), .sel(sel), .seg_min_top(seg_min_top), .seg_min_bot(seg_min_bot),
		.seg_sec_top(seg_sec_top), .seg_sec_bot(seg_sec_bot),
		.seg_out(seg_out), .an(an_out));
	 assign seg = seg_out;
	 assign an = an_out;

endmodule
