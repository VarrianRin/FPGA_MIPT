`timescale 1ns / 1ns 
module mux7to1_tb;

reg a, b, c, d, e, f, g;
reg [2:0] addr;
wire out;

mux7to1 mux7to1_DUT (.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .addr(addr), .out(out));

initial begin

#10
a = 0; b = 1; c = 0; d = 1; e = 0; f = 1; g = 0;
#5
addr = 0;

#10
a = 1; b = 1; c = 1; d = 1; e = 0; f = 1; g = 0;
#5
addr = 1;

#10
a = 0; b = 0; c = 1; d = 1; e = 1; f = 1; g = 0;
#5
addr = 2;

#10
a = 1; b = 0; c = 1; d = 0; e = 1; f = 0; g = 1;
#5
addr = 3;

#10
a = 1; b = 1; c = 1; d = 0; e = 1; f = 1; g = 1;
#5
addr = 4;

#10
a = 0; b = 1; c = 1; d = 0; e = 0; f = 1; g = 1;
#5
addr = 5;

#10
a = 0; b = 1; c = 1; d = 0; e = 1; f = 0; g = 1;
#5
addr = 6;

#10
a = 0; b = 1; c = 1; d = 0; e = 0; f = 0; g = 1;
#5
addr = 7;

#10
$stop;

end

endmodule