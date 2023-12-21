# 2 задание

# • Verilog always block

## 1 Исследуемый модуль:
example1.v
```verilog
module example1 (input       d,
                           clk,
                          rstn,
                 output reg  q);

always @(posedge clk or negedge rstn) begin
    if (!rstn)
        q <= 0;
    else
        if(d)
            q <= ~q;
        else
            q <= q;

end

endmodule
```


### Результаты синтеза:
![Screenshot_9](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/2b674f56-9e88-4be8-a82b-d81cb19ddbe9)



## 2 Исследуемый модуль:
combo.v
```verilog
module combo(input      a,
             input      b,
             input      c,
             input      d,
             output reg o);

always @ (a or b or c or d) begin
    
    o <= ~((a & b) | (c ^ d));
end

endmodule
```

### Testbench:
combo_tb.v
```verilog
`timescale 1ns / 1ns 
module combo_tb;

reg a, b, c, d;
wire o;

combo combo_DUT (.a(a), .b(b), .c(c), .d(d), .o(o));

initial begin

#10
a = 0; b = 0; c = 0; d = 0;

#10
a = 1; b = 0; c = 0; d = 0;

#10
a = 0; b = 1; c = 0; d = 0;

#10
a = 1; b = 1; c = 0; d = 0;

#10
a = 0; b = 0; c = 1; d = 0;

#10
a = 1; b = 0; c = 1; d = 0;

#10
a = 0; b = 1; c = 1; d = 0;

#10
a = 1; b = 1; c = 1; d = 0;

#10
a = 0; b = 0; c = 0; d = 1;

#10
a = 1; b = 0; c = 0; d = 1;

#10
a = 0; b = 1; c = 0; d = 1;

#10
a = 1; b = 1; c = 0; d = 1;

#10
a = 0; b = 0; c = 1; d = 1;

#10
a = 1; b = 0; c = 1; d = 1;

#10
a = 0; b = 1; c = 1; d = 1;

#10
a = 1; b = 1; c = 1; d = 1;

#10
$stop;

end

endmodule
```

### Результаты синтеза:
![Screenshot_10](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/0d36bc2b-247b-43c2-b009-25db05065c91)


### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/6719db45-55f0-407e-b604-e41a41192ab2)


# • Combination Logic with always

## 1 Исследуемый модуль:
combo2.v
```verilog
module combo2 (input a, b, c, d, e, 
					output reg z);
					
always @ (a or b or c or d or e) begin

	z = ((a & b) | (c ^ d) & ~e);
	
end

endmodule	
```

### Testbench:
combo2_tb.v
```verilog
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
```

### Результаты синтеза:
![Screenshot_11](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/79e4b6c9-d7b3-407f-b25e-e62f99dde8e6)


### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/3ebde55c-563a-4cd1-9250-a8e3c18e2dc4)


## 2 Исследуемый модуль:
ha.v
```verilog
module ha (input a, b,
			  output reg sum, cout);
			  
always @ (a or b) begin
	
	{cout, sum} = a + b;

end

endmodule	
			  
```

### Testbench:
ha_tb.v
```verilog
`timescale 1ns / 1ns 
module ha_tb;

reg a, b;
wire sum, cout;
integer i;

ha ha_DUT (.a(a), .b(b), .sum(sum), .cout(cout));

initial begin

#10
a <= 0; b <= 0;

for (i = 0; i < 4; i = i + 1) begin
	
	{a, b} = i;
	#10;
	
end

$stop;

end

endmodule
```

### Результаты синтеза:
![Screenshot_12](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/ea4f4ca6-b32b-468c-81eb-b5d9796e4d5e)



### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/9c612081-9c32-416d-bc0c-5d4493cf9317)


## 3 Исследуемый модуль:
fa.v
```verilog
module fa (input a, b, cin,
			  output reg sum, cout);
			  
always @ (a or b or cin) begin
	
	{cout, sum} = a + b + cin;

end

endmodule	
			  
```

### Testbench:
fa_tb.v
```verilog
`timescale 1ns / 1ns 
module fa_tb;

reg a, b, cin;
wire sum, cout;
integer i;

