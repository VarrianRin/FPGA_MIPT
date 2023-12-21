`timescale 1ns / 1ns 
module combo2_tb;

reg a, b, c, d, e;
wire z;
integer i;

combo2 combo2_DUT (.a(a), .b(b), .c(c), .d(d), .e(e), .z(z));

initial begin

#10
a <= 0; b <= 0; c <= 0; d <= 0; e <= 0;

for (i = 0; i < 32; i = i + 1) begin
	
	{a, b, c, d, e} = i;
	#10;
	
end

$stop;

end

endmodule