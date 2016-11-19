----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:10:23 11/19/2016 
-- Design Name: 
-- Module Name:    ex_mem_latch - Behavioral 
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
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex_mem_latch is
	Port ( 
		CLK : in STD_LOGIC;
		
		-- data input
		IN_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		IN_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_PC : in STD_LOGIC_VECTOR(15 downto 0);
		IN_REG_NO : in STD_LOGIC_VECTOR(3 downto 0);
		
		-- data output
		OUT_ADDR : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_DATA : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_PC : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_REG_NO : out STD_LOGIC_VECTOR(3 downto 0);
		
		-- control signal input
		IN_WB_CONTROL_SIGNAL : in WB_CONTROL_SIGNAL_TYPE;
		IN_RAM_READ_WRITE : in STD_LOGIC_VECTOR(1 downto 0);
		IN_RAM1_WE : in STD_LOGIC;
		
		-- control signal output
		OUT_WB_CONTROL_SIGNAL : out WB_CONTROL_SIGNAL_TYPE;
		OUT_RAM_READ_WRITE : out STD_LOGIC_VECTOR(1 downto 0);
		OUT_RAM1_WE : out STD_LOGIC
	);
end ex_mem_latch;

architecture Behavioral of ex_mem_latch is

begin
	process(CLK)
		begin
		if (CLK'event and CLK = '1') then
			OUT_ADDR <= IN_ADDR;
			OUT_DATA <= IN_DATA;
			OUT_PC <= IN_PC;
			OUT_REG_NO : IN_REG_NO;
			-- to be added : control signals
			OUT_WB_CONTROL_SIGNAL <= IN_WB_CONTROL_SIGNAL;
		end if;
	end process;

end Behavioral;

