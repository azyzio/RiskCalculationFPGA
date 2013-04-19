`timescale 1ns / 1ps

module ROM_3_13(
	CLK,
	iAddr,
	oData
);

// The parameter determining which instance of the core is the ROM used in
 
input 					CLK;
input 		[2:0] 	iAddr;
output reg	[12:0] 	oData;

reg			[12:0]	ROM [0:8];

initial
begin
	oData = 0;
	$readmemb({"memory_data/3bit_exp.data"}, ROM);
end

always @(posedge CLK)
begin
	oData = ROM[iAddr];
end
	
endmodule
