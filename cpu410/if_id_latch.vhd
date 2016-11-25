----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:50:42 11/18/2016 
-- Design Name: 
-- Module Name:    if_id_latch - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use work.constants.all;

entity if_id_latch is
	port (
		clk: in std_logic;
		pause: in std_logic;
		in_pc,  in_pc_plus1,  in_inst:   in std_logic_vector(15 downto 0);
		out_pc, out_pc_plus1, out_inst: out std_logic_vector(15 downto 0)

	  );
end if_id_latch;

architecture Behavioral of if_id_latch is
	signal out_pc_origin: std_logic_vector(15 downto 0) := ZeroWord;
	signal out_pc_plus1_origin: std_logic_vector(15 downto 0) := ZeroWord;
	signal out_inst_origin: std_logic_vector(15 downto 0) := ZeroWord;
begin
	out_pc <= out_pc_origin;
	out_pc_plus1 <= out_pc_plus1_origin;
	out_inst <= out_inst_origin;
process(clk)
	begin
	if rising_edge(clk) then
		if pause /= IF_ID_LATCH_PAUSE then
			out_pc_origin <= in_pc;
			out_pc_plus1_origin <= in_pc_plus1;
			out_inst_origin <= in_inst;
		end if;
	end if;
end process;
end Behavioral;


