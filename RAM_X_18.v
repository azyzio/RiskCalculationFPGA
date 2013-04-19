`timescale 1ns / 1ps

module RAM_X_18(
	CLK,
	WE,
	switch,
	readAddr,
	writeAddr,
	readData,
	writeData,
);

parameter addr_size = 10;
 
input 								CLK;
input 		[addr_size-1:0] 	readAddr;
input 		[addr_size-1:0] 	writeAddr;

input									WE;		// Write enable
input									switch;	// 0 - WE on RAM0, 1 - WE on RAM1

output reg	[17:0] 				readData;
input			[17:0] 				writeData;

reg			[17:0]				RAM0 [0:2**addr_size-1];
reg			[17:0]				RAM1 [0:2**addr_size-1];

initial
begin
	readData <= 0;
end

always @(posedge CLK)
begin
	// Data written to RAM0 and read from RAM1
	if (!switch)	
	begin
		if(WE)
			RAM0[writeAddr] <= writeData;
		readData <= RAM1[readAddr];
	end
	
	// Data written to RAM1 and read from RAM0
	else
	begin
		if (WE)
			RAM1[writeAddr] <= writeData;
		readData <= RAM0[readAddr];
	end
end
	
endmodule
