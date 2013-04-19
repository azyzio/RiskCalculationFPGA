`timescale 1ns / 1ps

module CalculateExpSigma(
	CLK,
	iSigma,
	iStart,
	oData,
	oAddr,
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
output							oDone;

reg								enable; 		// controls if the module incrementing x works
reg								enable_exp_mul; // final multiplier enable

reg		[pathWidth-1:0]	x;				// Current input evaluated. Signed, 8 int, 2 fract

wire 		[20:0]				xsigma;		// (x * sigma). Signed, 3 int, 18 fract
reg 		[20:0]				xsigma_shift;	// (x * sigma) + 2. Unsigned, 3 int, 18 fract

wire		[17:0]				xsigma_f;	// fraction part of xsigma+2. 18 fract
wire		[2:0]					xsigma_i;	// integer part of xsigma+2. 3 int bits.

wire		[21:0]				exp_frac;	// exponent of the fractional part. 4 int, 18 fract
wire		[12:0]				exp_int;		// exponent of the integer part. 3 int, 10 fract
reg		[12:0]				exp_int_delayed;	// the delayed version is required for the inputs to arrive at the multiplier in the same time

wire		[17:0]				exp_xsigma;	// the result of multiplying frac and int. 3 int, 15 frac

reg								done;
reg		[pathWidth-1:0]	addr;

initial
begin
	enable <= 0;
	enable_exp_mul <= 0;
	x <= 0;
	xsigma_shift <= 0;
	exp_int_delayed <=0 ;
	addr <= 0;
	done <= 0;
end

always @ (posedge CLK)
begin
	enable_exp_mul <= #10 enable;
	xsigma_shift <= xsigma + 524288; // 2^19	
	if (iStart && ~enable)
	begin
		enable <= 1;
		x <= x_min;
		xsigma_shift <= 0;
	end
	else
	begin
		if (enable)
		begin
			x <= #4 x + 1;
			exp_int_delayed <= #2 exp_int;
			addr <= #14 x;
		end
		
		if (x == x_max)
		begin
			enable <= #2 0;
			#20;
			done = 1;
			#4;
			done = 0;
		end
	end
end

assign xsigma_f = xsigma_shift[17:0];
assign xsigma_i = xsigma_shift[20:18];

mult_10_18_21 x_sigma_mult(CLK, x, iSigma, xsigma);

ROM_3_13 exp_i_table(CLK, xsigma_i, exp_int);
Exponential exp(CLK, 1'b0, xsigma_f, exp_frac);

mult_12_13_18 exp_mult(CLK, enable_exp_mul, exp_frac[19:8], exp_int_delayed, exp_xsigma);

assign oData = exp_xsigma;
assign oAddr = addr;
assign oDone = done;

endmodule
