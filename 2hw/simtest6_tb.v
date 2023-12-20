module simtest_tb;

reg en;
reg [3:0] in;
wire [15:0] out;
integer i;

simtest simtest_DUT (en,in,out);

initial begin

en<=0;
in<=0;

for (i = 0; i<32; i = i+1) begin
	{en,in} = i;
	#10;
end

#10
$stop;

end

endmodule