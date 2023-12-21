module mux7to1(a, b, c, d, e, f, g, addr, out);
	
	input a, b, c, d, e, f, g;		
	input	[2:0] addr;
	
	output out;
	
	wire [6:0] in_vec = {g, f, e, d, c, b, a};

	assign out = in_vec[addr];

endmodule 