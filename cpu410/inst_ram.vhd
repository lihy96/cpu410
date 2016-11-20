library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity inst_ram is
 	port (
		CLK : in STD_LOGIC;
		RAM_READ_WRITE : in STD_LOGIC_VECTOR(1 downto 0);
		-- data signal
		RAM_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		RAM_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		-- data output
		RAM_OUTPUT : out STD_LOGIC_VECTOR(15 downto 0);
		
		-- inner signal, out to ram
		Ram2Addr : out STD_LOGIC_VECTOR(17 downto 0);
		Ram2Data : inout STD_LOGIC_VECTOR(15 downto 0);
		Ram2OE : out STD_LOGIC;
		Ram2WE : out STD_LOGIC;
		Ram2EN : out STD_LOGIC
	);
end entity ;

architecture Behavioral of inst_ram is
	type state_set is (
		init,
		writing,
		reading
	);
	signal state : state_set := init;
	
begin
	process(CLK)
		begin
		if (CLK'event and CLK = '1') then
			case state is
				when init =>
					if RAM_READ_WRITE = MEM_WRITE then --内存�
						state <= writing;
						Ram2EN <= '0';
						Ram2OE <= '1';
						Ram2WE <= '1';
						Ram2Data <= RAM_DATA;
						Ram2Addr <= "00" & RAM_ADDR;
					elsif RAM_READ_WRITE = MEM_READ then --内存�
						state <= reading;
						Ram2EN <= '0';
						Ram2OE <= '1';
						Ram2WE <= '1';
						Ram2Data <= "ZZZZZZZZZZZZZZZZ";
						Ram2Addr <= "00" & RAM_ADDR;
					end if;
						
				when writing =>
					Ram2WE <= '0';
					RAM_OUTPUT <= "1111111111111111";
					state <= init;
				
				when reading =>
					Ram2OE <= '0';
					RAM_OUTPUT <= Ram2Data;
					state <= init;
					
			end case;
		end if;
	end process;
end Behavioral;


