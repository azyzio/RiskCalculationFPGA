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
	oValid,
	oDone
	);

parameter t_min = 0;
parameter t_max = 63;
parameter logT = 6;

input						CLK;
input		[17:0]		iMu;			// 18 Franction Bits
input		[16:0]		iS;			// 6 Integer bits. 12 Fraction bits.
input						iStart;

output	[16:0]		oData;
output	[logT-1:0]	oAddr;
output					oValid;
output					oDone;

wire						enable;

reg		[logT:0]	t;				// Unsigned integer
reg		[logT-1:0]	t_d1;
reg		[logT-1:0]	t_d2;
reg		[logT-1:0]	t_d3;
reg		[logT-1:0]	t_d4;
reg		[logT-1:0]	t_d5;
reg		[logT-1:0]	t_d6;
reg		[logT-1:0]	t_d7;
reg		[logT-1:0]	t_d8;
reg		[logT-1:0]	t_d9;
reg		[logT-1:0]	t_d10;
reg		[logT-1:0]	t_d11;
reg		[logT-1:0]	t_d12;
reg		[logT-1:0]	t_d13;

reg		[logT:0]	t_add1;		// needed to make t correspond to Sexp((t+1)mu). It can get value T, so needs one bit more not to overflow

wire 		[17:0]		tmu;			// (t * mu) used for current exp calculation. 18 Franction Bits
reg		[17:0]		tmu_d1;

wire		[17:0]		exp_tmu;		// exp(t * mu). 4 Integer. 14 Franction Bits.
reg		[17:0]		exp_tmu_d1;

wire		[16:0]		product;		// S0 * exp(t * mu). 6 Integer, 12 Franction Bits.
											// Multiplier cuts 5 MSB and 13 LSB
wire						valid;											
wire						done;

initial
begin
	t <= t_min;
	t_d1 <= t_min+20;
	t_d2 <= t_min+20;
	t_d3 <= t_min+20;
	t_d4 <= t_min+20;
	t_d5 <= t_min+20;
	t_d6 <= t_min+20;
	t_d7 <= t_min+20;
	t_d8 <= t_min+20;
	t_d9 <= t_min+20;
	t_d10 <= t_min+20;
	t_d11 <= t_min+20;
	t_d12 <= t_min+20;
	t_d13 <= t_min+20;
	t_add1 <= 1;
	tmu_d1 <= 0;
	exp_tmu_d1 <= 0;
end

always @ (posedge CLK) begin
	if (enable) begin
		if (t < t_max)
			t <= t + 1;
		else
			t <= 0;
		t_d1 <= t;
		t_d2 <= t_d1;
		t_d3 <= t_d2;
		t_d4 <= t_d3;
		t_d5 <= t_d4;
		t_d6 <= t_d5;
		t_d7 <= t_d6;
		t_d8 <= t_d7;
		t_d9 <= t_d8;
		t_d10 <= t_d9;
		t_d11 <= t_d10;
		t_d12 <= t_d11;
		t_d13 <= t_d12;
		
		t_add1 <= t+1;
		
		tmu_d1 <= tmu;
		exp_tmu_d1 <= exp_tmu;
		
	end		
	else begin
		t <= t_min;
		t_d1 <= t_min+20;
		t_d2 <= t_min+20;
		t_d3 <= t_min+20;
		t_d4 <= t_min+20;
		t_d5 <= t_min+20;
		t_d6 <= t_min+20;
		t_d7 <= t_min+20;
		t_d8 <= t_min+20;
		t_d9 <= t_min+20;
		t_d10 <= t_min+20;
		t_d11 <= t_min+20;
		t_d12 <= t_min+20;
		t_d13 <= t_min+20;
		t_add1 <= 1;
		tmu_d1 <= 0;
		exp_tmu_d1 <= 0;
	end
end

SR_FF done_control(CLK, (t_d13 == t_max), (done == 1), done);
SR_FF valid_control(CLK, (t_d12 == t_min), (t_d13 == t_max), valid);
SR_FF enable_control(CLK, iStart, done, enable);

MuExp1 mult1(CLK, t_add1, iMu, tmu);
exp_18_18 exp(CLK, ~enable, tmu_d1, exp_tmu);
MuExpMult2 mult2(CLK, exp_tmu_d1, iS, product);

assign oData = product;
assign oAddr = t_d13;
assign oValid = valid;
assign oDone = done;

endmodule
