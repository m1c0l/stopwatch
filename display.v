`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:49 11/06/2016 
// Design Name: 
// Module Name:    display 
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
module display(
	input clk_fast,
	input clk_blink,
	input adj,
	input sel,
	input [7:0] seg_min_top,
	input [7:0] seg_min_bot,
	input [7:0] seg_sec_top,
	input [7:0] seg_sec_bot,
	output reg [7:0] seg_out,
	output reg [4:0] an
    );
	
	initial seg_out <= 0;
	initial an <= 0;
	reg [1:0] display_counter = 0;
	always @(posedge clk_fast)
	begin
		case (display_counter)
			0: begin
				seg_out <= seg_min_top;
			end
			1: begin
				seg_out <= seg_min_bot;
			end
			'b10: begin
				seg_out <= seg_sec_top;
			end
			'b11: begin
				seg_out <= seg_sec_bot;
			end
		endcase
		an <= ~(1'b1 << display_counter);
		display_counter <= display_counter + 1;
	end

endmodule
