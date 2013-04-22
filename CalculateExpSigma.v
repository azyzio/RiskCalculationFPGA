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
reg	signed	[pathWidth-1:0]	x_d12;
reg	signed	[pathWidth-1:0]	x_d13;

wire 	signed	[20:0]				xsigma;		// (x * sigma). Signed, 3 int, 18 fract
reg 				[20:0]				xsigma_shift;	// (x * sigma) + 2. Unsigned, 3 int, 18 fract

reg		[17:0]				xsigma_f;	// fraction part of xsigma+2. 18 fract
reg		[2:0]					xsigma_i;	// integer part of xsigma+2. 3 int bits.

wire		[13:0]				exp_frac;	// exponent of the fractional part. 4 int, 10 fract
reg		[11:0]				exp_frac_d1;// 2 MSB cut. 2 int, 10 fract

wire		[12:0]				exp_int;		// exponent of the integer part. 3 int, 10 fract
reg		[12:0]				exp_int_d1;
reg		[12:0]				exp_int_d2;
reg		[12:0]				exp_int_d3;
reg		[12:0]				exp_int_d4;
reg		[12:0]				exp_int_d5;
reg		[12:0]				exp_int_d6;

wire		[17:0]				exp_xsigma;	// the result of multiplying frac and int. 3 int, 15 frac

wire								valid;
wire								done;

initial
begin
	x <= 0;
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
	x_d11 <= 0;
	x_d12 <= 0;
	x_d13 <= 0;
	xsigma_shift <= 0;
	xsigma_f <= 0;
	xsigma_i <= 0;
	exp_frac_d1 <= 0;
	exp_int_d1 <= 0;
	exp_int_d2 <= 0;
	exp_int_d3 <= 0;
	exp_int_d4 <= 0;
	exp_int_d5 <= 0;
	exp_int_d6 <= 0;
end

always @ (posedge CLK)
begin
	if (enable) begin
		x <= x + 1;
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
		x_d11 <= x_d10;
		x_d12 <= x_d11;
		x_d13 <= x_d12;
		
		xsigma_shift <= xsigma + 2**19;
		
		xsigma_f <= xsigma_shift[17:0];
		xsigma_i <= xsigma_shift[20:18];
		
		exp_frac_d1 <= exp_frac[11:0];
		exp_int_d1 <= exp_int;
		exp_int_d2 <= exp_int_d1;
		exp_int_d3 <= exp_int_d2;
		exp_int_d4 <= exp_int_d3;
		exp_int_d5 <= exp_int_d4;
		exp_int_d6 <= exp_int_d5;
	end
	else begin
		x <= x_min;
		x_d1 <= x_min+20;
		x_d2 <= x_min+20;
		x_d3 <= x_min+20;
		x_d4 <= x_min+20;
		x_d5 <= x_min+20;
		x_d6 <= x_min+20;
		x_d7 <= x_min+20;
		x_d8 <= x_min+20;
		x_d9 <= x_min+20;
		x_d10 <= x_min+20;
		x_d11 <= x_min+20;
		x_d12 <= x_min+20;
		x_d13 <= x_min+20;
		xsigma_shift <= 0;
		xsigma_f <= 0;
		xsigma_i <= 0;
		exp_frac_d1 <= 0;
		exp_int_d1 <= 0;
		exp_int_d2 <= 0;
		exp_int_d3 <= 0;
		exp_int_d4 <= 0;
		exp_int_d5 <= 0;
		exp_int_d6 <= 0;
	end
end
	
SR_FF done_control(CLK, (x_d13 == x_max), (done == 1), done);
SR_FF valid_control(CLK, (x_d12 == x_min), (x_d13 == x_max), valid);
SR_FF enable_control(CLK, iStart, done, enable);

mult_10_18_21 mult0(CLK, x, iSigma, xsigma);

ROM_3_13 exp_i(CLK, xsigma_i, exp_int);
exp_18_14 exp_f(CLK, 1'b0, xsigma_f, exp_frac);
mult_12_13_18 mult1(CLK, 1'b1, exp_frac_d1, exp_int_d6, exp_xsigma);

assign oData = exp_xsigma;
assign oAddr = x_d13;
assign oValid = valid;
assign oDone = done;

endmodule
