library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
use work.constants.ALL;

entity registers is
port (
	clk, rst: in std_logic;
	r1_addr, r2_addr: in std_logic_vector(3 downto 0);
	r1_data, r2_data: out std_logic_vector(15 downto 0);
	write_addr: in std_logic_vector(3 downto 0);
	write_en: in std_logic;
	write_data: in std_logic_vector(15 downto 0)
);
end entity;

architecture bhv of registers is
signal reg_array: RegArray := (others => ZeroWord);
signal r1_read_en, r2_read_en: in std_logic := ReadEnable;
begin

	process (clk)
	begin
		if falling_edge(clk) then	-- ??????????????????下降沿？？？？？
			if rst = RstEnable then
				NULL;
			elsif write_en = WriteEnable then
				reg_array(conv_integer(write_addr)) <= write_data;
			end if;
		end if;
	end process;

	process (clk, rst, r1_addr, r1_read_en, write_addr, write_data, write_en)
	begin
		if rst = RstEnable then
			r1_data <= ZeroWord;
		elsif r1_addr = write_addr and write_en = WriteEnable and r1_read_en = ReadEnable then
			r1_data <= write_data;
		elsif r1_read_en = ReadEnable then
			r1_data <= reg_array(conv_integer(r1_addr));
		else
			r1_data <= ZeroWord;
		end if;
	end process;

	process (clk, rst, r2_addr, r2_read_en, write_addr, write_data, write_en)
	begin
		if rst = RstEnable then
			r2_data <= ZeroWord;
		elsif r2_addr = write_addr and write_en = WriteEnable and r2_read_en = ReadEnable then
			r2_data <= write_data;
		elsif r1_read_en = ReadEnable then
			r2_data <= reg_array(conv_integer(r2_addr));
		else
			r2_data <= ZeroWord;
		end if;
end process;
end architecture;