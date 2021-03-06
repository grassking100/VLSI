library IEEE;
use IEEE.numeric_std.all;
use ieee.std_logic_1164.all;
ENTITY Hw1 IS
PORT(
 A,B,C:IN unsigned(5 DOWNTO 0);
 Y:OUT unsigned(5 DOWNTO 0);
 S:IN unsigned(1 DOWNTO 0) 
);
END Hw1;
ARCHITECTURE Hw1_arch OF Hw1 IS
	PROCEDURE min(VARIABLE lhs,rhs :IN unsigned(5 DOWNTO 0);
	  			  VARIABLE output  :OUT unsigned(5 DOWNTO 0))IS
	BEGIN
		IF lhs>rhs THEN
			output:=rhs;
		ELSE
			output:=lhs;
		END IF;
	END  min;
	
	PROCEDURE vector_and(VARIABLE lhs,rhs:IN unsigned(5 DOWNTO 0);
						 VARIABLE output:OUT unsigned(5 DOWNTO 0))IS
	BEGIN
		output:=unsigned(std_logic_vector(lhs) and std_logic_vector(rhs));
	END vector_and;

BEGIN
	PROCESS(A,B,C,S)
		VARIABLE temp,temp2: unsigned(5 DOWNTO 0);
		VARIABLE v_A,v_B,v_C,v_Y: unsigned(5 DOWNTO 0);
	BEGIN
		temp:="000000";
		v_A:=A;
		v_B:=B;
		v_C:=C;
		IF s="00" THEN
			vector_and(lhs=>v_A,rhs=>v_B,output=>temp);
			vector_and(lhs=>temp,rhs=>v_C,output=>v_Y);
			Y<=v_Y;
		ELSIF S="01" THEN
			min(lhs=>v_A,rhs=>v_B,output=>temp);
			min(lhs=>temp,rhs=>v_C,output=>v_Y);
			Y<=v_Y;
		ELSIF S="10" THEN
			Y<=A(2 DOWNTO 0)*B(2 DOWNTO 0);
		ELSE
			Y<=A+C;
		END IF;
	END PROCESS;
	
END Hw1_arch; 