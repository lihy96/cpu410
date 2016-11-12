----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:16:27 11/06/2016 
-- Design Name: 
-- Module Name:    uart - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           L : out  STD_LOGIC_VECTOR (7 downto 0);
           Ram1Data : inout  STD_LOGIC_VECTOR (7 downto 0);
           Ram1OE : out  STD_LOGIC;
           Ram1WE : out  STD_LOGIC;
           Ram1EN : out  STD_LOGIC;
           rdn : out  STD_LOGIC;
           wrn : out  STD_LOGIC;
           data_ready : in  STD_LOGIC;
           tbre : in  STD_LOGIC;
           tsre : in  STD_LOGIC);
end uart;

architecture Behavioral of uart is
  signal state: std_logic_vector(2 downto 0) := (others =>'0');
  signal tmp: std_logic_vector(7 downto 0) ;
begin
  process(clk, rst)
  begin
    if rst = '0' then
      Ram1EN <= '1';
      Ram1OE <= '1';
      Ram1WE <= '1';
      wrn <= '1';
      state <= "000";
    --end if;
    elsif falling_edge(clk) then
      case state is
        when "000" => -- after init, first state of read
          rdn <= '1';
          Ram1Data <= (others => 'Z');
          state <= "001";
        when "001" => -- ready for receive data. might return to previous state
          if data_ready = '1' then
            rdn <= '0';
            state <= "011";
          else
            state <= "000";
          end if;
        when "011" => -- read data to LED
          L <= Ram1Data;
          tmp <= Ram1Data;
          rdn <= '1';
          state <= "010";
        when "010" => -- first state of sending
          wrn <= '0';
          Ram1Data <= tmp + 1;
          state <= "110";
        when "110" => -- second state of sending. set wrn backto 1
          wrn <= '1';
          state <= "111";
        when "111" => --wait for tbre, i.e. wait for sending
          if tbre = '1' then
            state <= "101";
          end if ;
        when "101" => -- sending finished
          if tsre = '1' then
            state <= "100";--finished. goto the 'when others' to re init.
          end if;
        when others =>
          Ram1EN <= '1';
          Ram1OE <= '1';
          Ram1WE <= '1';
          wrn <= '1';
          state <= "000";
      end case;
    end if;
  end process ; -- identifier

end Behavioral;

