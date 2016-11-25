library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;

entity mux2_pc_inst is
    Port ( 
    	   choose : in  STD_LOGIC_VECTOR (1 downto 0);
           pc, addr : in  STD_LOGIC_VECTOR (15 downto 0);
           outdata : out  STD_LOGIC_VECTOR (15 downto 0)
         );
end mux2_pc_inst;

architecture Behavioral of mux2_pc_inst is

begin
	process(pc, addr, choose)
	begin
		case choose is
			when MEM_NONE => 
				outdata <= pc;
			when "00" =>
				outdata <= pc;
			when MEM_READ =>
				outdata <= pc;
			when MEM_WRITE => 
				outdata <= addr;
			when others =>

		end case;
	end process;
end Behavioral;


