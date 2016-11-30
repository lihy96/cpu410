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
		--pause : in STD_LOGIC;
		
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
signal INNER_OUT_ADDR : STD_LOGIC_VECTOR(15 downto 0) := ZeroWord;
signal INNER_OUT_DATA : STD_LOGIC_VECTOR(15 downto 0) := ZeroWord;
signal INNER_OUT_PC : STD_LOGIC_VECTOR(15 downto 0) := ZeroWord;
signal INNER_OUT_REG_NO : STD_LOGIC_VECTOR(3 downto 0) := IMG_REG;
signal INNER_OUT_WB_CHOOSE : WB_CHOOSE_TYPE := ALU_DATA;
signal INNER_OUT_REG_WN : STD_LOGIC := WriteDisable;

--signal pause_flag : std_logic := '0';
begin
	OUT_ADDR <= INNER_OUT_ADDR;
	OUT_DATA <= INNER_OUT_DATA;
	OUT_PC <= INNER_OUT_PC;
	OUT_REG_NO <= INNER_OUT_REG_NO;
	-- to be added : control signals
	--OUT_WB_FORWARD <= IN_WB_CONTROL.WB_FORWARD;
	OUT_WB_CHOOSE <= INNER_OUT_WB_CHOOSE;
	OUT_REG_WN <= INNER_OUT_REG_WN;
	process(CLK,IN_ADDR,IN_DATA,IN_PC,IN_REG_NO,IN_WB_CONTROL,INNER_OUT_ADDR, INNER_OUT_DATA, INNER_OUT_PC, INNER_OUT_REG_NO, INNER_OUT_WB_CHOOSE, INNER_OUT_REG_WN)
		begin
		if (rising_edge(CLK)) then
			--if(pause /= IF_ID_LATCH_PAUSE or pause_flag = '1') then
				INNER_OUT_ADDR <= IN_ADDR;
				INNER_OUT_DATA <= IN_DATA;
				INNER_OUT_PC <= IN_PC;
				INNER_OUT_REG_NO <= IN_REG_NO;
				-- to be added : control signals
				--OUT_WB_FORWARD <= IN_WB_CONTROL.WB_FORWARD;
				INNER_OUT_WB_CHOOSE <= IN_WB_CONTROL.WB_CHOOSE;
				INNER_OUT_REG_WN <= IN_WB_CONTROL.REG_WN;

			--	pause_flag <= '0';
			--else
			--	pause_flag <= '1';
			--end if;
		end if;
	end process;

end Behavioral;

