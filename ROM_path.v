`timescale 1ns / 1ps

module ROM_path(
	CLK,
	iADDRESS,
	oDATA
);

// The parameter determining which instance of the core is the ROM used in
parameter				N = "1";
 
input 					CLK;
input 		[8:0] 	iADDRESS;
output reg	[9:0] 	oDATA;

reg			[9:0]	ROM [0:511];

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
