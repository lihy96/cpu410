library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;

entity equal is
    Port ( 
           data1, data2 : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0)
         );
end equal;

architecture Behavioral of equal is
	signal result_origin: std_logic_vector(15 downto 0) := ZeroWord ;
begin
	result <= result_origin;
	process(data1, data2)
	begin
		if data1 = data2 then
			result_origin <= EQUAL_YES;
		else
			result_origin <= EQUAL_NO;
		end if;
	end process;
end Behavioral;


