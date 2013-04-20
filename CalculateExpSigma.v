`timescale 1ns / 1ps

module CalculateExpSigma(
	CLK,
	iSigma,
	iStart,
	oData,
	oAddr,
	oValid,
	oDone
	);
	
parameter x_min = -307;
parameter x_max = 280;
parameter pathWidth = 10;

input								CLK;
input		[17:0]				iSigma;		// 18 Fraction bits
input								iStart;

output	[17:0]				oData;
output	[pathWidth-1:0]	oAddr;
output							oValid;
output							oDone;

wire								enable;

reg	signed	[pathWidth-1:0]	x;				// Current input evaluated. Signed, 8 int, 2 fract
reg	signed	[pathWidth-1:0]	x_next;	
reg	signed	[pathWidth-1:0]	x_d1;
reg	signed	[pathWidth-1:0]	x_d2;
reg	signed	[pathWidth-1:0]	x_d3;
reg	signed	[pathWidth-1:0]	x_d4;
reg	signed	[pathWidth-1:0]	x_d5;
reg	signed	[pathWidth-1:0]	x_d6;
reg	signed	[pathWidth-1:0]	x_d7;
reg	signed	[pathWidth-1:0]	x_d8;
reg	signed	[pathWidth-1:0]	x_d9;
reg	signed	[pathWidth-1:0]	x_d10;
reg	signed	[pathWidth-1:0]	x_d11;

wire 	signed	[20:0]				xsigma;		// (x * sigma). Signed, 3 int, 18 fract
reg 	signed	[20:0]				xsigma_shift;	// (x * sigma) + 2. Unsigned, 3 int, 18 fract

wire		[17:0]				xsigma_f;	// fraction part of xsigma+2. 18 fract
wire		[2:0]					xsigma_i;	// integer part of xsigma+2. 3 int bits.

wire		[21:0]				exp_frac;	// exponent of the fractional part. 4 int, 18 fract
wire		[12:0]				exp_int;		// exponent of the integer part. 3 int, 10 fract
reg		[12:0]				exp_int_d1;
reg		[12:0]				exp_int_d2;

wire		[17:0]				exp_xsigma;	// the result of multiplying frac and int. 3 int, 15 frac

reg								valid;
reg								done;

initial
begin
	x <= 0;
	x_next <= 0;
	x_d1 <= 0;
	x_d2 <= 0;
	x_d3 <= 0;
	x_d4 <= 0;
	x_d5 <= 0;
	x_d6 <= 0;
	x_d7 <= 0;
	x_d8 <= 0;
	x_d9 <= 0;
	x_d10 <= 0;
	xsigma_shift <= 0;
	exp_int_d1 <= 0;
	exp_int_d2 <= 0;
	valid <= 0;
	done <= 0;
end

always @ (posedge CLK)
begin
	if (enable) begin
		x <= x_next;
		x_next <= x_d1 + 1;
		x_d1 <= x;
		x_d2 <= x_d1;
		x_d3 <= x_d2;
		x_d4 <= x_d3;
		x_d5 <= x_d4;
		x_d6 <= x_d5;
		x_d7 <= x_d6;
		x_d8 <= x_d7;
		x_d9 <= x_d8;
		x_d10 <= x_d9;
		
		xsigma_shift <= xsigma + 2**19;
			
		exp_int_d1 <= exp_int;
		exp_int_d2 <= exp_int_d1;
		
		if (x_d10 == x_max) begin 
			done <= 1;
			valid <= 0;
		end
		else
		begin
			if (done == 1)
				done <= 0;
			if (x_d7 == x_min)
				valid <= 1;
		end		
		
	end
	else begin
		x <= x_min;
		x_d1 <= x_min-1;
		x_next <= x_min;
		x_d2 <= x_min-1;
		x_d3 <= x_min-1;
		x_d4 <= x_min-1;
		x_d5 <= x_min-1;
		x_d6 <= x_min-1;
		x_d7 <= x_min-1;
		x_d8 <= x_min-1;
		x_d9 <= x_min-1;
		x_d10 <= x_min-1;
		xsigma_shift <= 0;
		exp_int_d1 <= 0;
		exp_int_d2 <= 0;
		done <= 0;
		valid <= 0;
	end
	
end

SR_FF enable_control(CLK, iStart, done, enable);

assign xsigma_f = xsigma_shift[17:0];
assign xsigma_i = xsigma_shift[20:18];

mult_10_18_21 mult0(CLK, x, iSigma, xsigma);

ROM_3_13 exp_i(CLK, xsigma_i, exp_int);
Exponential exp_f(CLK, 1'b0, xsigma_f, exp_frac);
mult_12_13_18 mult1(CLK, 1'b1, exp_frac[19:8], exp_int_d2, exp_xsigma);

assign oData = exp_xsigma;
assign oAddr = x_d8;
assign oValid = valid;
assign oDone = done;

endmodule
