`timescale 1ns / 1ps

module SR_FF(
	CLK,
	S,
	R,
	OUT
);

	input 		CLK;
	input			S;
	input			R;
	reg			Q;
	output		OUT;
	
	initial begin
		Q <= 1'b0;
	end

	always @ (posedge CLK) begin
		case({S,R})
			{1'b0,1'b0}: begin Q=Q; end
			{1'b0,1'b1}: begin Q=1'b0; end
			{1'b1,1'b0}: begin Q=1'b1; end
			{1'b1,1'b1}: begin Q=1'bx; end
		endcase
	end
	
	assign OUT = Q;
	
endmodule
