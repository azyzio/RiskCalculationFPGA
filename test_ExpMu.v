`timescale 1ns / 1ps

module test_CalculateExpMu;

	// Inputs
	reg CLK;
	reg [17:0] iMu;
	reg [17:0] iS;
	reg iStart;

	// Outputs
	wire [17:0] oData;
	wire [8:0] oAddr;
	wire oDone;

	// Instantiate the Unit Under Test (UUT)
	CalculateExpMu uut (
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(iStart), 
		.oData(oData), 
		.oAddr(oAddr), 
		.oDone(oDone)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		iMu = 184;
		iS = 24576;
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

