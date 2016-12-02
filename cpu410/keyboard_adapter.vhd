library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity keyboard_adapter is
PORT (
	rdn: in std_logic;
	clk50M: in std_logic;

	ps2clk: in std_logic;
	ps2data: in std_logic;

	data_ready: out std_logic;
	data: out std_logic_vector(15 downto 0)
);
end entity;

architecture bhv of keyboard_adapter is
component keyboard is
PORT(
	half_rdn: in std_logic;
	clk50M: in std_logic;
	
	ps2clk: in std_logic;
	ps2data: in std_logic;

	half_data_ready: out std_logic;
	key_value: out std_logic_vector(7 downto 0)
);
end component;
signal cnt: std_logic := '0';
signal reading: std_logic := '0'; -- reading just started or almost done
signal half_rdn: std_logic := '1';
signal key_value: std_logic_vector(7 downto 0) ;
signal half_data_ready: std_logic;
begin
	installedKeyboard: keyboard port map(
		half_rdn => half_rdn,
		clk50M => clk50M,
		
		ps2clk => ps2clk,
		ps2data => ps2data,

		half_data_ready => half_data_ready,
		key_value => key_value
	);

	generateByte : process( sensitivity_list )
	begin
		if rdn = '0' then
			data_ready <= '0';
			reading <= '0';
		elsif rising_edge(clk50M) and data_ready = '0' then--ask for data
			case reading is
			when '0' => 
			-- first state fot reading, pull down rdn to mark reading if data_ready
				if half_data_ready = '1'
					case cnt is
					when '0' => --receiving the first 4 bits (high hex number)
						half_rdn <= '0';
						case( key_value ) is
							when x"30" =>
								data(7 downto 4) <= x"0";  -- 0
								cnt <= '1';
							when x"31" =>
								data(7 downto 4) <= x"1"; 
								cnt <= '1';
							when x"32" =>
								data(7 downto 4) <= x"2";
								cnt <= '1';
							when x"33" =>
								data(7 downto 4) <= x"3";
								cnt <= '1';
							when x"34" =>
								data(7 downto 4) <= x"4";
								cnt <= '1';
							when x"35" =>
								data(7 downto 4) <= x"5";
								cnt <= '1';
							when x"36" =>
								data(7 downto 4) <= x"6";
								cnt <= '1';
							when x"37" =>
								data(7 downto 4) <= x"7";
								cnt <= '1';
							when x"38" =>
								data(7 downto 4) <= x"8";
								cnt <= '1';
							when x"39" =>
								data(7 downto 4) <= x"9";  -- 9
								cnt <= '1';
							when x"61" =>
								data(7 downto 4) <= x"a"; -- a
								cnt <= '1';
							when x"62" =>
								data(7 downto 4) <= x"b"; 
								cnt <= '1';
							when x"63" =>
								data(7 downto 4) <= x"c"; 
								cnt <= '1';
							when x"64" =>
								data(7 downto 4) <= x"d"; 
								cnt <= '1';
							when x"65" =>
								data(7 downto 4) <= x"e"; 
								cnt <= '1';
							when x"66" =>
								data(7 downto 4) <= x"f";
								cnt <= '1';
							when others =>
						end case ;
					when '1' => --the second (low hex)
						half_rdn <= '0';
						case( key_value ) is
							when x"30" =>
								data(3 downto 0) <= x"0";  -- 0
								cnt <= '0';
								data_ready <= '1';
							when x"31" =>
								data(3 downto 0) <= x"1"; 
								cnt <= '0';
								data_ready <= '1';
							when x"32" =>
								data(3 downto 0) <= x"2";
								cnt <= '0';
								data_ready <= '1';
							when x"33" =>
								data(3 downto 0) <= x"3";
								cnt <= '0';
								data_ready <= '1';
							when x"34" =>
								data(3 downto 0) <= x"4";
								cnt <= '0';
								data_ready <= '1';
							when x"35" =>
								data(3 downto 0) <= x"5";
								cnt <= '0';
								data_ready <= '1';
							when x"36" =>
								data(3 downto 0) <= x"6";
								cnt <= '0';
								data_ready <= '1';
							when x"37" =>
								data(3 downto 0) <= x"7";
								cnt <= '0';
								data_ready <= '1';
							when x"38" =>
								data(3 downto 0) <= x"8";
								cnt <= '0';
								data_ready <= '1';
							when x"39" =>
								data(3 downto 0) <= x"9";  -- 9
								cnt <= '0';
								data_ready <= '1';
							when x"61" =>
								data(3 downto 0) <= x"a"; -- a
								cnt <= '0';
								data_ready <= '1';
							when x"62" =>
								data(3 downto 0) <= x"b"; 
								cnt <= '0';
								data_ready <= '1';
							when x"63" =>
								data(3 downto 0) <= x"c"; 
								cnt <= '0';
								data_ready <= '1';
							when x"64" =>
								data(3 downto 0) <= x"d"; 
								cnt <= '0';
								data_ready <= '1';
							when x"65" =>
								data(3 downto 0) <= x"e"; 
								cnt <= '0';
								data_ready <= '1';
							when x"66" =>
								data(3 downto 0) <= x"f";
								cnt <= '0';
								data_ready <= '1';
							when others =>
						end case;
					when others =>
						cnt <= '0';
						half_rdn <= '1';
					end  case;
				end if;
			when others =>
			-- read finisned, pull up so that keybord can receive data
				half_rdn <= '1';
			end case;
		end if;
	end process ; -- generateByte
end architecture ; -- bhv