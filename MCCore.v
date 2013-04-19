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
input								iStart;		// signal the readiness of the inputs
input								iSwitch;	// Indicates which RAM is currently used as a buffer

input		[pathWidth-1:0]	iSigmaWriteAddress;
input		[17:0]				iSigmaWriteData;
input								iSigmaWE;

input		[logT-1:0]			iMuWriteAddress;
input		[17:0]				iMuWriteData;
input								iMuWE;
											
reg								enable;
reg								enable_acc;			// if te addition should be hapenning

reg		[logT-1:0]			t;						// current timestep.

wire		[pathWidth-1:0]	SigmaReadAddress;	// The Brownian Motion variable. 10 integer
wire		[17:0]				SigmaReadData;		// Output of the exponential table. 3 integer, 15 fraction bits

reg		[logT-1:0]			MuReadAddress;		// integer
wire		[17:0]				MuReadData;			// 3 int, 15 fract

wire		[17:0]				product;	// S0 * exp (t*mu + W*sigma).
												// 18 bits. 4 integer, 14 fraction. 2MSB and 16LSB cut down.
												
reg		[17+logT:0]			acc;	// Accumulator summing the products. 14 fract
											// 27 bits as 18 bits can be maximally shifted left 9 times by adding them 8 times
reg 								done;
											
output	[17+logT:0]			oAcc;				// The output indicating the sum of prices caluculated at each time slot
output							oDone;

// ------------- All the delays are twice as long to correspond to a slower clock

initial
begin
	enable <= 0;
	enable_acc <= 0;
	acc <= 0;
	t <= 0;
	done <= 0;
	MuReadAddress <= 0;
end

always @ (posedge CLK)
begin
	enable_acc <= #6 enable; // should be 4
	MuReadAddress <= t;
	if (iStart && ~enable)
	// When the module is supposed to do the calculation
	begin
		enable <= 1;	// Turn the whole module on
		t <= 0;			// Reset t
		acc <= 0;
	end
	
	// When the module is already performing calculation
	else
	begin
		if (enable)
		begin
			t	<= #2 t + 1;
			if (t == T-1)
			begin
				enable <= #2 0;
			end
		end
		if (enable_acc)
		begin
			acc <= acc + product;
			#4;
		end
	end
end

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

RAM_X_18 #(logT) mu_sigma ( // probably one extra register needed
	.CLK(CLK),
	.WE(iMuWE),
	.switch(iSwitch),
	.readAddr(t),
	.writeAddr(iMuWriteAddress),
	.readData(MuReadData),
	.writeData(iMuWriteData)
);

mult_18_18_18 Mult(CLK, 1'b1, MuReadData, SigmaReadData, product);
// IntMultiplier_UsingDSP_18_18_unsigned_uid2 Mult(CLK, 1'b0, currentExpMu, SigmaReadData, MultOutput);

always @(negedge enable_acc) // change
begin
	done <= 1;
	#6;
	done <= 0;
end

assign oAcc = acc;
assign oDone = done;

endmodule
