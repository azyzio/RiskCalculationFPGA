`timescale 1ns / 1ps

module main(	
	clk,
	i_new_option,
	i_mu,
	i_s,
	i_sigma,
	o_acc1,
	o_acc2
	);

parameter T = 64;
parameter logT = 6;
parameter pathWidth = 6;
parameter CoreN = 2;

input 						clk;
input							i_new_option;
input	[17:0]				i_mu;			// 18 Fract
input	[16:0]				i_s;			// 6 int, 11 fract
input	[17:0]				i_sigma;		// 18 fract

wire							enable;

wire							readyOption; // shows the readiness of new option to be used in calculations
	
reg							Switch;		// Controls which RAM is written to and read from

wire							startCalc; // applies to both ExpMu and ExpSigma

wire							busyExpMu;		// indicates if the ExpMu core is currently working
wire							doneExpMu;		// pulse indicating the end of operation
wire	[logT-1:0]			addrExpMu;		// address output
wire							validExpMu;
wire	[16:0]				dataExpMu;		// data output
wire							readyExpMu;		// signal indicating that the data produced by ExpMu is ready to be used

wire							busyExpSigma;
wire							doneExpSigma;
wire	[pathWidth-1:0]	addrExpSigma;
wire							validExpSigma;
wire	[16:0]				dataExpSigma;
wire							readyExpSigma;

wire							busyCores;
wire 							startCores;
wire							doneCore[0:CoreN-1];

wire	[22:0]				oAcc[0:CoreN-1];
wire							oDone[0:CoreN-1];

output	[22:0]			o_acc1;
output	[22:0]			o_acc2;

	initial begin
		Switch <= 0;
	end
	
	always @ (posedge clk)
	begin
		if (startCores)
			Switch <= ~Switch;
	end
	
	assign	startCalc = (~busyExpMu && ~busyExpSigma && readyOption);
	assign	startCores = (~busyCores && readyExpSigma && readyExpMu);
	
	SR_FF busyExpMu_control(clk, startCalc, doneExpMu, busyExpMu);
	SR_FF busyExpSigma_control(clk, startCalc, doneExpSigma, busyExpSigma);
	SR_FF readyOption_control(clk, i_new_option, startCalc, readyOption);
	
	SR_FF busyCores_control(clk, startCores, doneCore[0], busyCores);
	SR_FF readySigmaExp_control(clk, doneExpSigma, startCores, readyExpSigma);
	SR_FF readyMuExp_control(clk, doneExpMu, startCores, readyExpMu);
	
	// 512 is not divisible by 3. First module has to be longer (171) as it controls the done signal.
	CalculateExpMu calc_exp_mu
	(
		.CLK(clk), 
		.iMu(i_mu), 
		.iS(i_s), 
		.iStart(startCalc), 
		.oData(dataExpMu),
		.oAddr(addrExpMu),
		.oValid(validExpMu),
		.oDone(doneExpMu)
	);
	CalculateExpSigma calc_exp_sigma
	(
		.CLK(clk),
		.iSigma(i_sigma),
		.iStart(startCalc),
		.oData(dataExpSigma),
		.oAddr(addrExpSigma),
		.oValid(validExpSigma),
		.oDone(doneExpSigma)
	);
	
// Would prefer to use this, but I don't know how to parse int to string in Verilog.
// One option os to create a register and transform the integer using $sformat(reg, "$d", i);
// Problem is the size of the register. If it is 3chars, one digit numbers will be translated to "  1"
// Idea: Change the naming to path000, path001...
// Question: Does the register occupy space on the board?	 
	 
/*genvar i;
generate 
   for (i = 0; i < n; i = i + 1)
	begin : gen_loop
      MCCore #(i)
		 core (clk, EXP_MU, oAcc[i]);
   end
endgenerate*/
MCCore #("0") core0 
(
	.CLK(clk),
	.iStart(startCores),
	.iSwitch(Switch),
	.iSigmaWriteAddress(addrExpSigma),
	.iSigmaWriteData(dataExpSigma),
	.iSigmaWE(validExpSigma),
	.iMuWriteAddress(addrExpMu),
	.iMuWriteData(dataExpMu),
	.iMuWE(validExpMu),
	.oPrice(oAcc[0]),
	.oDone(doneCore[0])
);
MCCore #("1") core1 
(
	.CLK(clk),
	.iStart(startCores),
	.iSwitch(Switch),
	.iSigmaWriteAddress(addrExpSigma),
	.iSigmaWriteData(dataExpSigma),
	.iSigmaWE(validExpSigma),
	.iMuWriteAddress(addrExpMu),
	.iMuWriteData(dataExpMu),
	.iMuWE(validExpMu),
	.oPrice(oAcc[1]),
	.oDone(doneCore[1])
);

assign oDone[0] = doneCore[0];
assign oDone[1] = doneCore[1];

assign o_acc1 = oAcc[0];
assign o_acc2 = oAcc[1];

endmodule
