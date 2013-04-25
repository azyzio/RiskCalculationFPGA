`timescale 1ns / 1ps
module test_Main;

	// Inputs
	reg CLK;
	reg			iDoneOptionCalc;
	reg [17:0] iMu;
	reg [16:0] iS;
	reg [17:0] iSigma;
	
	// Outputs
	wire [22:0] oAcc1;
	wire [22:0] oAcc2;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(CLK),
		.i_new_option(iDoneOptionCalc),
		.i_mu(iMu),
		.i_s(iS),
		.i_sigma(iSigma),
		.o_acc1(oAcc1),
		.o_acc2(oAcc2)
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
		iMu <= 524;
		iS <= 102400;
		iSigma <= 6554;
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

