----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:16:57 11/18/2016 
-- Design Name: 
-- Module Name:    mem_wb_latch - Behavioral 
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

entity mem_wb_latch is
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
		IN_WB_CONTROL : in WB_CONTROL_TYPE;
		
		-- control signal output
		--OUT_WB_FORWARD : out STD_LOGIC;
		OUT_WB_CHOOSE : out WB_CHOOSE_TYPE;
		OUT_REG_WN : out STD_LOGIC
		
	);
end mem_wb_latch;

architecture Behavioral of mem_wb_latch is

begin
	process(CLK)
		begin
		if (CLK'event and CLK = '1') then
			OUT_ADDR <= IN_ADDR;
			OUT_DATA <= IN_DATA;
			OUT_PC <= IN_PC;
			OUT_REG_NO <= IN_REG_NO;
			-- to be added : control signals
			--OUT_WB_FORWARD <= IN_WB_CONTROL.WB_FORWARD;
			OUT_WB_CHOOSE <= IN_WB_CONTROL.WB_CHOOSE;
			OUT_REG_WN <= IN_WB_CONTROL.REG_WN;
		end if;
	end process;

end Behavioral;

