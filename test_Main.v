`timescale 1ns / 1ps
module test_Main;

	// Inputs
	reg CLK;
	reg			iDoneOptionCalc;
	reg [17:0] iMu;
	reg [17:0] iS;
	reg [17:0] iSigma;
	
	// Outputs
	wire [26:0] oAcc1;
	wire [26:0] oAcc2;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.CLK(CLK),
		.iDoneOptionCalc(iDoneOptionCalc),
		.iMu(iMu), 
		.iS(iS), 
		.iSigma(iSigma),
		.oAcc1(oAcc1),
		.oAcc2(oAcc2)
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
		#1;
		iDoneOptionCalc <= 1;
		#2;
		iDoneOptionCalc <= 0;
	end
	always
	begin
		#1 CLK = ~CLK;
	end  
      
endmodule

