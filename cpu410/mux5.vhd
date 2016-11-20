library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;


entity mux4 is
    Port ( 
    	   data1, data2 , data3, data4  : in  STD_LOGIC_VECTOR (15 downto 0) ;
           choose : in  STD_LOGIC_VECTOR (1 downto 0) ;
           outdata : out  STD_LOGIC_VECTOR (15 downto 0) 
	);
end mux4;

architecture Behavioral of mux4 is
begin
	process(data1, data2, data3, data4, choose)
	begin
		case choose is
			when "00" =>
				outdata <= data1;
			when "01" =>
				outdata <= data2;
			when "10" =>
				outdata <= data3;
			when "11" =>
				outdata <= data4;
			when others =>
				outdata <= HIGH_RESIST;
		end case;
	end process;
end Behavioral;