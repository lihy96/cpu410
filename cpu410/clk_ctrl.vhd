----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:31 11/24/2016 
-- Design Name: 
-- Module Name:    clk_ctrl - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_ctrl is
	port(
		clk : in STD_LOGIC;
		origin_clk : out STD_LOGIC;
		half_clk : out STD_LOGIC;
		quarter_clk : out STD_LOGIC
	);
end clk_ctrl;

architecture Behavioral of clk_ctrl is
signal count : STD_LOGIC_VECTOR(2 downto 0) := "111";
begin
	process(clk,count)
	begin
		if(rising_edge(clk)) then
			count <= count + "001";		
		end if;
		quarter_clk <= not count(2);
		half_clk <= not count(1);
		origin_clk <= not count(0);
	end process;

end Behavioral;

