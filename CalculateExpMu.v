// Adam Zysko
`timescale 1ns / 1ps

// This module calculates the values for all the t from 0 to T-1 of the expression
// S0 * exp ( t * mu)

module CalculateExpMu(
	CLK,
	iMu,
	iS,
	iStart,
	oData,
	oAddr,
	oDone
	);

parameter t_min = 171;
parameter t_max = 341;
parameter logT = 9;

input						CLK;
input		[17:0]		iMu;			// 18 Franction Bits
input		[17:0]		iS;			// 4 Integer bits. 14 Fraction bits.
input						iStart;

output	[17:0]		oData;
output	[logT-1:0]	oAddr;
output					oDone;

reg						enable; 		// controls when all the modules sould perform their function

reg		[logT-1:0]	t;				// Unsigned integer
reg		[logT-1:0]	t_delayed;

wire 		[17:0]		tmu;			// (t * mu) used for current exp calculation. 18 Franction Bits
wire		[21:0]		exp_tmu;		// exp(t * mu). 4 Integer. 18 Franction Bits.

wire		[17:0]		product;		// S0 * exp(t * mu). 3 Integer, 15 Franction Bits.
											// Multiplier cuts 5 MSB and 13 LSB
											
reg						done;

initial
begin
	enable <= 0;
	t <= t_min;
	t_delayed <= 0;
	done <= 0;
end

always @ (posedge CLK)
begin
	t_delayed <= #12 t;
	if (iStart && ~enable)
	begin
		enable <= 1;
		t <= t_min;
	end
	else
	begin
		if (enable)
		begin
			t	<= #4 t + 1;
		end
		
		if (t == t_max)
		begin
			enable <= #2 0; // delay to enable the last change
			#14;
			done = 1;
			#4;
			done = 0;
		end
	end
end

mult_18_9_18 mul1(CLK, iMu, t, tmu);
Exponential exp(CLK, 1'b0, tmu, exp_tmu);
Mult mul2(CLK, exp_tmu[21:4], iS, product);

assign oData = product;
assign oAddr = t_delayed;
assign oDone = done;

endmodule
