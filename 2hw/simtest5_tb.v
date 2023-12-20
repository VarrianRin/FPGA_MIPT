module simtest5_tb;

reg f;
reg [1:0] sel;
wire a,b,c,d;
integer i;

simtest5 simtest_DUT (f,sel,a,b,c,d);

initial begin

f<=0;
sel<=0;

for (i = 0; i<8; i = i+1) begin
	{f,sel} = i;
	#10;
end

#10
$stop;

end

endmodule