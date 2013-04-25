`timescale 1ns / 1ps


module test_CalculateExpSigma;

	// Inputs
	reg CLK;
	reg [17:0] iSigma;
	reg iStart;

	// Outputs
	wire [16:0] oData;
	wire [5:0] oAddr;
	wire oDone;
	wire oValid;
	
	// Instantiate the Unit Under Test (UUT)
	CalculateExpSigma uut (
		.CLK(CLK), 
		.iSigma(iSigma), 
		.iStart(iStart), 
		.oData(oData),
		.oValid(oValid),
		.oAddr(oAddr), 
		.oDone(oDone)
	);

	initial begin
		// Initialize Inputs
		CLK <= 0;
		iSigma <= 6554;
		iStart <= 0;

		// Wait 100 ns for global reset to finish
		#100;
		iStart <= 1;
      #1;
		iStart <= 0;
		#4000;
		
		iStart <=1;
		#2;
		iStart <= 0;
	end
	
	always
	begin
		#1 CLK = ~CLK;
	end
      
endmodule

