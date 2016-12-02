library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;

entity mux2 is
    Port ( 
    	   choose : in  STD_LOGIC;
           data1, data2 : in  STD_LOGIC_VECTOR (15 downto 0);
           outdata : out  STD_LOGIC_VECTOR (15 downto 0)
         );
end mux2;

architecture Behavioral of mux2 is
	signal outdata_origin: std_logic_vector(15 downto 0) := ZeroWord;
begin
	outdata <= outdata_origin;
	process(data1, data2, choose)
	begin
		case choose is
			when '0' =>
				outdata_origin <= data1;
			when '1' =>
				outdata_origin <= data2;
			when others =>
				outdata_origin <= ZeroWord;
		end case;
	end process;
end Behavioral;


