entity hw2 is
	port(
			D_in,clk:in bit;
			B:out bit_vector(2 downto 0)
	     );
end entity hw2;

architecture hw2_arch of hw2 is
signal reg:bit_vector(3 downto 0):="0000";
signal A:bit_vector(3 downto 0):="0000";
begin
	process(clk,A,D_in,reg) is
	begin
		if clk'EVENT and clk='1'
		then
			reg(0)<=D_in;
			for i in 3 downto 1 loop
				reg(i)<=reg(i-1);
			end loop;
		end if; 
		A<=reg;
		case A is
			when "0000"=>B<="110";
			when "0001"=>B<="101";
			when "0010"=>B<="111";
			when "0011"=>B<="001";
			when "0100"=>B<="100";
			when "0101"=>B<="101";
			when "0110"=>B<="110";
			when "0111"=>B<="011";
			when "1000"=>B<="010";
			when "1001"=>B<="000";
			when "1010"=>B<="111";
			when "1011"=>B<="001";
			when "1100"=>B<="101";
			when "1101"=>B<="010";
			when "1110"=>B<="100";
			when others => B<="111";
		 end case;
	end process;
end architecture hw2_arch;
