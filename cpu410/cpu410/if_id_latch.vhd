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
		clk, rst: in std_logic;
		pc_in, inst_in: in std_logic_vector(15 downto 0);
		all_pause_signal: in std_logic_vector(0 to 4);
		pc_out, inst_out: in std_logic_vector(15 downto 0)
	  );
end if_id_latch;

architecture Behavioral of if_id_latch is

begin
	process
	begin
	
	end process;

end Behavioral;

