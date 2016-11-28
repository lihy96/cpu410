library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use work.constants.all;

entity id_ex_latch is
	port (
		clk: in std_logic;
		pause : in std_logic;

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
	signal out_wb_ctrl_origin : WB_CONTROL_TYPE := (WB_CHOOSE => PC_DATA, REG_WN => '0');
	signal out_mem_ctrl_origin : MEM_CTRL_TYPE := (RAM_READ_WRITE => "00");
	signal out_pause_origin : std_logic_vector(1 downto 0) := "00";
	
	signal out_reg_num_choose_origin : std_logic_vector(3 downto 0) := "0000";
	signal out_alu_op_origin : std_logic_vector(4 downto 0) := "00000";
	signal out_alu1_ri_choose_origin : std_logic := '0';
	
	signal out_Rx_val_origin : std_logic_vector(15 downto 0) := ZeroWord;
	signal out_Ry_val_origin : std_logic_vector(15 downto 0) := ZeroWord;
	signal out_imme_origin : std_logic_vector(15 downto 0) := ZeroWord;
	signal out_pc_origin : std_logic_vector(15 downto 0) := ZeroWord;

	signal pause_flag : std_logic := '0';
begin
	out_wb_ctrl <= out_wb_ctrl_origin ;
	out_mem_ctrl <= out_mem_ctrl_origin;
 	out_pause <= out_pause_origin ;
	
	out_reg_num_choose <= out_reg_num_choose_origin ;
	out_alu_op <= out_alu_op_origin ;
	out_alu1_ri_choose <= out_alu1_ri_choose_origin;
	
 	out_Rx_val <= out_Rx_val_origin ;
	out_Ry_val <= out_Ry_val_origin;
	out_imme <= out_imme_origin;
	out_pc <= out_pc_origin;
process(clk)
	begin
	if (rising_edge(clk)) then 
		if(pause /= IF_ID_LATCH_PAUSE or pause_flag = '1') then
			out_wb_ctrl_origin <= in_wb;

			out_mem_ctrl_origin <= in_mem.ID_EX_LATCH_MEM_MEMCTRL;
			out_pause_origin <= in_mem.ID_EX_LATCH_MEM_PAUSE;

			out_reg_num_choose_origin <= in_ex.REG_WB_CHOOSE;
			out_alu_op_origin <= in_ex.ALU_OP;
			out_alu1_ri_choose_origin <= in_ex.ALU1_RI_CHOOSE;

			out_Rx_val_origin <= in_Rx_val;
			out_Ry_val_origin <= in_Ry_val;

			out_imme_origin <= in_imme;
			out_pc_origin <= in_pc;

			pause_flag <= '0';
		else
			pause_flag <= '1';
		end if;
	end if;
end process;
end Behavioral;