fa fa_DUT (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

initial begin

#10
a <= 0; b <= 0;

for (i = 0; i < 8; i = i + 1) begin
	
	{a, b, cin} = i;
	#10;
	
end

$stop;

end

endmodule
```

### Результаты синтеза:
![Screenshot_13](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/d3838b7b-e67d-4e92-80d9-f4a92a3d1669)



### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/647c6ffe-cd41-4220-9d47-0038a66ff6b3)



## 4 Исследуемый модуль:
mux_2x1.v
```verilog
module mux_2x1 (input a, b, sel,
					 output reg c);
			  
always @ (a or b or sel) begin
	
	c = sel ? a : b;

end

endmodule	
			  
```

### Testbench:
mux_2x1_tb.v
```verilog
`timescale 1ns / 1ns 
module mux_2x1_tb;

reg a, b, sel;
wire c;
integer i;

mux_2x1 mux_2x1_DUT (.a(a), .b(b), .sel(sel), .c(c));

initial begin

#10
a <= 0; b <= 0; sel <= 0;

for (i = 0; i < 3; i = i + 1) begin
	
	{a, b, sel} = i;
	#10;
	
end

$stop;

end

endmodule
```

### Результаты синтеза:
![Screenshot_14](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/b1b9cf93-743a-4de6-b3e8-e0509531a8cb)


### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/cb202a90-1212-434d-937d-10e40080baeb)


## 5 Исследуемый модуль:
demux_1x4.v
```verilog
module demux_1x4 (input f,
						input [1:0] sel,
						
						output reg a, b, c, d);
			  
always @ (f or sel) begin
	
	a = f & ~sel[1] & ~sel[0];
	b = f &  sel[1] & ~sel[0];
	c = f & ~sel[1] &  sel[0];
	d = f &  sel[1] &  sel[0];

end

endmodule	
			  
```

### Testbench:
demux_1x4_tb.v
```verilog
`timescale 1ns / 1ns 
module demux_1x4_tb;

reg f;
reg [1:0] sel;
wire a, b, c, d;
integer i;

demux_1x4 demux_1x4_DUT (.f(f), .sel(sel), .a(a), .b(b), .c(c), .d(d));

initial begin

#10
f <= 0; sel <= 0;

for (i = 0; i < 8; i = i + 1) begin
	
	{f, sel} = i;
	#10;
	
end

$stop;

end

endmodule
```

### Результаты синтеза:
![Screenshot_15](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/a2c19dbb-805a-4e70-a40c-7fe5b2854408)


### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/b002d230-07ce-4587-9d36-037993a6ef4d)



## 6 Исследуемый модуль:
dec_3x8.v
```verilog
module dec_3x8 (input en,
					 input [3:0] in,
					 
					 output reg[15:0] out);
			  
always @ (en or in) begin
	
	out = en ? 1 << in:0;

end

endmodule	
			  
```

### Testbench:
dec_3x8_tb.v
```verilog
`timescale 1ns / 1ns 
module dec_3x8_tb;

reg en;
reg [3:0] in;

wire [15:0] out;
integer i;

dec_3x8 dec_3x8_DUT (.en(en), .in(in), .out(out));

initial begin

#10
en <= 0; in <= 0;

for (i = 0; i < 32; i = i + 1) begin
	
	{en, in} = i;
	#10;

end

$stop;

end

endmodule
```

### Результаты синтеза:
![Screenshot_16](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/f74160d5-7d11-4c39-b346-f7a296f22f67)



### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/d9461918-bf77-418f-a8b2-46fed6b21ca4)


# • Sequential Logic with always

## 1 Исследуемый модуль:
jk_ff.v
```verilog
module jk_ff	  (input j,
						input k,
						input rstn,
						input clk,
						
						output reg q);
			  
always @ (posedge clk or negedge rstn) begin
	
	if (!rstn) begin
		
		q <= 0;
		
	end else begin
	
		q <= (j & ~q) | (~k & q);
		
	end

end

endmodule	
			  
```

### Testbench:
jk_ff_tb.v
```verilog
`timescale 1ns / 1ns 
module jk_ff_tb;

reg j, k, rstn, clk;

wire q;
integer i;

reg [2:0] dly;

always #5 clk = ~clk;

jk_ff jk_ff_DUT (.j(j), .k(k), .clk(clk), .rstn(rstn), .q(q));

initial begin

#10
{j, k, rstn, clk} <= 0;

#10 rstn <= 1;

for (i = 0; i < 10; i = i + 1) begin
	
	dly = $random;
	#(dly) j <= $random;
	#(dly) k <= $random;
	
end	
	
#20 $stop;
	
end


endmodule
```

### Результаты синтеза:
![Screenshot_17](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/dc4bccbc-e8b2-41b9-bf1e-39b92236d73c)



### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/e6eff41d-91d6-43a1-a40c-d215a90929b1)



## 2 Исследуемый модуль:
mod10_counter.v
```verilog
module mod10_counter  (input clk,
							  input rstn,
						
							  output reg[3:0] out);
			  
always @ (posedge clk) begin
	
	if (!rstn) begin
		
		out <= 0;
		
	end else begin
	
		if (out == 10)
			out <= 0;
		else
			out <= out + 1;
		
	end

end

endmodule	
			  
```

### Testbench:
mod10_counter_tb.v
```verilog
`timescale 1ns / 1ns 
module mod10_counter_tb;

reg rstn, clk;
wire [3:0] out;



mod10_counter mod10_counter_DUT (.clk(clk), .rstn(rstn), .out(out));

always #5 clk = ~clk;

initial begin

#10
{rstn, clk} <= 0;

#10  rstn <= 1;	
#450 $stop;
	
end


endmodule
```

### Результаты синтеза:
![Screenshot_18](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/06c19835-1543-49f2-9f6b-d64a4394dba4)


### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/2ded8370-210d-426a-be53-c23e8f2e30f8)


## 3 Исследуемый модуль:
lshift_4b_reg.v
```verilog
module lshift_4b_reg	  (input d,
								input clk,
								input rstn,
						
								output reg [3:0] out);
			  
always @ (posedge clk) begin
	
	if (!rstn) begin
		
		out <= 0;
		
	end else begin
	
		out <= {out[2:0], d};
		
	end

end

endmodule	
			  
```

### Testbench:
lshift_4b_reg_tb.v
```verilog
`timescale 1ns / 1ns 
module lshift_4b_reg_tb;

reg d, rstn, clk;

wire [3:0] out;
integer i;

reg [2:0] dly;



lshift_4b_reg lshift_4b_reg_DUT (.d(d), .clk(clk), .rstn(rstn), .out(out));

always #5 clk = ~clk;

initial begin

#10
{d, rstn, clk} <= 0;

#10 rstn <= 1;


for (i = 0; i < 20; i = i + 1) begin
	
	@(posedge clk) d <= $random;
	
end	
	
#10 $stop;
	
end

endmodule
```

### Результаты синтеза:
![Screenshot_19](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/4d382709-9a6c-4f18-a116-48d889b9bf90)



### Результаты симуляции:
![image](https://github.com/VarrianRin/Verilog_MIPT/assets/55803852/1d397902-573f-4548-b219-064445b3551e)

