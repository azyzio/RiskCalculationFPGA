`timescale 1ns / 1ps
module test_Main;

	// Inputs
	reg CLK;
	reg [17:0] iMu;
	reg [17:0] iS;
	reg [17:0] iSigma;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iSigma(iSigma)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		iMu = 0;
		iS = 0;
		iSigma = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		iMu <= 184;
		iSigma <= 3408;
		iS <= 24576;
	end
	always
	begin
		#0.5 CLK = ~CLK;
	end  
      
endmodule

