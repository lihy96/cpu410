----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:32 11/30/2014 
-- Design Name: 
-- Module Name:    Clock - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myclock is
    Port ( 
				Reset: in std_logic;
				Clock_50 : in  STD_LOGIC;
				Clock_50_out : out  STD_LOGIC;
				Clock_25_out : out  STD_LOGIC;
				Clock_12_out : out  STD_LOGIC);
end myclock;

architecture Behavioral of myclock is
	shared variable count: integer := 0;
	shared variable count1: integer := 0;
	shared variable count2: integer := 0;
	
	signal Clock_25_tmp: std_logic;
	signal Clock_12_tmp: std_logic;
	
begin
	Clock_50_out <= Clock_50;
	Clock_25_out <= Clock_25_tmp;
	Clock_12_out <= Clock_12_tmp;
	
	process (Clock_50, Reset)
	begin
		if (Reset = '0') then
			count1 := 0;
			count2 := 0;
			Clock_25_tmp <= '0';
			Clock_12_tmp <= '0';
		elsif falling_edge(Clock_50) then
			if (count > Clock_wait_num_before_work) then	-- you can use this to do something
				
				count1 := count1 + 1;
				
				if (count1 = 1) then
					Clock_25_tmp <= not Clock_25_tmp;
					count1 := 0;
				end if;
				
				count2 := count2 + 1;
				if (count2 = 8) then
					Clock_12_tmp <= not Clock_12_tmp;
					count2 := 0;
				end if;
			else
				count := count + 1;
			end if;
		end if;
	end process;

end Behavioral;

