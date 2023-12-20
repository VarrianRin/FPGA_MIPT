module simtest3_tb;

reg a, b, cin;
wire sum, cout;
integer i;

simtest simtest_DUT (a,b,cin,sum,cout);

initial begin

a<=0;
b<=0;
cin<=0;

for (i = 0; i<8; i = i+1) begin
	{a,b,cin} = i;
	#10;
end

#10
$stop;

end

endmodule