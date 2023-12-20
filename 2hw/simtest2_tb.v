module simtest_tb;

reg a,b;
wire sum, cout;
integer i;

simtest simtest_DUT (a,b,sum,cout);

initial begin

a<=0;
b<=0;

for (i = 0; i<4; i = i+1) begin
	{a,b} = i;
	#10;
end

#10
$stop;

end

endmodule