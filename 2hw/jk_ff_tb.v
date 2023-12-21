`timescale 1ns / 1ns 
module jk_ff_tb;

reg j, k, rstn, clk;

wire q;
integer i;

reg [2:0] dly;

always #5 clk = ~clk;

jk_ff jk_ff_DUT (.j(j), .k(k), .clk(clk), .rstn(rstn), .q(q));

initial begin

#10
{j, k, rstn, clk} <= 0;

#10 rstn <= 1;

for (i = 0; i < 10; i = i + 1) begin
	
	dly = $random;
	#(dly) j <= $random;
	#(dly) k <= $random;
	
end	
	
#20 $stop;
	
end


endmodule