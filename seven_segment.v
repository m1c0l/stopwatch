`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:43 10/31/2016 
// Design Name: 
// Module Name:    seven_segment 
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
module seven_segment(
        //input minute_top_digit,
        //input minute_bot_digit,
        //input second_top_digit,
        //input second_bot_digit,
		  digit,
        //input [3:0] an,
        //is_blinking,
        //clk_blink,
        seg
    );
    
    input [3:0] digit;
    output [7:0] seg;
    
    reg [7:0] segment_array = 0;
    
    always @(*) begin
        /*case (an)
            'b1: digit = second_bot_digit;
            'b10: digit = second_top_digit;
            'b100: digit = minute_bot_digit;
            'b1000: digit = minute_top_digit;
        endcase*/
        // 8'bDP_CG_CF_CE_CD_CC_CB_CA
        case (digit)
            'd0: segment_array = 8'b1100_0000;
            'd1: segment_array = 8'b1111_1001;
            'd2: segment_array = 8'b1010_0100;
            'd3: segment_array = 8'b1011_0000;
            'd4: segment_array = 8'b1001_1001;
            'd5: segment_array = 8'b1001_0010;
            'd6: segment_array = 8'b1000_0010;
            'd7: segment_array = 8'b1111_1000;
            'd8: segment_array = 8'b1000_0000;
            'd9: segment_array = 8'b1001_0000;
        endcase
        
    end
	 assign seg = segment_array;
endmodule
