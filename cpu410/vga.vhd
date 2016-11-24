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
           RST : in  STD_LOGIC;
			  --DATA : in STD_LOGIC_VECTOR (15 downto 0); -- 000 000 00 0000 0000
			-- L : out STD_LOGIC_VECTOR (15 downto 0);
           R : out  STD_LOGIC_VECTOR (2 downto 0);
           G : out  STD_LOGIC_VECTOR (2 downto 0);
           B : out  STD_LOGIC_VECTOR (2 downto 0);
           HS : out  STD_LOGIC;
           VS : out  STD_LOGIC);
end vga;

architecture Behavioral of vga is

signal recx : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";  --000
signal recy : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";  --001
signal size : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";  --010
signal colr : STD_LOGIC_VECTOR (2 downto 0) := "000"; --011
signal colg : STD_LOGIC_VECTOR (2 downto 0) := "000"; --100
signal colb : STD_LOGIC_VECTOR (2 downto 0) := "000"; --101
--signal static : std_logic_vector(9 downto 0) := "0000100000";
--signal color : std_logic_vector(2 downto 0) := "101";
signal halfclk : std_logic := '0';
signal posx : std_logic_vector(9 downto 0) := "0000000000";
signal posy : std_logic_vector(9 downto 0) := "0000000000";

begin
process(CLK)
	begin
		if rising_edge(CLK) then
			--case DATA(15 downto 13) is
			--	when "000" => recx(9 downto 0) <= DATA(9 downto 0);
			--	when "001" => recy(9 downto 0) <= DATA(9 downto 0);
			--	when "010" => size(9 downto 0) <= DATA(9 downto 0);
			--	when "011" => colr(2 downto 0) <= DATA(2 downto 0);
			--	when "100" => colg(2 downto 0) <= DATA(2 downto 0);
			--	when "101" => colb(2 downto 0) <= DATA(2 downto 0);
			--	when others =>
			--end case;
			halfclk <= not halfclk;
			case halfclk is
				when '1' =>
					--if posx(9 downto 0) > static(9 downto 0) and posx(9 downto 0) < (static(9 downto 0)+static(9 downto 0)) and posy(9 downto 0) > static(9 downto 0) and posy(9 downto 0) < (static(9 downto 0)+static(9 downto 0)) then
					--if posx(9 downto 0) > recx(9 downto 0) and posx(9 downto 0) < (recx(9 downto 0)+size(9 downto 0)) and posy(9 downto 0) > recy(9 downto 0) and posy(9 downto 0) < (recy(9 downto 0)+size(9 downto 0)) then
					--	R(2 downto 0) <= colr(2 downto 0); 
					--	G(2 downto 0) <= colg(2 downto 0); 
					--	B(2 downto 0) <= colb(2 downto 0);
					--else
					--	R(2 downto 0) <= "000"; 
					--	G(2 downto 0) <= "000"; 
					--	B(2 downto 0) <= "000";
					--end if;
					if posx < "1010000000" and posy < "0111100000" then --640 480
						R(2 downto 0) <= "000"; 
						G(2 downto 0) <= "000"; 
						B(2 downto 0) <= "111";
					else
						R(2 downto 0) <= "000"; 
						G(2 downto 0) <= "000"; 
						B(2 downto 0) <= "000";
					end if;
					-- L(9 downto 0) <= posx;
					-- L(15 downto 10) <= "000000";
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
						when "1100011111" => --799
							posx <= "0000000000";
							case posy is
								when "1000001100" => --524
									posy <= "0000000000";
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

