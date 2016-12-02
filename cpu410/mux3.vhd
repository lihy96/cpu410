library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;


entity mux3 is
    Port ( 
    	   data1, data2 , data3  : in  STD_LOGIC_VECTOR (15 downto 0) ;
           choose : in  STD_LOGIC_VECTOR (1 downto 0) ;
           outdata : out  STD_LOGIC_VECTOR (15 downto 0) 
	);
end mux3;

architecture Behavioral of mux3 is
	signal outdata_origin: std_logic_vector(15 downto 0) := ZeroWord;
begin
	outdata <= outdata_origin;
	process(data1, data2, data3, choose)
	begin
		case choose is
			when "00" =>
				outdata_origin <= data1;
			when "01" =>
				outdata_origin <= data2;
			when "10" =>
				outdata_origin <= data3;
			when others =>
				outdata_origin <= ZeroWord;
		end case;
	end process;
end Behavioral;