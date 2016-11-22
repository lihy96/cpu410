library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;


entity and_xor_equal is
    Port ( 
           reg1, reg2, b_inst, b_eq_ne: in  STD_LOGIC;
           out_and_gate : out  STD_LOGIC 
	);
end and_xor_equal;

architecture Behavioral of and_xor_equal is
	signal state : std_logic;
	signal data : std_logic;
begin
	process(reg1, reg2, b_inst, b_eq_ne)
	begin
		if ((b_inst = B_INST_YES) and 
				((reg1 = reg2 and b_eq_ne = B_EQ)  or 
				(reg1 /= reg2 and b_eq_ne = B_NE))
			)then
			out_and_gate <= PC_NEXT_VAL_FROM_B;
		else
			out_and_gate <= PC_NEXT_VAL_NOT_FROM_B;
		end if;		
	end process;
end Behavioral;