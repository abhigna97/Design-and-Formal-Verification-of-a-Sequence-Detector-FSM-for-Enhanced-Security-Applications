module seq_detector(clk,RESET,in,out);
input logic clk,RESET;
input logic in;
output logic out;

enum logic[4:0]{S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,
				S0_Check,S1_Check,S2_Check,S3_Check,S4_Check,S5_Check,
				S6_Check,S7_Check,S8_Check,S9_Check,S10_Check,S11_Check,
				I1,I2,I3,Isolation,Deadlock,Final} state,next_state;
				
//present state logic				
always_ff@(posedge clk or negedge RESET) begin
	if(!RESET && (state !==Deadlock))
		state <= S0;
	else
		state <= next_state;
end

// next state logic
always_comb begin
	case(state)
		S0: case(in)
				1'b0:	next_state = S0_Check;
				1'b1:	next_state = I1;
				default:next_state = 5'bx;
			endcase
		S1: case(in)
				1'b0:	next_state = S1;
				1'b1:	next_state = S1_Check;
				default:next_state = 5'bx;
			endcase
		S2: case(in)
				1'b0:	next_state = S2_Check;
				1'b1:	next_state = S0;
				default:next_state = 5'bx;
			endcase
		S3: case(in)
				1'b0:	next_state = S1;
				1'b1:	next_state = S3_Check;
				default:next_state = 5'bx;
			endcase
		S4: case(in)
				1'b0:	next_state = S4_Check;
				1'b1:	next_state = S0;
				default:next_state = 5'bx;
			endcase
		S5: case(in)
				1'b0:	next_state = S5_Check;
				1'b1:	next_state = S4;
				default:next_state = 5'bx;
			endcase
		S6: case(in)
				1'b0:	next_state = S6_Check;
				1'b1:	next_state = Deadlock;
				default:next_state = 5'bx;
			endcase
		S7: case(in)
				1'b0:	next_state = S7_Check;
				1'b1:	next_state = S0;
				default:next_state = 5'bx;
			endcase
		S8: case(in)
				1'b0:	next_state = S1;
				1'b1:	next_state = S8_Check;
				default:next_state = 5'bx;
			endcase
		S9: case(in)
				1'b0:	next_state = S9_Check;
				1'b1:	next_state = S0;
				default:next_state = 5'bx;
			endcase
		S10: case(in)
				1'b0:	next_state = S10_Check;
				1'b1:	next_state = S0;
				default:next_state = 5'bx;
			endcase
		S11: case(in)
				1'b0:	next_state = S11_Check;
				1'b1:	next_state = Deadlock;
				default:next_state = 5'bx;
			endcase
		S0_Check:	case(in)
						1'b0:	next_state = S1;
						1'b1:	next_state = S0;
						default:next_state = 5'bx;
					endcase
		S1_Check: 	case(in)
						1'b0:	next_state = S1;
						1'b1:	next_state = S2;
						default:next_state = 5'bx;
					endcase
		S2_Check: 	case(in)
						1'b0:	next_state = S3;
						1'b1:	next_state = S2;
						default:next_state = 5'bx;
					endcase
		S3_Check: 	case(in)
						1'b0:	next_state = S3;
						1'b1:	next_state = S4;
						default:next_state = 5'bx;
					endcase
		S4_Check: 	case(in)
						1'b0:	next_state = S5;
						1'b1:	next_state = S4;
						default:next_state = 5'bx;
					endcase
		S5_Check: 	case(in)
						1'b0:	next_state = S6;
						1'b1:	next_state = S5;
						default:next_state = 5'bx;
					endcase
		S6_Check:  	case(in)
						1'b0:	next_state = S7;
						1'b1:	next_state = S6;
						default:next_state = 5'bx;
					endcase
		S7_Check: 	case(in)
						1'b0:	next_state = S8;
						1'b1:	next_state = S7;
						default:next_state = 5'bx;
					endcase
		S8_Check: 	case(in)
						1'b0:	next_state = S8;
						1'b1:	next_state = S9;
						default:next_state = 5'bx;
					endcase
		S9_Check: 	case(in)
						1'b0:	next_state = S10;
						1'b1:	next_state = S9;
						default:next_state = 5'bx;
					endcase
		S10_Check: 	case(in)
						1'b0:	next_state = S11;
						1'b1:	next_state = S10;
						default:next_state = 5'bx;
					endcase
		S11_Check: 	case(in)
						1'b0:	next_state = Final;
						1'b1:	next_state = S11;
						default:next_state = 5'bx;
					endcase
		I1:	case(in)
				1'b0:	next_state = S0;
				1'b1:	next_state = I2;
				default:next_state = 5'bx;
			endcase
		I2:	case(in)
				1'b0:	next_state = S0;
				1'b1:	next_state = I3;
				default:next_state = 5'bx;
			endcase
		I3:	case(in)
				1'b0:	next_state = Isolation;
				1'b1:	next_state = S0;
				default:next_state = 5'bx;
			endcase
		Isolation:	case(RESET)
						1'b0:	next_state = S0;
						1'b1:	next_state = Isolation;
						default:next_state = 5'bx;
					endcase
		Deadlock: 	next_state = Deadlock;
		Final: 		next_state = S0;		
		default: 	next_state = 5'bx;
	endcase
end

//output logic
always_comb begin
	unique case(state)
		S0:	out = 1'b0;
		S1: out = 1'b0;
		S2: out = 1'b0;
		S3: out = 1'b0;
		S4: out = 1'b0;
		S5: out = 1'b0;
		S6: out = 1'b0;
		S7: out = 1'b0;
		S8: out = 1'b0;
		S9: out = 1'b0;
		S10:out = 1'b0;
		S11:out = 1'b0;
		S0_Check:	out = 1'b0;
		S1_Check: 	out = 1'b0;
		S2_Check: 	out = 1'b0;
		S3_Check: 	out = 1'b0;
		S4_Check: 	out = 1'b0;
		S5_Check:	out = 1'b0;
		S6_Check:  	out = 1'b0;
		S7_Check: 	out = 1'b0;
		S8_Check: 	out = 1'b0;
		S9_Check: 	out = 1'b0;
		S10_Check: 	out = 1'b0;
		S11_Check: 	out = 1'b0;
		I1:	out = 1'b0;
		I2:	out = 1'b0;
		I3:	out = 1'b0;
		Isolation:	out = 1'b0;
		Deadlock: 	out = 1'b0;
		Final: 		out = 1'b1;		
	endcase
end

endmodule