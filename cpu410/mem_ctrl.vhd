----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:30:58 11/18/2016 
-- Design Name: 
-- Module Name:    mem_ctrl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem_ctrl is
	port(
		-- control signal
		CLK : in STD_LOGIC;
		RAM_READ_WRITE : in STD_LOGIC_VECTOR(1 downto 0);
		-- data signal
		RAM_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		RAM_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		-- data output
		RAM_OUTPUT : out STD_LOGIC_VECTOR(15 downto 0);
		
		-- inner signal, out to ram
		Ram2Addr : out STD_LOGIC_VECTOR(15 downto 0);
		Ram2Data : inout STD_LOGIC_VECTOR(15 downto 0);
		Ram2OE : out STD_LOGIC;
		Ram2WE : out STD_LOGIC;
		Ram2EN : out STD_LOGIC
	);
end mem_ctrl;

architecture Behavioral of mem_ctrl is
	type state_set is (
		init,
		writing,
		reading
	);
	signal state : state_set := init;
	constant MEM_READ : STD_LOGIC_VECTOR(1 downto 0) := "01";
	constant MEM_WRITE : STD_LOGIC_VECTOR(1 downto 0) := "10";
begin
	process(CLK)
		begin
		if (CLK'event and CLK = '0') then
			case state is
				when init =>
					Ram2EN <= '0';
					--Ram2EN <= '0';
					if RAM_READ_WRITE = MEM_WRITE then
						state <= writing;
						Ram2OE <= '1';
						Ram2WE <= '1';
						Ram2Data <= RAM_DATA;
						Ram2Addr <= RAM_ADDR;
					elsif RAM_READ_WRITE = MEM_READ then
						state <= reading;
						Ram2OE <= '1';
						Ram2WE <= '1';
						Ram2Data <= "ZZZZZZZZZZZZZZZZ";
						Ram2Addr <= RAM_ADDR;
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

