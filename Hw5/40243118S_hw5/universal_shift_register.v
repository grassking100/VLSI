module universal_shift_register(MSB_out,LSB_out,Data_out[7:0],clk, rst,s1,s2,s3,MSB_in,LSB_in,Data_in [7:0]);
	output reg MSB_out;
	output reg LSB_out;
	output reg[7:0]Data_out ;
	input clk;
	input rst;
	input s1;
	input s2;
	input s3;
	input MSB_in;
	input LSB_in;
	input [7:0] Data_in ;
	always @(posedge clk)
	begin
		if (rst) begin Data_out<=8'b0; end
		else begin
			
			case({s3, s2, s1})
				3'b000:Data_out<=Data_out;
				3'b001:Data_out<={MSB_in, Data_out[7:1]};
				3'b010:Data_out<={Data_out[0], Data_out[7:1]};
				3'b011:Data_out<={Data_out[7], Data_out[7:1]};
				3'b100:Data_out<={Data_out[6:0], LSB_in};
				3'b101:Data_out<={Data_out[6:0], Data_out[0]};
				3'b110:Data_out<={Data_out[6:0], Data_out[7]};
				default:Data_out<=Data_in;
			endcase
MSB_out<=Data_out[7];
			LSB_out<=Data_out[0];
		end 
	end
endmodule  