library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use work.constants.all;

entity id_ex_latch is
	port (
		clk: in std_logic;

		in_wb: in WB_CONTROL_TYPE;
		out_wb_ctrl: out WB_CONTROL_TYPE;


		in_mem: in ID_EX_LATCH_MEM;
		out_mem_ctrl: out MEM_CTRL_TYPE;
		out_pause: out std_logic_vector(1 downto 0);

		in_ex: in ID_EX_LATCH_EX;
		out_reg_num_choose: out std_logic_vector(3 downto 0);
		out_alu_op: out std_logic_vector(4 downto 0);
		out_alu1_ri_choose: out std_logic;

		in_Rx_val, in_Ry_val: in std_logic_vector(15 downto 0);
		out_Rx_val, out_Ry_val: out std_logic_vector(15 downto 0);

		in_imme, in_pc : in std_logic_vector(15 downto 0);
		out_imme, out_pc: out std_logic_vector(15 downto 0)
	  );
end id_ex_latch;


architecture Behavioral of id_ex_latch is
begin
process(clk)
	begin
	if rising_edge(clk) then
		out_wb_ctrl <= in_wb;

		out_mem_ctrl <= in_mem.ID_EX_LATCH_MEM_MEMCTRL;
		out_pause <= in_mem.ID_EX_LATCH_MEM_PAUSE;

		out_reg_num_choose <= in_ex.REG_WB_CHOOSE;
		out_alu_op <= in_ex.ALU_OP;
		out_alu1_ri_choose <= in_ex.ALU1_RI_CHOOSE;

		out_Rx_val <= in_Rx_val;
		out_Ry_val <= in_Ry_val;

		out_imme <= in_imme;
		out_pc <= in_pc;

	end if;
end process;
end Behavioral;