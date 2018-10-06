`timescale 1ns / 1ps

module Instruction_Memory(PCOut, InstOut);
	input [63:0] PCOut;
	output  [31:0] InstOut;
	reg [7:0] IM [0:255];

		 assign InstOut = {IM[PCOut+0], IM[PCOut+1], IM[PCOut+2], IM[PCOut+3]};

	initial
	begin
		// Load First Value
		IM[0] = 8'hF8; //11111000
		IM[1] = 8'h42; //01000010
		IM[2] = 8'h80; //10000000
		IM[3] = 8'h05; //00000101
		// Load Second Value
		IM[4] = 8'hF8; //11111000
		IM[5] = 8'h45; //01000101
		IM[6] = 8'h00; //00000000
		IM[7] = 8'h0A; //00001010
		//ADD
		IM[8] = 8'h8B; //10001011
		IM[9] = 8'h0A; //00001010
		IM[10] = 8'h00; //00000000
		IM[11] = 8'hA1; //10100001
		// Subtract
		IM[12] = 8'hCB; //11001011
		IM[13] = 8'h0A; //00001010
		IM[14] = 8'h00; //00000000
		IM[15] = 8'hA2; //10100010
		// AND
		IM[16] = 8'h8A; //10001010
		IM[17] = 8'h0A; //00001010
		IM[18] = 8'h00; //00000000
		IM[19] = 8'hA3; //10100011
		// OR
		IM[20] = 8'hAA; //10101010
		IM[21] = 8'h0A; //00001010
		IM[22] = 8'h00; //00000000
		IM[23] = 8'hA4; //10100100
		// Store ADD
		IM[24] = 8'hF8; //11111000
		IM[25] = 8'h01; //00000000
		IM[26] = 8'h80; //10000000
		IM[27] = 8'h01; //00000001
		// Store SUB
		IM[28] = 8'hF8; //11111000
		IM[29] = 8'h02; //00000001
		IM[30] = 8'h00; //10010000
		IM[31] = 8'h02; //00000010
		// Store AND
		IM[32] = 8'hF8; //11111000
		IM[33] = 8'h00; //00000000
		IM[34] = 8'hA0; //10100000
		IM[35] = 8'h03; //00000011
		// Store OR
		IM[36] = 8'hF8; //11111000
		IM[37] = 8'h01; //00000000
		IM[38] = 8'h00; //10110000
		IM[39] = 8'h04; //00000100
		
		//             Opcode      Address   00 RN    RD
		//					1986			40			 00 00    5
		//IM[0] = 32'b 11111000010_000101000_00_00000_00101; //Load First Value
		//IM[1] = 32'b 11111000010_001010000_00_00000_01010; //Load Second Value
		////	   		Opcode      RM	   Shamt	 RN	 RT
		////           X           10     0     5     1
		//IM[2] = 32'b 10001011000_01010_000000_00101_00001; // Add X1, X5, X10
		//IM[3] = 32'b 11001011000_01010_000000_00101_00010; // Subtract
		//IM[4] = 32'b 10001010000_01010_000000_00101_00011; // AND
		//IM[5] = 32'b 10101010000_01010_000000_00101_00100; // OR
		////				Opcode       Address	  00 RN	  RT
		////           1984			 8				0	0	  1
		//IM[6] = 32'b 11111000000_000001000_00_00000_00001; // Store Add 08
		//IM[5] = 32'b 11111000 000_00001 0000_00_00 000_00010; // Store Sub 16
		//IM[6] = 32'b 11111000000_000011000_00_00000_00011; // Store And 24
		//IM[7] = 32'b 11111000000_000100000_00_00000_00100; // Store OR  32
	end
	
endmodule