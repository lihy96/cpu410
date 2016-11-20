library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity inst_ram is
 	port (
 		address : in std_logic_vector(15 downto 0);
 		data: inout std_logic_vector(15 downto 0);
		en, write_en, read_en: in std_logic
	);
end entity ;




