----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:23:10 11/18/2016 
-- Design Name: 
-- Module Name:    pc_reg - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_reg is
    port ( 
			rst, clk, pause: in  STD_LOGIC;
			new_pc : in  STD_LOGIC_VECTOR(15 downto 0);
         	pc_output : out  STD_LOGIC_VECTOR(15 downto 0)
	 );
end pc_reg;

architecture Behavioral of pc_reg is
signal mypc: std_logic_vector(15 downto 0) := (others =>'0') ;
begin
	pc_output <= mypc;
	process(clk, rst)
	begin
		if rst = Pc_reset then
			mypc <= Pc_origin_address;
		elsif (pause /= Pc_pause and rising_edge(clk)) then
		--pc_pause /= Pc_pause and 
			mypc <= new_pc;
		end if;
	end process;
end Behavioral;

