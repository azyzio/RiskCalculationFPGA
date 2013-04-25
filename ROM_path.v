`timescale 1ns / 1ps

module ROM_path(
	CLK,
	iADDRESS,
	oDATA
);

// The parameter determining which instance of the core is the ROM used in
parameter				N = "1";
 
parameter T = 64;
parameter logT = 6;
parameter pathWidth = 6;
 
input 								CLK;
input 		[logT-1:0] 			iADDRESS;
output reg	[pathWidth-1:0] 	oDATA;

reg			[pathWidth-1:0]	ROM [0:T-1];

initial
begin
	oDATA = 0;
	$readmemb({"memory_data/path", N, ".data"}, ROM);
end

always @(posedge CLK)
begin
	oDATA = ROM[iADDRESS];
end
	
endmodule
