----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:46:10 12/03/2014 
-- Design Name: 
-- Module Name:    vga - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga is
    Port ( CLK : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (2 downto 0);
           G : out  STD_LOGIC_VECTOR (2 downto 0);
           B : out  STD_LOGIC_VECTOR (2 downto 0);
           HS : out  STD_LOGIC;
           VS : out  STD_LOGIC);
end vga;

architecture Behavioral of vga is

type COLOR_TYPE is record
	RR : STD_LOGIC_VECTOR(2 downto 0);
	GG : STD_LOGIC_VECTOR(2 downto 0);
	BB : STD_LOGIC_VECTOR(2 downto 0);
end record;
constant color_black : COLOR_TYPE := (others => "000");
constant color_white : COLOR_TYPE := (others => "111");
type ColorArray is array(2047 downto 0) of COLOR_TYPE;
signal char_seq : ColorArray := (20 => color_white ,63 => color_white , 64 => color_white, others => color_black);
signal halfclk : std_logic := '0';
signal posx : std_logic_vector(9 downto 0) := "0000000000";
signal posy : std_logic_vector(9 downto 0) := "0000000000";

signal out_flag : STD_LOGIC := '0';
signal delta_x : INTEGER range 0 to 9 := 0;
signal delta_y : INTEGER range 0 to 14 := 0;--åœ¨å­—ç¬¦è¡¨ä¸­çš„åç§»é�
signal char_no : INTEGER range 0 to 2047 := 0;
--signal inner_color : COLOR_TYPE := (others => "000");

begin
process(CLK)
	
	begin
		if rising_edge(CLK) then
			halfclk <= not halfclk;
			case halfclk is
				when '1' =>

					if posx < "1010000000" and posy < "0111100000" then --640 480
						--R(2 downto 0) <= "000"; 
						--G(2 downto 0) <= "000"; 
						--B(2 downto 0) <= "111";
						R <= char_seq(char_no).RR;
						G <= char_seq(char_no).GG;
						B <= char_seq(char_no).BB;

						if delta_x = 9 then
							delta_x <= 0;
							char_no <= char_no + 1;
						else
							delta_x <= delta_x + 1;
						end if;


					else
						R(2 downto 0) <= "000"; 
						G(2 downto 0) <= "000"; 
						B(2 downto 0) <= "000";
					end if;
					if posx(9 downto 0) > "1010001110" and posx(9 downto 0) < "1011101111" then --654 751
						HS <= '0';
					else
						HS <= '1';
					end if;
					if posy(9 downto 0) > "0111101000" and posy(9 downto 0) < "0111101011" then --488 491
						VS <= '0';
					else
						VS <= '1';
					end if;
					case posx is
						when "1010000000" => --640
							posx <= posx + 1;
							if delta_y = 14 then
								delta_y <= 0;
							else
								delta_y <= delta_y + 1;
								char_no  <= char_no - 64;
							end if;
						when "1100011111" => --799
							posx <= "0000000000";
							case posy is
								when "1000001100" => --524
									posy <= "0000000000";
									char_no <= 0;
								when others =>
									posy <= posy + 1;
							end case;
 						when others =>
							posx <= posx + 1;
					end case;
				when others =>
			end case;
		end if;
	end process;
end Behavioral;

