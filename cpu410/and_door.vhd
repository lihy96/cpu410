library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity and_door is
 	port (
           data1, data2 : in  STD_LOGIC;
           outdata : out  STD_LOGIC
	);
end entity ;

architecture bhv of and_door is
begin
	process(data1, data2)
	begin
		
		if (data1 = ZERO1 OR data2 = ZERO1) then	-- False
			outdata <= And_Door_False;
		
		elsif (data1 /= ZERO1 and data2 /= ZERO1) then	-- True
			outdata <= And_Door_True;
		
		else  -- no use
			outdata <= And_Door_No_use;
		end if;
	end process;
end bhv;