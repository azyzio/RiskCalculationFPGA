`timescale 1ns / 1ps

module ROM_3_13(
	CLK,
	iAddr,
	oData
);

// The parameter determining which instance of the core is the ROM used in
 
input 					CLK;
input 		[2:0] 	iAddr;
output reg	[16:0] 	oData;

reg			[16:0]	ROM [0:8];

initial
begin
	oData = 0;
	ROM[3'b101] = 17'b00000001100110000;
	ROM[3'b110] = 17'b00000100010101001;
	ROM[3'b111] = 17'b00001011110001011;
	ROM[3'b000] = 17'b00100000000000000;
	ROM[3'b001] = 17'b01010110111111000;
	ROM[3'b010] = 17'b11101100011100110;
	// Data for input 3 id not defined as the number of bits would have to be increased
end

always @(posedge CLK)
begin
	oData = ROM[iAddr];
end
	
endmodule
