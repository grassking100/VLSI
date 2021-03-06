library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity up_down_counter is
	generic(K:integer:=12);
	port(clk,clr,up_dn,ld :in std_logic;
		din:in std_logic_vector(K-1 downto 0);
		dout:out std_logic_vector(K-1 downto 0)
		);
end entity up_down_counter;
architecture up_down_counter_arch of up_down_counter is
signal memory:std_logic_vector(K-1 downto 0):=std_logic_vector(to_unsigned(0, K));
begin
	process(clk,clr)
	begin
		if clr='0' then
			memory<=std_logic_vector(to_unsigned(0, K));
		else
			if clk'EVENT and clk='1' then
				if (ld='0') then
					memory<=din;
				else 
					if (up_dn='1') then
						memory<=memory+'1';
					else
						memory<=memory-'1';
					end if;
				end if;
				
			end if;
		end if;
	end process;
	process(memory)
	begin
		dout<=memory;
	end process;
end architecture up_down_counter_arch ;