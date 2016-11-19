library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity adder is
	port(
		pc : in STD_LOGIC_VECTOR(15 downto 0);
		imm : in STD_LOGIC_VECTOR(15 downto 0);
		pc_output : out STD_LOGIC_VECTOR(15 downto 0)
	);
end adder;

architecture Behavioral of adder is
begin
	pc_output <= pc + imm;
end Behavioral;