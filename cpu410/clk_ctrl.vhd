----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:31 11/24/2016 
-- Design Name: 
-- Module Name:    clk_ctrl - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_ctrl is
	port(
		clk : in STD_LOGIC;
		origin_clk : out STD_LOGIC;
		half_clk : out STD_LOGIC
		--quarter_clk : out STD_LOGIC
	);
end clk_ctrl;

architecture Behavioral of clk_ctrl is
signal count : STD_LOGIC_VECTOR(10 downto 0) := (others=>'1');
signal adder : STD_LOGIC_VECTOR(10 downto 0) := (0=>'1',others=>'0');
--signal twice_clk : STD_LOGIC;
--signal gen_rst : STD_LOGIC := '0';
--component gen_dcm_sp
--	port ( CLKIN_IN        : in    std_logic; 
--		 RST_IN          : in    std_logic; 
--		 CLKIN_IBUFG_OUT : out   std_logic; 
--		 CLK0_OUT        : out   std_logic; 
--		 CLK2X_OUT       : out   std_logic; 
--		 LOCKED_OUT      : out   std_logic);
--end component;

begin
	adder <= (0=>'1',others=>'0');
	--clk_gen : gen_dcm_sp
	--port map (
	--		CLKIN_IN=>clk, 
	--	 RST_IN=>gen_rst, 
	--	 CLKIN_IBUFG_OUT=>open, 
	--	 CLK0_OUT=>open, 
	--	 CLK2X_OUT=>twice_clk, 
	--	 LOCKED_OUT=>open);
	
	process(clk,count)
	begin
		if(rising_edge(clk)) then
			count <= count + adder;	
			--gen_rst <= '0';
		end if;
		--quarter_clk <= not count(1);
		half_clk <= not count(0);
		origin_clk <= clk;
	end process;

end Behavioral;

