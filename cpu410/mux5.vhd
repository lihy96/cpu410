library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;


entity mux5 is
    Port ( 
    	   data1, data2 , data3, data4, data5  : in  STD_LOGIC_VECTOR (15 downto 0) ;
           choose : in  STD_LOGIC_VECTOR (2 downto 0) ;
           outdata : out  STD_LOGIC_VECTOR (15 downto 0) 
	);
end mux5;

architecture Behavioral of mux5 is
	signal outdata_origin: std_logic_vector(15 downto 0) := ZeroWord;
begin
	outdata <= outdata_origin;
	process(data1, data2, data3, data4, data5, choose)
	begin
		case choose is
			when "000" =>
				outdata <= data1;
			when "001" =>
				outdata <= data2;
			when "010" =>
				outdata <= data3;
			when "011" =>
				outdata <= data4;
			when "100" => 
				outdata <= data5;
			when others =>
				outdata <= HIGH_RESIST;
		end case;
	end process;
end Behavioral;