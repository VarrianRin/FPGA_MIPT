module simtest3 (
 input a, b, cin,
output reg sum, cout
);

always @ ( a or b) begin
	{cout, sum} = a+b+cin;
end

endmodule