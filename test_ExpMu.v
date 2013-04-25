`timescale 1ns / 1ps

module test_CalculateExpMu;

	// Inputs
	reg CLK;
	reg [17:0] iMu;
	reg [16:0] iS;
	reg iStart;

	// Outputs
	wire [16:0] oData;
	wire [5:0] oAddr;
	wire oValid;
	wire oDone;

	// Instantiate the Unit Under Test (UUT)
	CalculateExpMu uut (
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(iStart), 
		.oData(oData), 
		.oAddr(oAddr), 
		.oValid(oValid),
		.oDone(oDone)
	);

	initial begin
		// Initialize Inputs
		CLK <= 0;
		iMu <= 524;
		iS <= 102400;
		iStart <= 0;

		// Wait 100 ns for global reset to finish
		#100;
		iStart <= 1;
		#2;
		iStart <= 0;

	end
   always
	begin
		#0.5 CLK = ~CLK;
	end  
endmodule

