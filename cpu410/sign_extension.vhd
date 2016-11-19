library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sign_extension is
	port(
		pc_old : in STD_LOGIC_VECTOR(15 downto 0);
		imm : in STD_LOGIC_VECTOR(15 downto 0);
		 : out STD_LOGIC_VECTOR(15 downto 0)
	);
end sign_extension;

architecture Behavioral of sign_extension is
begin
	process(pc_old)
	begin
		pc_new <= pc_old + imm;
	end process;
end Behavioral;