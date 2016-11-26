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
type char_index_type is array(2399 downto 0) of STD_LOGIC_VECTOR(4 downto 0);
type char_table_type is array(31 downto 0) of STD_LOGIC_VECTOR(127 downto 0);
constant Char_Space : STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
constant Char_Full : STD_LOGIC_VECTOR(127 downto 0) := (others => '1');
constant Char_a : STD_LOGIC_VECTOR(127 downto 0) := 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00111100" & 
"01000010" & 
"00000010" & 
"00011110" & 
"00100010" & 
"01000010" & 
"01000110" & 
"00111011" & 
"00000000";
constant Char_b : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01011100" & 
"01100010" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01100010" & 
"01011100" & 
"00000000";
constant Char_c : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00011110" & 
"00100001" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"00100001" & 
"00011110" & 
"00000000";
constant Char_d : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000001" & 
"00000001" & 
"00000001" & 
"00000001" & 
"00000001" & 
"00011101" & 
"00100011" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"00100011" & 
"00011101" & 
"00000000";
constant Char_e : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00011100" & 
"00100010" & 
"01000001" & 
"01111111" & 
"01000000" & 
"01000000" & 
"00100001" & 
"00011110" & 
"00000000";
constant Char_f : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00001100" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"01111100" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00000000";
constant Char_g : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00011101" & 
"00100010" & 
"00100010" & 
"00011100" & 
"00100000" & 
"00111110" & 
"01000001" & 
"01000001" & 
"00111110";
constant Char_h : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01011100" & 
"01100010" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"00000000";
constant Char_i : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00001000" & 
"00001000" & 
"00000000" & 
"00000000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00000000";
constant Char_j : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00001000" & 
"00001000" & 
"00000000" & 
"00000000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00110000";
constant Char_k : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000000" & 
"01000010" & 
"01000100" & 
"01001000" & 
"01010000" & 
"01101000" & 
"01000100" & 
"01000010" & 
"01000001" & 
"00000000";
constant Char_l : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00001000" & 
"00000000";
constant Char_m : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01010110" & 
"01101001" & 
"01001001" & 
"01001001" & 
"01001001" & 
"01001001" & 
"01001001" & 
"01001001" & 
"00000000";
constant Char_n : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01011100" & 
"01100010" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"00000000";
constant Char_o : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00011100" & 
"00100010" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"00100010" & 
"00011100" & 
"00000000";
constant Char_p : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01011100" & 
"01100010" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01100010" & 
"01011100" & 
"01000000" & 
"01000000";
constant Char_q : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00011101" & 
"00100011" & 
"01000001" & 
"01000001" & 
"01000001" & 
"00100011" & 
"00011101" & 
"00000001" & 
"00000001";
constant Char_r : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00010111" & 
"00011000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00000000";
constant Char_s : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00111110" & 
"01000001" & 
"01000000" & 
"00110000" & 
"00001110" & 
"00000001" & 
"01000001" & 
"00111110" & 
"00000000";
constant Char_t : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"01111100" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00010000" & 
"00001100" & 
"00000000";
constant Char_u : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"01000001" & 
"00100011" & 
"00011101" & 
"00000000";
constant Char_v : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01000001" & 
"01000001" & 
"00100010" & 
"00100010" & 
"00010100" & 
"00010100" & 
"00001000" & 
"00001000" & 
"00000000";
constant Char_w : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01001001" & 
"01001001" & 
"01001001" & 
"01010101" & 
"01010101" & 
"00100010" & 
"00100010" & 
"00100010" & 
"00000000";
constant Char_x : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01000001" & 
"00100010" & 
"00010100" & 
"00001000" & 
"00001000" & 
"00010100" & 
"00100010" & 
"01000001" & 
"00000000";
constant Char_y : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01000001" & 
"01000001" & 
"00100010" & 
"00100010" & 
"00010100" & 
"00010100" & 
"00001000" & 
"00010000" & 
"01100000";
constant Char_z : STD_LOGIC_VECTOR(127 downto 0) :=
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"00000000" & 
"01111111" & 
"00000010" & 
"00000100" & 
"00001000" & 
"00010000" & 
"00100000" & 
"01000000" & 
"01111111" & 
"00000000";
constant char_table : char_table_type := (
0 => Char_Full,
1=> Char_a,
2=> Char_b,
3=> Char_c,
4=> Char_d,
5=> Char_e,
6=> Char_f,
7=> Char_g,
8=> Char_h,
9=> Char_i,
10=> Char_j,
11=> Char_k,
12=> Char_l,
13=> Char_m,
14=> Char_n,
15=> Char_o,
16=> Char_p,
17=> Char_q,
18=> Char_r,
19=> Char_s,
20=> Char_t,
21=> Char_u,
22=> Char_v,
23=> Char_w,
24=> Char_x,
25=> Char_y,
26=> Char_z,
others => Char_Space);
signal char_seq : char_index_type := 
(1=>"01000",2 => "00101" ,3=>"01100",4=>"01100",5=>"01111",7=>"10111",8=>"01111",9=>"10010",10=>"01100",11=>"00100",
24=>"00101",25=>"00110",63 => "00001" , 64 => "00001", 79=>"00001", 169=>"00001",1197=>"00010",1198=>"00000",others => "11111");
signal halfclk : std_logic := '0';
signal posx : std_logic_vector(9 downto 0) := "0000000000";
signal posy : std_logic_vector(9 downto 0) := "0000000000";
begin
process(CLK)
	variable index : INTEGER range 0 to 31 := 0;
	variable delta_v : INTEGER range 0 to 127 := 0;
	variable x0 : INTEGER range 0 to 79 := 0;
	variable y0 : INTEGER range 0 to 29 := 0;
	variable char_no_v : INTEGER range 0 to 2399 := 0;
	variable delta_x_v : INTEGER range 0 to 7 := 0;
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
						x0 := conv_integer(to_stdlogicvector(to_bitvector(posx) srl 3));
						y0 := conv_integer(to_stdlogicvector(to_bitvector(posy) srl 4));
						delta_y_v := conv_integer(posy) - y0 * 16;
						delta_x_v := conv_integer(posx) - x0 * 8;
						char_no_v := y0 * 80;
						char_no_v := char_no_v + x0;
						delta_v := delta_y_v * 8;
						delta_v := delta_v + delta_x_v;
						delta_v := 127 - delta_v;
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


