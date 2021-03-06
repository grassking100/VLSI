entity traffic_light_controller is
	port(
	S1,S2,clk:in bit;
	R1,Y1,G1,R2,Y2,G2:out bit
	);
end entity;

architecture arch_traffic_light_controller of traffic_light_controller is
	type state_status is (state_1,state_2,state_3,state_4,state_5,state_6,state_7,state_8,state_9,state_10);
	signal present_state,next_state: state_status;
begin

	process(present_state,S1,S2)
	begin
		R1<='0';
		G1<='0';
		Y1<='0';
		G2<='0';
		R2<='0';
		Y2<='0';
		case present_state is
			when state_1=>
				next_state<=state_2;
				R1<='1';
				G2<='1';				
			when state_2=>
				next_state<=state_3;
				R1<='1';
				G2<='1';
			when state_3=>
				next_state<=state_4;
				R1<='1';
				G2<='1';
			when state_4=>
				if (S1='1') then
					next_state<=state_5;
				else
					next_state<=state_4;
				end if;
				R1<='1';
				G2<='1';
			when state_5=>
				next_state<=state_6;
				Y1<='1';
				Y2<='1';
			when state_6=>
				next_state<=state_7;
				G1<='1';
				R2<='1';
			when state_7=>
				next_state<=state_8;
				G1<='1';
				R2<='1';
			when state_8=>
				next_state<=state_9;
				G1<='1';
				R2<='1';
			when state_9=>
				if(S2='1') then
					next_state<=state_10;
				else
					next_state<=state_9;
				end if;
				G1<='1';
				R2<='1';
			when state_10=>
				next_state<=state_1;
				Y1<='1';
				Y2<='1';
			end case;
	end process;
	process(clk)
	begin
		if( clk'EVENT and clk = '1') then
			present_state <=next_state;
		end if;
	end process;

end architecture;