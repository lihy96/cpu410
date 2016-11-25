library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.constants.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_adder is
    Port ( 
    	   pc_adder_in : in  STD_LOGIC_VECTOR (15 downto 0);
           pc_adder_out : out  STD_LOGIC_VECTOR (15 downto 0)
          );
end pc_adder;

architecture Behavioral of pc_adder is
	signal pc_adder_out_origin : std_logic_vector(15 downto 0) := ZeroWord;
begin
	pc_adder_out <= pc_adder_out_origin;
	process(pc_adder_in)
	begin
		pc_adder_out <= pc_adder_in + Pc_offset;
	end process;
end Behavioral;