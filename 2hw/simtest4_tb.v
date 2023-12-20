module simtest4_tb;

reg a, b, sel;
wire c;
integer i;

simtest simtest_DUT (a,b,sel,c);

initial begin

a<=0;
b<=0;
sel<=0;

for (i = 0; i<8; i = i+1) begin
	{a,b,sel} = i;
	#10;
end

#10
$stop;

end

endmodule