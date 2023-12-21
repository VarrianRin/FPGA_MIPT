`timescale 1ns / 1ns 
module mod10_counter_tb;

reg rstn, clk;
wire [3:0] out;



mod10_counter mod10_counter_DUT (.clk(clk), .rstn(rstn), .out(out));

always #5 clk = ~clk;

initial begin

#10
{rstn, clk} <= 0;

#10  rstn <= 1;	
#450 $stop;
	
end


endmodule