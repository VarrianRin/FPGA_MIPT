module simtest4 (
 input a, b,sel,
output reg c
);

always @ ( a or b or sel) begin
	c=selab;
end

endmodule