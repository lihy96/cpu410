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
		IN_WB_CTRL : in WB_CONTROL_TYPE;
		IN_MEM_CTRL : in MEM_CTRL_TYPE;
		IN_CMP_RS : in STD_LOGIC; --对读写地址进行比较后的结果
		
		-- control signal output
		OUT_WB_CONTROL : out WB_CONTROL_TYPE;
		OUT_RAM1_READ_WRITE : out STD_LOGIC_VECTOR(1 downto 0);
		OUT_RAM2_READ_WRITE : out STD_LOGIC_VECTOR(1 downto 0)
		-- OUT_MEM_FORWARD : out STD_LOGIC
	);
end ex_mem_latch;

architecture Behavioral of ex_mem_latch is
signal INNER_OUT_ADDR : STD_LOGIC_VECTOR(15 downto 0) := ZeroWord;
signal INNER_OUT_DATA : STD_LOGIC_VECTOR(15 downto 0) := ZeroWord;
signal INNER_OUT_PC : STD_LOGIC_VECTOR(15 downto 0) := ZeroWord;
signal INNER_OUT_REG_NO : STD_LOGIC_VECTOR(3 downto 0) := IMG_REG;
signal INNER_OUT_WB_CONTROL : WB_CONTROL_TYPE := (	WB_CHOOSE => ALU_DATA,
													REG_WN => WriteDisable);
signal INNER_OUT_RAM1_READ_WRITE : STD_LOGIC_VECTOR(1 downto 0) := MEM_NONE;
signal INNER_OUT_RAM2_READ_WRITE : STD_LOGIC_VECTOR(1 downto 0) := MEM_READ;
begin
	OUT_ADDR <= INNER_OUT_ADDR;
	OUT_DATA <= INNER_OUT_DATA;
	OUT_PC <= INNER_OUT_PC;
	OUT_REG_NO <= INNER_OUT_REG_NO;
	OUT_WB_CONTROL <= INNER_OUT_WB_CONTROL;
	OUT_RAM1_READ_WRITE <= INNER_OUT_RAM1_READ_WRITE;--读写RAM1
	OUT_RAM2_READ_WRITE <= INNER_OUT_RAM2_READ_WRITE; --不读不写RAM2
	process(CLK,IN_ADDR,IN_DATA,IN_PC,IN_REG_NO,IN_WB_CTRL,IN_MEM_CTRL,IN_CMP_RS,
		INNER_OUT_ADDR,INNER_OUT_DATA,INNER_OUT_PC,INNER_OUT_REG_NO,INNER_OUT_WB_CONTROL,INNER_OUT_RAM2_READ_WRITE,INNER_OUT_RAM1_READ_WRITE)
		begin
		if (CLK'event and CLK = '1') then
			INNER_OUT_ADDR <= IN_ADDR;
			INNER_OUT_DATA <= IN_DATA;
			INNER_OUT_PC <= IN_PC;
			INNER_OUT_REG_NO <= IN_REG_NO;
			-- to be added : control signals
			--OUT_WB_CONTROL <= IN_WB_CTRL.WB_CONTROL_SIGNAL;
			INNER_OUT_WB_CONTROL <= IN_WB_CTRL;
			
			--if (IN_CMP_RS = Data_ram1) then --读的是RAM1
			--	INNER_OUT_RAM1_READ_WRITE <= IN_MEM_CTRL.RAM_READ_WRITE;--读写RAM1
			--	INNER_OUT_RAM2_READ_WRITE <= MEM_READ; --不读不写RAM2
			--else
			--	INNER_OUT_RAM1_READ_WRITE <= "11"; --不读不写RAM1
			--	INNER_OUT_RAM2_READ_WRITE <= IN_MEM_CTRL.RAM_READ_WRITE; --读写RAM2
			--end if;
			INNER_OUT_RAM1_READ_WRITE <= IN_MEM_CTRL.RAM_READ_WRITE;
			if IN_CMP_RS = Inst_ram2 and IN_MEM_CTRL.RAM_READ_WRITE = MEM_WRITE then
				INNER_OUT_RAM2_READ_WRITE <= MEM_WRITE;
			else
				INNER_OUT_RAM2_READ_WRITE <= MEM_READ;
			end if;
		end if;
	end process;

end Behavioral;

