module simtest_tb;

reg a,b,c,d;
wire out;

simtest simtest_DUT (a,b,c,d,out);

initial begin

#5
a = 0;
b = 0;
c = 0;
d = 0;
#5
a = 1;
b = 0;
c = 0;
d = 0;
#5
a = 0;
b = 1;
c = 0;
d = 0;
#5
a = 1;
b = 1;
c = 0;
d = 0;
#5
a = 0;
b = 0;
c = 1;
d = 0;
#5
a = 1;
b = 0;
c = 1;
d = 0;
#5
a = 0;
b = 1;
c = 1;
d = 0;
#5
a = 1;
b = 1;
c = 1;
d = 0;
#5
a = 0;
b = 0;
c = 0;
d = 1;

#10
$stop;

end

endmodule