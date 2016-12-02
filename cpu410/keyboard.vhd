library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity keyboard is
PORT(
	half_rdn: in std_logic; -- when half_rdn is '0', the keyboard won't be reveiving data
	clk50M: in std_logic;
	
	ps2clk: in std_logic;
	ps2data: in std_logic;
	
	out_half_data_ready: out std_logic; -- after new data comes, it will stay 1 until data is read
	key_value: out std_logic_vector(7 downto 0) -- 总是保持前一次的结果
);
end keyboard;

architecture Behavioral of keyboard is
component keyboard_drv
port(
	clk, rst : in std_logic;
	ps2clk, ps2data : in std_logic;
	
	key_code : out std_logic_vector(7 downto 0)
);
end component;
signal state: std_logic := '0'; -- wait for an x"F0" first
signal key_code: std_logic_vector(7 downto 0) ;
signal used_key_code: std_logic_vector(7 downto 0) ;
signal half_data_ready: std_logic;
begin
	out_half_data_ready <= half_data_ready;
	keyboard_drv_obj : keyboard_drv port map(
		rst => half_rdn,
		clk => clk50M,
		ps2clk => ps2clk,
		ps2data => ps2data,
		key_code => key_code
	);
	--key_value(15 downto 8) <= (others => '0');
	with used_key_code select
	key_value(7 downto 0) <= 
		x"61" when "00011100" , -- a
		x"62" when "00110010" , 
		x"63" when "00100001" , 
		x"64" when "00100011" , 
		x"65" when "00100100" , 
		x"66" when "00101011" , 
		x"67" when "00110100" , 
		x"68" when "00110011" , 
		x"69" when "01000011" , 
		x"6a" when "00111011" , 
		x"6b" when "01000010" , 
		x"6c" when "01001011" , 
		x"6d" when "00111010" , 
		x"6e" when "00110001" , 
		x"6f" when "01000100" , 
		x"70" when "01001101" , 
		x"71" when "00010101" , 
		x"72" when "00101101" , 
		x"73" when "00011011" , 
		x"74" when "00101100" , 
		x"75" when "00111100" , 
		x"76" when "00101010" , 
		x"77" when "00011101" , 
		x"78" when "00100010" , 
		x"79" when "00110101" , 
		x"7a" when "00011010" , -- z
		--x"011011" when "01000001" , -- ,
		--x"011100" when "01001001" , -- .
		
		x"30" when "01000101" , -- 0
		x"31" when "00010110" , 
		x"32" when "00011110" , 
		x"33" when "00100110" , 
		x"34" when "00100101" , 
		x"35" when "00101110" , 
		x"36" when "00110110" , 
		x"37" when "00111101" , 
		x"38" when "00111110" , 
		x"39" when "01000110" , -- 9
		x"0e" when x"59", -- shift
		x"0e" when x"12", -- another shift
		--x"111010" when "01110101" , -- U
		--x"111011" when "01101011" , -- L
		--x"111100" when "01110010" , -- D
		--x"111101" when "01110100" , -- R
		
		
		--x"100100" when "01001110" , -- -
		--x"100101" when "01010101" , -- =
		x"1b" when "01110110" , -- ESC
		--x"100111" when "01100110" , -- BKSP
		--x"011110" when "01011010" , -- ENTER
		--x"000000" when "00101001" , -- SPACE

		x"11" when others;

	process( clk50M, half_rdn )
	begin
		if half_rdn = '0'  then
			state <= '0';
			half_data_ready <= '0';--when reading, it cannot be read again
		elsif rising_edge(clk50M) and half_data_ready = '0' then
			case state is
				when '1' =>-- already got an/many x"F0"
					if key_code /= x"f0" and key_code /= x"0000" then -- got a release, say data ready
						half_data_ready <= '1';
						used_key_code <= key_code;
						state <= '1';
					end if;
				when others =>-- waiting for an x"F0"
					if key_code = x"f0" then
						state <= '0';
					end if;
			end case ;
		end if;
	end process ; -- 

end Behavioral;

