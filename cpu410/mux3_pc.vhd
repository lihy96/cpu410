library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.constants.ALL;


entity mux3_pc is
    Port ( 
    	   b_or_not, jr_or_not : in  STD_LOGIC ;
           pc_add_1, pc_add_n, pc_from_reg : in  STD_LOGIC_VECTOR (15 downto 0) ;
           out_next_pc : out  STD_LOGIC_VECTOR (15 downto 0) 
	);
end mux3_pc;

architecture Behavioral of mux3_pc is
begin
	process(b_or_not, jr_or_not, pc_add_1, pc_add_n, pc_from_reg)
	begin
		if b_or_not = PC_NEXT_VAL_FROM_B and jr_or_not = PC_NEXT_VAL_NOT_FROM_JR then
			out_next_pc <= pc_add_n;
		elsif b_or_not = PC_NEXT_VAL_NOT_FROM_B and jr_or_not = PC_NEXT_VAL_FROM_JR then
			out_next_pc <= pc_from_reg;
		else
			out_next_pc <= pc_add_1;
		end if;
		--case b_or_not & jr_or_not is
		--	--when PC_NEXT_VAL_FROM_B & PC_NEXT_VAL_NOT_FROM_JR =>
		--	when "10" =>
		--		out_next_pc <= pc_add_n;
		--	when "01" =>
		--		out_next_pc <= pc_from_reg;
		--	when others =>
		--		out_next_pc <= pc_add_1;
		--end case;
	end process;
end Behavioral;