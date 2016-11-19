----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:26 11/18/2016 
-- Design Name: 
-- Module Name:    constants - Behavioral 
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
use ieee.numeric_std.all;

package constants is
	constant Pc_reset: std_logic := '1';
	constant Pc_pause: std_logic := '1';
	constant Pc_origin_address : std_logic_vector(15 downto 0) := "0000000000000000";
	constant Pc_offset: std_logic_vector(15 downto 0) := "0000000000000001";
	
	-- added by evan69
	-- constant defination for ex_mem_latch to MEM
	constant MEM_READ : STD_LOGIC_VECTOR(1 downto 0) := "01"; --控制数据存储器进行读
	constant MEM_WRITE : STD_LOGIC_VECTOR(1 downto 0) := "10"; --控制数据存储器进行写
	
	-- control signal : WB_CHOOSE
	type WB_CHOOSE_TYPE is (
		ALU,
		MEM,
		PC
	);
	
	-- record type for write back control signal
	type WB_CONTROL_SIGNAL_TYPE is record
		WB_FORWARD : STD_LOGIC;
		WB_CHOOSE : WB_CHOOSE_TYPE;
		REG_WN : STD_LOGIC;
	end record;
end package;



