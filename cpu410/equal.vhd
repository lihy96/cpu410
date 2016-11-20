library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;

entity equal is
    Port ( 
           data1. data2 : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0)
         );
end equal;

architecture Behavioral of equal is

begin
	process(data1, data2)
	begin
		if data1 = data2 then
			result = EQUAL_YES;
		else
			result = EQUAL_NO;
		end if;
	end process;
end Behavioral;


