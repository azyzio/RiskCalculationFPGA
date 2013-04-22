`timescale 1ns / 1ps

module Main(	
	CLK,
	iDoneOptionCalc,
	iMu,
	iS,
	iSigma,
	oAcc1,
	oAcc2
	);

parameter T = 512;
parameter logT = 9;
parameter pathWidth = 10;
parameter CoreN = 2;

input 						CLK;
input							iDoneOptionCalc;
input	[17:0]				iMu;			// 18 Fract
input	[17:0]				iS;			// 4 int, 14 fract
input	[17:0]				iSigma;		// 18 fract

wire							enable;

wire							readyOption; // shows the readiness of new option to be used in calculations
	
reg							Switch;		// Controls which RAM is written to and read from

wire							startCalc; // applies to both ExpMu and ExpSigma

wire							busyExpMu;		// indicates if the ExpMu core is currently working
wire							doneExpMu;		// pulse indicating the end of operation
wire	[logT-1:0]			addrExpMu;		// address output
wire							validExpMu;
wire	[17:0]				dataExpMu;		// data output
wire							readyExpMu;		// signal indicating that the data produced by ExpMu is ready to be used

wire							busyExpSigma;
wire							doneExpSigma;
wire	[pathWidth-1:0]	addrExpSigma;
wire							validExpSigma;
wire	[17:0]				dataExpSigma;
wire							readyExpSigma;

wire							busyCores;
wire 							startCores;
wire							doneCore[0:CoreN-1];

wire	[26:0]				oAcc[0:CoreN-1];
wire							oDone[0:CoreN-1];

output	[26:0]			oAcc1;
output	[26:0]			oAcc2;

	initial begin
		Switch <= 0;
	end
	
	always @ (posedge CLK)
	begin
		if (startCores)
			Switch <= ~Switch;
	end
	
	assign	startCalc = (~busyExpMu && ~busyExpSigma && readyOption);
	assign	startCores = (~busyCores && readyExpSigma && readyExpMu);
	
	SR_FF busyExpMu_control(CLK, startCalc, doneExpMu, busyExpMu);
	SR_FF busyExpSigma_control(CLK, startCalc, doneExpSigma, busyExpSigma);
	SR_FF readyOption_control(CLK, iDoneOptionCalc, startCalc, readyOption);
	
	SR_FF busyCores_control(CLK, startCores, doneCore[0], busyCores);
	SR_FF readySigmaExp_control(CLK, doneExpSigma, startCores, readyExpSigma);
	SR_FF readyMuExp_control(CLK, doneExpMu, startCores, readyExpMu);
	
	// 512 is not divisible by 3. First module has to be longer (171) as it controls the done signal.
	CalculateExpMu calcExpMu
	(
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(startCalc), 
		.oData(dataExpMu),
		.oAddr(addrExpMu),
		.oValid(validExpMu),
		.oDone(doneExpMu)
	);
	CalculateExpSigma calcExpSigma
	(
		.CLK(CLK),
		.iSigma(iSigma),
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
		 core (CLK, EXP_MU, oAcc[i]);
   end
endgenerate*/
MCCore #("0") core0 
(
	CLK,
	startCores,
	Switch,
	addrExpSigma,
	dataExpSigma,
	validExpSigma,
	addrExpMu,
	dataExpMu,
	validExpMu,
	oAcc[0],
	doneCore[0]
);
MCCore #("1") core1 
(
	CLK,
	startCores,
	Switch,
	addrExpSigma,
	dataExpSigma,
	validExpSigma,
	addrExpMu,
	dataExpMu,
	validExpMu,
	oAcc[1],
	doneCore[1]
);

assign oDone[0] = doneCore[0];
assign oDone[1] = doneCore[1];

assign oAcc1 = oAcc[0];
assign oAcc2 = oAcc[1];

endmodule
