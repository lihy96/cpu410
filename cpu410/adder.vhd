library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity adder is
	port(
		pc_old : in STD_LOGIC_VECTOR(15 downto 0);
		imm : in STD_LOGIC_VECTOR(15 downto 0);
		pc_new : out STD_LOGIC_VECTOR(15 downto 0)
	);
end adder;

architecture Behavioral of adder is
begin
	process(pc_old, imm)
	begin
		pc_new <= pc_old + imm;
	end process;
end Behavioral;

