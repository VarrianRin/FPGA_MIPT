module simtest1_tb;

reg a,b,c,d,e;
wire out;
integer i;

simtest simtest_DUT (a,b,c,d,e,out);

initial begin

a<=0;
b<=0;
c<=0;
d<=0;
e<=0;

for (i = 0; i<32; i = i+1) begin
	{a,b,c,d,e} = i;
	#10;
end

#10
$stop;

end

endmodule