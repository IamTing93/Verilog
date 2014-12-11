`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:52 12/11/2014 
// Design Name: 
// Module Name:    clk_div3 
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
module clk_div3(clk, rst, clkout, div1, div2);
input clk, rst;
output clkout;
reg [1:0] counter;
output reg div1, div2;

always @ (posedge clk)
begin
	if (rst)
		counter <= 2'b00;
	else 
		case (counter)
			2'b00: counter <= 2'b01;
			2'b01: counter <= 2'b10;
			2'b10: counter <= 2'b00;
			default: counter <= 2'b00;
		endcase
end

always @ (posedge rst or posedge clk)
begin
	if (rst)
		div1 <= 1'b1;
	else if (counter == 2'b00)
		div1 <= ~div1;
	else ;
end

always @ (posedge rst or negedge clk)
begin
	if (rst)
		div2 <= 1'b1;
	else if (counter == 2'b10)
		div2 <= ~div2;
	else ;
end

assign clkout = div1 ^ div2; 

endmodule
