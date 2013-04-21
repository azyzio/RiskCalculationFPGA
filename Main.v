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
parameter ExpSigmaN = 3;
parameter ExpMuN = 3;

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
wire							doneExpMu[0 : ExpMuN-1];		// pulse indicating the end of operation
wire	[logT-1:0]			addrExpMu[0 : ExpMuN-1];		// address output
wire							validExpMu[0 : ExpMuN-1];
wire	[17:0]				dataExpMu[0 : ExpMuN-1];		// data output
wire							readyExpMu;		// signal indicating that the data produced by ExpMu is ready to be used

wire							busyExpSigma;
wire							doneExpSigma[0 : ExpSigmaN-1];
wire	[pathWidth-1:0]	addrExpSigma[0 : ExpSigmaN-1];
wire							validExpSigma[0 : ExpSigmaN-1];
wire	[17:0]				dataExpSigma[0 : ExpSigmaN-1];
wire							readyExpSigma;

reg	[1:0]					ExpMuUsed;
wire	[logT-1:0]			addrExpMuUsed;
wire	[17:0]				dataExpMuUsed;
wire							validExpMuUsed;

reg	[1:0]					ExpSigmaUsed;
wire	[pathWidth-1:0]	addrExpSigmaUsed;
wire	[17:0]				dataExpSigmaUsed;
wire							validExpSigmaUsed;

wire							busyCores;
wire 							startCores;
wire							doneCore[0:CoreN-1];

wire	[26:0]				oAcc[0:CoreN-1];
wire							oDone[0:CoreN-1];

output	[26:0]			oAcc1;
output	[26:0]			oAcc2;

	initial begin
		Switch <= 0;
		ExpMuUsed <= 0;
		ExpSigmaUsed <= 0;
	end

	assign	startCalc = (~busyExpMu && ~busyExpSigma && readyOption);
	assign	startCores = (~busyCores && readyExpSigma && readyExpMu);
	
	SR_FF busyExpMu_control(CLK, startCalc, doneExpMu[0], busyExpMu);
	SR_FF busyExpSigma_control(CLK, startCalc, doneExpSigma[0], busyExpSigma);
	SR_FF readyOption_control(CLK, iDoneOptionCalc, startCalc, readyOption);
	
	SR_FF busyCores_control(CLK, startCores, doneCore[0], busyCores);
	SR_FF readySigmaExp_control(CLK, doneExpSigma[0], startCores, readyExpSigma);
	SR_FF readyMuExp_control(CLK, doneExpMu[0], startCores, readyExpMu);
	
	// Control of output from ExpMu ad ExpSigma modules used.
	always @ (posedge CLK)
	begin
		if (startCores)
			Switch <= ~Switch;
			
		if ((ExpSigmaUsed < ExpSigmaN-1) && busyExpSigma)
			ExpSigmaUsed <= ExpSigmaUsed + 1;
		else
			ExpSigmaUsed <= 0;
		
		if ((ExpMuUsed < ExpMuN-1) && busyExpMu)
			ExpMuUsed <= ExpMuUsed + 1;
		else
			ExpMuUsed <= 0;
	end
	
	assign addrExpSigmaUsed = addrExpSigma[ExpSigmaUsed];
	assign dataExpSigmaUsed = dataExpSigma[ExpSigmaUsed];
	assign validaExpSigmaUsed = validExpSigma[ExpSigmaUsed];
	
	assign addrExpMuUsed = addrExpMu[ExpMuUsed];
	assign dataExpMuUsed = dataExpMu[ExpMuUsed];	
	assign validExpMuUsed = validExpMu[ExpMuUsed];	
	
	// 512 is not divisible by 3. First module has to be longer (171) as it controls the done signal.
	CalculateExpMu #(.t_min(9'd0), .t_max(9'd170)) calcExpMu0
	(
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(startCalc), 
		.oData(dataExpMu[0]),
		.oAddr(addrExpMu[0]),
		.oValid(validExpMu[0]),
		.oDone(doneExpMu[0])
	);
		CalculateExpMu #(.t_min(9'd171), .t_max(9'd341)) calcExpMu1
	(
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(startCalc), 
		.oData(dataExpMu[1]), 
		.oAddr(addrExpMu[1]),
		.oValid(validExpMu[1]),
		.oDone(doneExpMu[1])
	);
		CalculateExpMu #(.t_min(9'd342), .t_max(9'd511)) calcExpMu2
	(
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(startCalc), 
		.oData(dataExpMu[2]), 
		.oAddr(addrExpMu[2]),
		.oValid(validExpMu[2]), 
		.oDone(doneExpMu[2])
	);
	
	CalculateExpSigma #(.x_min(-10'd307), .x_max(-10'd112)) calcExpSigma0
	(
		.CLK(CLK),
		.iSigma(iSigma),
		.iStart(startCalc),
		.oData(dataExpSigma[0]),
		.oAddr(addrExpSigma[0]),
		.oValid(validExpSigma[0]),
		.oDone(doneExpSigma[0])
	);
	CalculateExpSigma #(.x_min(-10'd111), .x_max(10'd84)) calcExpSigma1
	(
		.CLK(CLK),
		.iSigma(iSigma),
		.iStart(startCalc),
		.oData(dataExpSigma[1]),
		.oAddr(addrExpSigma[1]),
		.oValid(validExpSigma[1]),
		.oDone(doneExpSigma[1])
	);
	CalculateExpSigma #(.x_min(10'd85), .x_max(10'd280)) calcExpSigma2
	(
		.CLK(CLK),
		.iSigma(iSigma),
		.iStart(startCalc),
		.oData(dataExpSigma[2]),
		.oAddr(addrExpSigma[2]),
		.oValid(validExpSigma[2]),
		.oDone(doneExpSigma[2])
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
	addrExpSigmaUsed,
	dataExpSigmaUsed,
	validExpSigma[ExpSigmaUsed],
	addrExpMuUsed,
	dataExpMuUsed,
	validExpMuUsed,
	oAcc[0],
	doneCore[0]
);
MCCore #("1") core1 
(
	CLK,
	startCores,
	Switch,
	addrExpSigmaUsed,
	dataExpSigmaUsed,
	validExpSigma[ExpSigmaUsed],
	addrExpMuUsed,
	dataExpMuUsed,
	validExpMuUsed,
	oAcc[1],
	doneCore[1]
);

assign oDone[0] = doneCore[0];
assign oDone[1] = doneCore[1];

assign oAcc1 = oAcc[0];
assign oAcc2 = oAcc[1];

endmodule
