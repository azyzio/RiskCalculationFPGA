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
	oAcc,
	oDone
   );

parameter N = "1";					// the core identifier
parameter T = 512;
parameter logT = 9;
parameter pathWidth = 10;

input 							CLK;
input								iStart;
input								iSwitch;		// Indicates which RAM is currently used as a buffer

input		[pathWidth-1:0]	iSigmaWriteAddress;
input		[17:0]				iSigmaWriteData;
input								iSigmaWE;

input		[logT-1:0]			iMuWriteAddress;
input		[17:0]				iMuWriteData;
input								iMuWE;
											
wire								enable;

reg		[logT-1:0]	t;				// Unsigned integer
reg		[logT-1:0]	t_next;
reg		[logT-1:0]	t_d1;
reg		[logT-1:0]	t_d2;
reg		[logT-1:0]	t_d3;
reg		[logT-1:0]	t_d4;
reg		[logT-1:0]	t_d5;

wire		[pathWidth-1:0]	SigmaReadAddress;	// The Brownian Motion variable. 10 integer
wire		[17:0]				SigmaReadData;		// Output of the exponential table. 3 integer, 15 fraction bits

wire		[17:0]				MuReadData;			// 3 int, 15 fract
reg		[17:0]				MuReadData_d1;

reg								validProduct;
wire		[17:0]				product;	// S0 * exp (t*mu + W*sigma).
												// 18 bits. 4 integer, 14 fraction. 2MSB and 16LSB cut down.

reg								bit_ctr;												
reg		[17+logT:0]			acc;	// Accumulator summing the products. 14 fract
											// 27 bits as 18 bits can be maximally shifted left 9 times by adding them 8 times
reg		[17+logT:0]			out;
reg 								done;
											
output	[17+logT:0]			oAcc;				// The output indicating the sum of prices caluculated at each time slot
output							oDone;

// ------------- All the delays are twice as long to correspond to a slower clock

initial
begin
	t <= 0;
	t_next <= 0;
	t_d1 <= 0;
	t_d2 <= 0;
	t_d3 <= 0;
	t_d4 <= 0;
	t_d5 <= 0;
	MuReadData_d1 <= 0;
	acc <= 0;
	out <= 0;
	t <= 0;
	done <= 0;
	bit_ctr <= 0;
end

always @ (posedge CLK)
begin
	if (enable) begin
		t <= t_next;
		t_next <= t + 1;
		t_d1 <= t;
		t_d2 <= t_d1;
		t_d3 <= t_d2;
		t_d4 <= t_d3;
		t_d5 <= t_d4;
		MuReadData_d1 <= MuReadData;
		bit_ctr <= ~bit_ctr;
		
		if (t_d5 == T-1) begin
			out <= acc;
			done <= 1;
		end
		else begin
			out <= 0;
			if (done == 1)
				done <= 0;
		end
		
		if (t_d5 == T-1)
			validProduct <= 0;
		else begin
		if  (t_d4 == 0)
			validProduct <= 1;
		end
		
		if (bit_ctr && validProduct)
			acc <= acc + product;
			
	end	
	else begin
		t <= 0;
		t_next <= 0;
		t_d1 <= 20;
		t_d2 <= 20;
		t_d3 <= 20;
		t_d4 <= 20;
		t_d5 <= 20;
		validProduct <= 0;
		done <= 0;
	end
end

SR_FF enable_control(CLK, iStart, done, enable);

ROM_path #(N) path (CLK, t, SigmaReadAddress);
	 
RAM_X_18 #(pathWidth) exp_sigma (
	.CLK(CLK),
	.WE(iSigmaWE),
	.switch(iSwitch),
	.readAddr(SigmaReadAddress),
	.writeAddr(iSigmaWriteAddress),
	.readData(SigmaReadData),
	.writeData(iSigmaWriteData)
);

RAM_X_18 #(logT) mu_sigma (
	.CLK(CLK),
	.WE(iMuWE),
	.switch(iSwitch),
	.readAddr(t),
	.writeAddr(iMuWriteAddress),
	.readData(MuReadData),
	.writeData(iMuWriteData)
);

mult_18_18_18_core mult(CLK, MuReadData_d1, SigmaReadData, product);
// IntMultiplier_UsingDSP_18_18_unsigned_uid2 Mult(CLK, 1'b0, currentExpMu, SigmaReadData, MultOutput);

assign oAcc = out;
assign oDone = done;

endmodule
