library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity registers is
port (
	clk, rst: in std_logic;
	r1_addr, r2_addr: in std_logic_vector(3 downto 0);
	r1_read_en, r2_read_en: in std_logic;
	r1_data, r2_data: out std_logic_vector(15 downto 0)
	write_addr: in std_logic_vector(3 downto 0);
	write_en: in std_logic;
	write_data: in std_logic_vector(15 downto 0)
);
end entity;

architecture bhv of registers is


end architecture;