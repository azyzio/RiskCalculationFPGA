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
parameter t_max = 511;
parameter logT = 9;

input						CLK;
input		[17:0]		iMu;			// 18 Franction Bits
input		[17:0]		iS;			// 4 Integer bits. 14 Fraction bits.
input						iStart;

output	[17:0]		oData;
output	[logT-1:0]	oAddr;
output					oValid;
output					oDone;

wire						enable;

reg		[logT-1:0]	t;				// Unsigned integer
reg		[logT-1:0]	t_next0;	
reg		[logT-1:0]	t_next1;	
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

wire 		[17:0]		tmu;			// (t * mu) used for current exp calculation. 18 Franction Bits
reg		[17:0]		tmu_d1;

wire		[21:0]		exp_tmu;		// exp(t * mu). 4 Integer. 18 Franction Bits.
reg		[17:0]		exp_tmu_d1;	// 4 LSB cut. 4 int, 14 frac

wire		[17:0]		product;		// S0 * exp(t * mu). 3 Integer, 15 Franction Bits.
											// Multiplier cuts 5 MSB and 13 LSB
reg						valid;											
reg						done;

initial
begin
	t <= 0;
	t_next0 <= 0;
	t_next1 <= 0;
	t_d1 <= 0;
	t_d2 <= 0;
	t_d3 <= 0;
	t_d4 <= 0;
	t_d5 <= 0;
	t_d6 <= 0;
	t_d7 <= 0;
	t_d8 <= 0;
	t_d9 <= 0;
	t_d10 <= 0;
	t_d11 <= 0;
	tmu_d1 <= 0;
	exp_tmu_d1 <= 0;
	valid <= 0;
	done <= 0;
end

always @ (posedge CLK) begin
	if (enable) begin
		t <= t_next1;
		t_next0 <= t + 1;
		t_next1 <= t_next0;
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
		
		tmu_d1 <= tmu;
		exp_tmu_d1 <= exp_tmu[21:4];
		
		if (t_d11 == t_max) begin 
			done <= 1;
			valid <= 0;
		end
		else
		begin
			if (done == 1)
				done <= 0;
			if (t_d8 == t_min) // one before the actual input comes
				valid <= 1;
		end
	end		
	else begin
		t <= t_min;
		t_next0 <= t_min;
		t_next1 <= t_min;
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
		tmu_d1 <= 0;
		exp_tmu_d1 <= 0;
		done <= 0;
		valid <= 0;
	end
end

SR_FF enable_control(CLK, iStart, done, enable);

mult_9_18_18 mult1(CLK, t, iMu, tmu);
//Exponential exp(CLK, ~enable, tmu_d1, exp_tmu);
mult_18_18_18_muexp mult2(CLK, tmu_d1, iS, product);

assign oData = product;
assign oAddr = t_d9;
assign oValid = valid;
assign oDone = done;

endmodule
