library ieee;
library std;
use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity test_bench is
	generic(test_K:integer:=12);
end entity test_bench;

architecture test_bench_arch of test_bench is
	signal test_clk,test_clr,test_up_dn,test_ld:std_logic;
	signal test_din:std_logic_vector(test_K-1 downto 0);
	signal test_dout:std_logic_vector(test_K-1 downto 0);
	signal uninitialValue:std_logic_vector(test_K-1 downto 0);
	component up_down_counter is
		generic(K:integer:=12);
		port(clk,clr,up_dn,ld :in std_logic;
			din:in std_logic_vector(K-1 downto 0);
			dout:out std_logic_vector(K-1 downto 0)
		);
	end component up_down_counter;
begin
	test_clk <= '1' after 50 ns when test_clk='0' else '0' after 50 ns; 
	COM1:up_down_counter generic map(K=>test_K) port map(clk=>test_clk,clr=>test_clr,up_dn=>test_up_dn,ld=>test_ld,din=>test_din,dout=>test_dout);
	process
	  file input_file : text is in "input_data.txt";
	  variable input_line : line;
	  variable temp : std_logic_vector(test_K+2 downto 0); 
	begin
		while not endfile(input_file) loop
			wait until test_clk'EVENT and test_clk='1';
			readline(input_file,input_line);
			read(input_line,temp);  
			test_din <= temp(test_K+2 downto 3);
			test_clr <= temp(2);
			test_up_dn <= temp(1);
			test_ld <= temp(0);
		end loop;
		wait;
	end process;
	process(test_dout)
		file output_file : text is out "output_data.txt";
		variable output_line : line;
	begin
		if(test_dout /= uninitialValue)then
			write(output_line,test_dout);
			writeline(output_file,output_line);
		end if;
	end process; 
end architecture test_bench_arch;

