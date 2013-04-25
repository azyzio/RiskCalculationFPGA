// Adam Zysko

`timescale 1ns / 1ps

module MCCore(
	CLK,
	iStart,
	iSwitch,
	iSigmaWriteAddress,
	iSigmaWriteData,
	iSigmaWE,
	iMuWriteAddress,
	iMuWriteData,
	iMuWE,
	oPrice,
	oDone
   );

parameter N = "1";					// the core identifier
parameter T = 64;
parameter logT = 6;
parameter pathWidth = 6;

input 							CLK;
input								iStart;
input								iSwitch;		// Indicates which RAM is currently used as a buffer

input		[pathWidth-1:0]	iSigmaWriteAddress;
input		[16:0]				iSigmaWriteData;
input								iSigmaWE;

input		[logT-1:0]			iMuWriteAddress;
input		[16:0]				iMuWriteData;
input								iMuWE;
											
wire								enable;

reg		[logT-1:0]	t;				// Unsigned integer
reg		[logT-1:0]	t_d1;
reg		[logT-1:0]	t_d2;
reg		[logT-1:0]	t_d3;
reg		[logT-1:0]	t_d4;
reg		[logT-1:0]	t_d5;
reg		[logT-1:0]	t_d6;
reg		[logT-1:0]	t_d7;

wire		[pathWidth-1:0]	pathOutput;			// The Brownian Motion variable. 10 integer
reg		[pathWidth-1:0]	SigmaReadAddress;
wire		[16:0]				SigmaReadData;		// Output of the exponential table. 3 integer, 15 fraction bits
reg		[16:0]				SigmaReadData_d1;

wire		[16:0]				MuReadData;			// 3 int, 15 fract
reg		[16:0]				MuReadData_d1;
reg		[16:0]				MuReadData_d2;
reg		[16:0]				MuReadData_d3;

wire								validProduct;
wire		[16:0]				product;	// S0 * exp (t*mu + W*sigma).
												// 6 integer, 15 fraction.
											
reg		[16+logT:0]			acc;	// Accumulator summing the products. 15 fract
											// 27 bits as 18 bits can be maximally shifted left 9 times by adding them 8 times
reg		[16+logT:0]			price;
wire 								done;
											
output	[16+logT:0]			oPrice;		// 4 int, 23 fract. Shift tight by 8 performed in head
output							oDone;

initial
begin
	t <= 0;
	t_d1 <= 20;
	t_d2 <= 20;
	t_d3 <= 20;
	t_d4 <= 20;
	t_d5 <= 20;
	t_d6 <= 20;
	t_d7 <= 20;
	SigmaReadAddress <= 0;
	SigmaReadData_d1 <= 0;
	MuReadData_d1 <= 0;
	MuReadData_d2 <= 0;
	MuReadData_d3 <= 0;
	acc <= 0;
	price <= 0;
	t <= 0;
end

always @ (posedge CLK)
begin
	if (enable) begin
		if (t != T-1)
			t <= t + 1;
		t_d1 <= t;
		t_d2 <= t_d1;
		t_d3 <= t_d2;
		t_d4 <= t_d3;
		t_d5 <= t_d4;
		t_d6 <= t_d5;
		t_d7 <= t_d6;
		SigmaReadAddress <= pathOutput;
		SigmaReadData_d1 <= SigmaReadData;
		MuReadData_d1 <= MuReadData;
		MuReadData_d2 <= MuReadData_d1;
		MuReadData_d3 <= MuReadData_d2;
		
		if (t_d7 == T-1)
			price <= acc;
		if (validProduct)
			acc <= acc + product;
	end	
	else begin
		t <= 0;
		t_d1 <= 20;
		t_d2 <= 20;
		t_d3 <= 20;
		t_d4 <= 20;
		t_d5 <= 20;
		t_d6 <= 20;
		t_d7 <= 20;
	end
end

SR_FF done_control (CLK, (t_d7 == T-1), (done == 1), done);
SR_FF validProduct_control (CLK, (t_d5 == 0), (t_d6 == T-1), validProduct);
SR_FF enable_control (CLK, iStart, done, enable);

ROM_path #(N) path (
	.CLK(CLK),
	.iADDRESS(t),
	.oDATA(pathOutput)
);
	 
RAM_X_18 #(pathWidth) exp_sigma (
	.CLK(CLK),
	.WE(iSigmaWE),
	.switch(iSwitch),
	.readAddr(SigmaReadAddress),
	.writeAddr(iSigmaWriteAddress),
	.readData(SigmaReadData),
	.writeData(iSigmaWriteData)
);

RAM_X_18 #(logT) exp_mu (
	.CLK(CLK),
	.WE(iMuWE),
	.switch(iSwitch),
	.readAddr(t),
	.writeAddr(iMuWriteAddress),
	.readData(MuReadData),
	.writeData(iMuWriteData)
);

CoreMult mult(CLK, MuReadData_d3, SigmaReadData_d1, product);

assign oPrice = price;
assign oPrice = price;
assign oDone = done;

endmodule
