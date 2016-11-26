library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.constants.all;

entity fake_ram1 is
  port (
	clk: in std_logic;
	ram_read_write: in std_logic_vector(1 downto 0) ;
	in_addr: in std_logic_vector(15 downto 0) ;
	in_data: in std_logic_vector(15 downto 0) ;
	out_data: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- fake_ram1

architecture Behavioral of fake_ram1 is
	type RAM_type is array(4095 downto 0) of std_logic_vector(15 downto 0) ;
	type read_state is ( read_set, read_holding);
	type write_state is (write_set, write_holding);
	signal ram: RAM_type := (others => ZeroWord);
	signal rs: read_state := read_set;
	signal ws: write_state := write_set;
	signal data: std_logic_vector(15 downto 0) ;
	--signal addr: std_logic_vector(15 downto 0) ;
begin
	process(clk)
	begin
		if falling_edge(clk) then
		case( ram_read_write ) is
		when MEM_READ =>
			case(rs) is
			when read_set =>
				data <= ram(conv_integer(in_addr(11 downto 0)));
				rs <= read_holding;
			when read_holding =>
				rs <= read_set;
				out_data <= data;
			end case;
		when MEM_WRITE =>
			case(ws) is
			when write_set =>
				data <= in_data;
				ws <= write_holding;
			when write_holding =>
				ram(conv_integer(in_addr(11 downto 0))) <= data;
				ws <= write_set;
			end case;
		when others =>
			out_data <= HIGH_RESIST;
		end case ;
		end if;
	end process;
end architecture ; -- Behavioral