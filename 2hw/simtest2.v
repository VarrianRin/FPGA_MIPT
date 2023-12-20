module simtest2 (
 input a, b,
output reg sum, cout
);

always @ ( a or b) begin
	{cout, sum} = a+b;
end

endmodule