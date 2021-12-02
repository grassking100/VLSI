
module my_memory(Read_Data,Read_Adr,Write_Adr,Write_Data,Write_En,Clock);
	input [8:0] Read_Adr,Write_Adr;
	input [31:0] Write_Data;
	input Write_En,Clock;
	output [31:0]Read_Data;
	reg [511:0] memory[31:0];
	always @(posedge Clock)
	begin
		if(Write_En)
		begin
			memory[Write_Adr]<=Write_Data;
		end
	end
	assign Read_Data=memory[Read_Adr];
endmodule  