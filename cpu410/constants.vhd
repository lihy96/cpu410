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
	constant Pc_reset: std_logic := 1;
	constant Pc_pause: std_logic := 1;
	constant Pc_origin_address : std_logic_vector(15 downto 0) := "0000000000000000";
	constant Pc_offset: std_logic_vector(15 downto 0) := "0000000000000001";
	
	
end package;



