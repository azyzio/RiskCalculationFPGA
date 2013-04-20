`timescale 1ns / 1ps

module Main(	
	CLK,
	iMu,
	iS,
	iSigma
	);

parameter T = 512;
parameter logT = 9;
parameter pathWidth = 10;
parameter CoreN = 2;
parameter ExpSigmaN = 3;
parameter ExpMuN = 3;

input 						CLK;
input	[17:0]				iMu;			// 18 Fract
input	[17:0]				iS;			// 4 int, 14 fract
input	[17:0]				iSigma;		// 18 fract

reg							readyOption; // shows the readiness of new option to be used in calculations
	
reg							Switch;		// Controls which RAM is written to and read from

reg							busyExpMu;		// indicates if the ExpMu core is currently working
reg							startExpMu;		// [ulse to tell ExpMu to start
wire							doneExpMu[0 : ExpMuN-1];		// pulse indicating the end of operation
wire	[logT-1:0]			addrExpMu[0 : ExpMuN-1];		// address output
wire	[17:0]				dataExpMu[0 : ExpMuN-1];		// data output
reg							readyExpMu;		// signal indicating that the data produced by ExpMu is ready to be used

reg							busyExpSigma;
reg							startExpSigma;
wire							doneExpSigma[0 : ExpSigmaN-1];
wire	[pathWidth-1:0]	addrExpSigma[0 : ExpSigmaN-1];
wire	[17:0]				dataExpSigma[0 : ExpSigmaN-1];
reg							readyExpSigma;

reg	[1:0]					ExpMuUsed;
wire	[logT-1:0]			addrExpMuUsed;
wire	[17:0]				dataExpMuUsed;

reg	[1:0]					ExpSigmaUsed;
wire	[pathWidth-1:0]	addrExpSigmaUsed;
wire	[17:0]				dataExpSigmaUsed;

reg							busyCores;
reg 							startCores;
wire							doneCore[0:CoreN-1];

wire	[26:0]				oAcc[0:CoreN-1];
wire							oDone[0:CoreN-1];

	initial begin
		readyOption <= 0;
		Switch <= 0;
		busyExpMu <= 0;
		startExpMu <= 0;
		readyExpMu <= 0;
		busyExpSigma <= 0;
		startExpSigma <= 0;
		readyExpSigma <= 0;
		startCores <= 0;
		busyCores <= 0;
		ExpMuUsed <= 0;
		ExpSigmaUsed <= 0;
	end
	
	// Send a start signal when Mu or S changes
	always @ (iMu or iS or iSigma)
	begin
		readyOption = 1;
	end
	
	always @ (posedge CLK)
	begin
		if (readyOption && ~busyExpSigma && ~busyExpMu)
		begin
			readyOption <= 0;
			busyExpSigma <= 1;
			busyExpMu <= 1;
			startExpSigma <= 1;
			startExpMu <= 1;
			#4;
			startExpSigma <= 0;
			startExpMu <= 0;
		end
	end
	
	// 512 is not divisible by 3. First module has to be longer (171) as it controls the done signal.
	CalculateExpMu #(.t_min(9'd0), .t_max(9'd170)) calcExpMu0
	(
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(startExpMu), 
		.oData(dataExpMu[0]), 
		.oAddr(addrExpMu[0]), 
		.oDone(doneExpMu[0])
	);
		CalculateExpMu #(.t_min(9'd171), .t_max(9'd341)) calcExpMu1
	(
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(startExpMu), 
		.oData(dataExpMu[1]), 
		.oAddr(addrExpMu[1]), 
		.oDone(doneExpMu[1])
	);
		CalculateExpMu #(.t_min(9'd342), .t_max(9'd511)) calcExpMu2
	(
		.CLK(CLK), 
		.iMu(iMu), 
		.iS(iS), 
		.iStart(startExpMu), 
		.oData(dataExpMu[2]), 
		.oAddr(addrExpMu[2]), 
		.oDone(doneExpMu[2])
	);
	
	CalculateExpSigma #(.x_min(-10'd307), .x_max(-10'd112)) calcExpSigma0
	(
		.CLK(CLK),
		.iSigma(iSigma),
		.iStart(startExpSigma),
		.oData(dataExpSigma[0]),
		.oAddr(addrExpSigma[0]),
		.oDone(doneExpSigma[0])
	);
	CalculateExpSigma #(.x_min(-10'd111), .x_max(10'd84)) calcExpSigma1
	(
		.CLK(CLK),
		.iSigma(iSigma),
		.iStart(startExpSigma),
		.oData(dataExpSigma[1]),
		.oAddr(addrExpSigma[1]),
		.oDone(doneExpSigma[1])
	);
	CalculateExpSigma #(.x_min(10'd85), .x_max(10'd280)) calcExpSigma2
	(
		.CLK(CLK),
		.iSigma(iSigma),
		.iStart(startExpSigma),
		.oData(dataExpSigma[2]),
		.oAddr(addrExpSigma[2]),
		.oDone(doneExpSigma[2])
	);
	always @ (posedge CLK)
	begin
		// Sunchronication Busy and ready signal controls
		if (doneExpSigma[0])
		begin
			readyExpSigma <= 1;
			busyExpSigma <= 0;
		end
		
		if (doneExpMu[0])
		begin
			readyExpMu <= 1;
			busyExpMu <= 0;
		end
		
		if (readyExpSigma && readyExpMu && ~busyCores)
		begin
			Switch <= ~Switch;
			readyExpSigma <= 0;
			readyExpMu <= 0;
			busyCores <= 1;
			startCores <= 1;
			#6;
			startCores <= 0;
		end
		
		if (doneCore[0])
			busyCores <= 0;
	end
	
	assign addrExpSigmaUsed = addrExpSigma[ExpSigmaUsed];
	assign dataExpSigmaUsed = dataExpSigma[ExpSigmaUsed];
	
	assign addrExpMuUsed = addrExpMu[ExpMuUsed];
	assign dataExpMuUsed = dataExpMu[ExpMuUsed];
	
	// Control of output from ExpMu ad ExpSigma modules used.
	always @ (posedge CLK)
	begin
		if ((ExpSigmaUsed < ExpSigmaN-1) && busyExpSigma)
			ExpSigmaUsed <= ExpSigmaUsed + 1;
		else
			ExpSigmaUsed <= 0;
		
		if ((ExpMuUsed < ExpMuN-1) && busyExpMu)
			ExpMuUsed <= ExpMuUsed + 1;
		else
			ExpMuUsed <= 0;
	end
	
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
MCCore #("0") core0 (CLK, startCores, Switch, addrExpSigmaUsed, dataExpSigmaUsed, busyExpSigma, addrExpMuUsed, dataExpMuUsed, busyExpMu, oAcc[0], doneCore[0]);
MCCore #("1") core1 (CLK, startCores, Switch, addrExpSigmaUsed, dataExpSigmaUsed, busyExpSigma, addrExpMuUsed, dataExpMuUsed, busyExpMu, oAcc[1], doneCore[1]);

assign oDone[0] = doneCore[0];
assign oDone[1] = doneCore[1];

endmodule
