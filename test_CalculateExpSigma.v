`timescale 1ns / 1ps


module test_CalculateExpSigma;

	// Inputs
	reg CLK;
	reg [17:0] iSigma;
	reg iStart;

	// Outputs
	wire [17:0] oData;
	wire [9:0] oAddr;
	wire oDone;

	// Instantiate the Unit Under Test (UUT)
	CalculateExpSigma uut (
		.CLK(CLK), 
		.iSigma(iSigma), 
		.iStart(iStart), 
		.oData(oData), 
		.oAddr(oAddr), 
		.oDone(oDone)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		iSigma = 3408;
		iStart = 0;

		// Wait 100 ns for global reset to finish
		#100;
		iStart = 1;
		#6;
		iStart = 0;
        	
	end
	
	always
	begin
		#1 CLK = ~CLK;
	end
      
endmodule

