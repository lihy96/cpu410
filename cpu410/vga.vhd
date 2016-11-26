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
type char_index_type is array(1199 downto 0) of STD_LOGIC_VECTOR(4 downto 0);
type char_table_type is array(31 downto 0) of STD_LOGIC_VECTOR(255 downto 0);
constant Char_Space : STD_LOGIC_VECTOR(255 downto 0) := (others => '0');
constant Char_Full : STD_LOGIC_VECTOR(255 downto 0) := (others => '1');
constant Char_H : STD_LOGIC_VECTOR(0 to 255) := "0000000000000000000000000000000000110000000011000011000000001100001100000000110000110000000011000011111111111100001111111111110000110000000011000011000000001100001100000000110000110000000011000011000000001100001100000000110000000000000000000000000000000000";
constant Char_F : STD_LOGIC_VECTOR(0 to 255) := "0000000000000000000000000000000000111111111111000011111111111100001100000000000000110000000000000011111111111100001111111111110000110000000000000011000000000000001100000000000000110000000000000011000000000000001100000000000000000000000000000000000000000000";
constant Char_Y : STD_LOGIC_VECTOR(0 to 255) := "0000000000000000000000000000000011110000000011001111000000001100001111000011000000111100001100000000111111000000000011111100000000000011000000000000001100000000000000110000000000000011000000000000001100000000000000110000000000000000000000000000000000000000";
constant Char_A : STD_LOGIC_VECTOR(0 to 255) := 
"0000000000000000" & 
"0000000000000000" & 
"0000001111000000" & 
"0000001111000000" & 
"0000001111000000" & 
"0000001111000000" & 
"0000110000110000" & 
"0000110000110000" & 
"0011111111111100" & 
"0011111111111100" & 
"0011000000001100" & 
"0011000000001100" & 
"1100000000000011" & 
"1100000000000011" & 
"0000000000000000" & 
"0000000000000000";
constant Char_B : STD_LOGIC_VECTOR(0 to 255) :=
"0000000000000000" & 
"0000000000000000" & 
"0011111111110000" & 
"0011111111110000" & 
"0011000000001100" & 
"0011000000001100" & 
"0011111111110000" & 
"0011111111110000" & 
"0011000000001100" & 
"0011000000001100" & 
"0011000000000011" & 
"0011000000000011" & 
"0011111111111100" & 
"0011111111111100" & 
"0000000000000000" & 
"0000000000000000";
constant Char_C : STD_LOGIC_VECTOR(0 to 255) :=
"0000000000000000" & 
"0000000000000000" & 
"0000111111110000" & 
"0000111111110000" & 
"0011000000001100" & 
"0011000000001100" & 
"0011000000000000" & 
"0011000000000000" & 
"0011000000000000" & 
"0011000000000000" & 
"0011110000000011" & 
"0011110000000011" & 
"0000111111111100" & 
"0000111111111100" & 
"0000000000000000" & 
"0000000000000000";
constant Char_D : STD_LOGIC_VECTOR(0 to 255) :=
"0000000000000000" & 
"0000000000000000" & 
"0011111111110000" & 
"0011111111110000" & 
"0011000000111100" & 
"0011000000111100" & 
"0011000000001100" & 
"0011000000001100" & 
"0011000000001100" & 
"0011000000001100" & 
"0011000000111100" & 
"0011000000111100" & 
"0011111111110000" & 
"0011111111110000" & 
"0000000000000000" & 
"0000000000000000";
constant Char_E : STD_LOGIC_VECTOR(0 to 255) :=
"0000000000000000" & 
"0000000000000000" & 
"0011111111111100" & 
"0011111111111100" & 
"0011000000000000" & 
"0011000000000000" & 
"0011111111111100" & 
"0011111111111100" & 
"0011000000000000" & 
"0011000000000000" & 
"0011000000000000" & 
"0011000000000000" & 
"0011111111111100" & 
"0011111111111100" & 
"0000000000000000" & 
"0000000000000000"; 
constant char_table : char_table_type := (0 => Char_Space,
										1=>Char_A,
										2=>Char_B,
										3=>Char_C,
										4=>Char_D,
										5=>Char_E,
										6=>Char_F,
										others => Char_Space);
signal char_seq : char_index_type := (20 => "00001" ,21=>"00010",22=>"00011",23=>"00100",24=>"00101",25=>"00110",63 => "00001" , 64 => "00001", 65=>"00001", 255=>"00010",1197=>"00010",1198=>"00001",others => "00000");
signal halfclk : std_logic := '0';
signal posx : std_logic_vector(9 downto 0) := "0000000000";
signal posy : std_logic_vector(9 downto 0) := "0000000000";
begin
process(CLK)
	variable index : INTEGER range 0 to 31 := 0;
	variable delta_v : INTEGER range 0 to 255 := 0;
	variable x0 : INTEGER range 0 to 40 := 0;
	variable y0 : INTEGER range 0 to 30 := 0;
	variable char_no_v : INTEGER range 0 to 1199 := 0;
	variable delta_x_v : INTEGER range 0 to 15 := 0;
	variable delta_y_v : INTEGER range 0 to 15 := 0;
	begin
		if rising_edge(CLK) then
			halfclk <= not halfclk;
			case halfclk is
				when '1' =>

					if posx < "1010000000" and posy < "0111100000" then --640 480
						--R(2 downto 0) <= "000"; 
						--G(2 downto 0) <= "000"; 
						--B(2 downto 0) <= "111";
						x0 := conv_integer(to_stdlogicvector(to_bitvector(posx) srl 4));
						y0 := conv_integer(to_stdlogicvector(to_bitvector(posy) srl 4));
						delta_y_v := conv_integer(posy) - y0 * 16;
						delta_x_v := conv_integer(posx) - x0 * 16;
						char_no_v := y0 * 40;
						char_no_v := char_no_v + x0;
						delta_v := delta_y_v * 16;
						delta_v := delta_v + delta_x_v;
						delta_v := 255 - delta_v;
						index := conv_integer(char_seq(char_no_v));
						R <= (others => char_table(index)(delta_v));
						G <= (others => char_table(index)(delta_v));
						B <= (others => char_table(index)(delta_v));
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


