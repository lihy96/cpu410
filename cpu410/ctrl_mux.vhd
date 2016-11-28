library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;

entity ctrl_mux is
    Port ( 
    	in_wb_ctrl: in WB_CONTROL_TYPE;
    	in_mem_ctrl: in MEM_CTRL_TYPE;
    	in_ex_ctrl: in ID_EX_LATCH_EX;
		in_reg_wb_type: in std_logic_vector(1 downto 0);
    	pause_or_not: in std_logic;
    	out_wb_ctrl: out WB_CONTROL_TYPE;
    	--out_mem_ctrl: out MEM_CTRL_TYPE;
    	out_ex_ctrl: out ID_EX_LATCH_EX;
		--out_reg_wb_type: out std_logic_vector(1 downto 0)
		out_latch_mem: out ID_EX_LATCH_MEM
         );
end ctrl_mux;

architecture Behavioral of ctrl_mux is

begin
	out_wb_ctrl <= in_wb_ctrl;
	--out_mem_ctrl <= in_mem_ctrl;
	out_ex_ctrl <= in_ex_ctrl;
	out_latch_mem.ID_EX_LATCH_MEM_MEMCTRL <= in_mem_ctrl;
	out_latch_mem.ID_EX_LATCH_MEM_PAUSE <= in_reg_wb_type;
	process(in_wb_ctrl, in_mem_ctrl, in_ex_ctrl, pause_or_not, in_reg_wb_type)
	begin
		--case pause_or_not  is
		--	when '1' => -- choose the do nothing
		--		out_wb_ctrl.WB_CHOOSE <= ALU_DATA;
		--		out_wb_ctrl.REG_WN <= WriteDisable;
		--		--out_mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
		--		out_ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
		--		out_ex_ctrl.ALU_OP <= THU_ID_NOP;
		--		out_ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
		--		out_latch_mem.ID_EX_LATCH_MEM_MEMCTRL.RAM_READ_WRITE <= MEM_NONE;
		--		out_latch_mem.ID_EX_LATCH_MEM_PAUSE <= WB_NONE;
		--	when others => -- choose the ctrl result
				
		end case ;
	end process;
end Behavioral;

