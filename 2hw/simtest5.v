module simtest5 (
 input f,
 input [0:10] sel,
output reg a,b,c,d
);

always @ ( f or sel ) begin
	a =f &~sel[1] & ~sel[0];
	b =f & sel[1] & ~sel[0];
	c =f & ~sel[1] & sel[0];
	d =f & sel[1] & sel[0];
end

endmodule