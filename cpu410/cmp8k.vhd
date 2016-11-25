library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;


entity cmp8k is
	port (
		data_in: in std_logic_vector(15 downto 0);
		res : out std_logic
	  );
end cmp8k;


architecture Behavioral of cmp8k is
signal res_origin: std_logic := '0' ;
begin
	res <= res_origin;
	process(data_in)
	begin
		if data_in >= x"8000" then
			res_origin <= Data_ram1;
		else
			res_origin <= Inst_ram2;
		end if;
	end process;
end Behavioral;