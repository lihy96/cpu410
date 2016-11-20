----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:23 11/20/2016 
-- Design Name: 
-- Module Name:    cpu410 - Behavioral 
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
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu410 is
end cpu410;

architecture Behavioral of cpu410 is

component id_ex_latch
	port (
		clk: in std_logic;

		in_wb: in WB_CTRL_TYPE;
		out_wb_ctrl: out WB_CTRL_TYPE;

		in_mem: in ID_EX_LATCH_MEM;
		out_mem_ctrl: out MEM_CTRL_TYPE;
		out_pause: out std_logic_vector(3 downto 0);

		in_ex: in ID_EX_LATCH_EX;
		out_reg_num_choose: out std_logic_vector(2 downto 0);
		out_alu_op: out std_logic_vector(4 downto 0);

		in_Rx_val, in_Ry_val: in std_logic_vector(15 downto 0);
		out_Rx_val, out_Ry_val: out std_logic_vector(15 downto 0);

		in_imme, in_pc : in std_logic_vector(15 downto 0);
		out_imme, out_pc: out std_logic_vector(15 downto 0);

		 in_Rx_num,  in_Ry_num,  in_Rz_num,  in_T_num,  in_SP_num : in std_logic_vector(3 downto 0);
		out_Rx_num, out_Ry_num, out_Rz_num, out_T_num, out_SP_num : out std_logic_vector(3 downto 0)
	  );
end component;

component ex_mem_latch
	Port ( 
		CLK : in STD_LOGIC;
		
		-- data input
		IN_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		IN_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_PC : in STD_LOGIC_VECTOR(15 downto 0);
		IN_REG_NO : in STD_LOGIC_VECTOR(3 downto 0);
		
		-- data output
		OUT_ADDR : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_DATA : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_PC : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_REG_NO : out STD_LOGIC_VECTOR(3 downto 0);
		
		-- control signal input
		IN_WB_CTRL : in WB_CTRL_TYPE;
		IN_MEM_CTRL : in MEM_CTRL_TYPE;
		IN_CMP_RS : in STD_LOGIC; --对读写地址进行比较后的结果
		
		-- control signal output
		OUT_WB_CONTROL_SIGNAL : out WB_CONTROL_SIGNAL_TYPE;
		OUT_RAM1_READ_WRITE : out STD_LOGIC_VECTOR(1 downto 0);
		OUT_RAM2_READ_WRITE : out STD_LOGIC_VECTOR(1 downto 0);
		OUT_MEM_FORWARD : out STD_LOGIC
	);
end component;

component mem_ctrl
	port(
		-- control signal
		CLK : in STD_LOGIC;
		RAM_READ_WRITE : in STD_LOGIC_VECTOR(1 downto 0);
		-- data signal
		RAM_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		RAM_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		-- data output
		RAM_OUTPUT : out STD_LOGIC_VECTOR(15 downto 0);
		
		-- inner signal, out to ram
		Ram1Addr : out STD_LOGIC_VECTOR(17 downto 0);
		Ram1Data : inout STD_LOGIC_VECTOR(15 downto 0);
		Ram1OE : out STD_LOGIC;
		Ram1WE : out STD_LOGIC;
		Ram1EN : out STD_LOGIC;
		
		-- 串口相关
		rdn : out  STD_LOGIC;
		wrn : out  STD_LOGIC;
		data_ready : in  STD_LOGIC;
		tbre : in  STD_LOGIC;
		tsre : in  STD_LOGIC
	);
end component;

component mem_wb_latch
	Port ( 
		CLK : in STD_LOGIC;
		
		-- data input
		IN_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		IN_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_PC : in STD_LOGIC_VECTOR(15 downto 0);
		IN_REG_NO : in STD_LOGIC_VECTOR(3 downto 0);
		
		-- data output
		OUT_ADDR : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_DATA : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_PC : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_REG_NO : out STD_LOGIC_VECTOR(3 downto 0);
		
		-- control signal input
		IN_WB_CONTROL_SIGNAL : in WB_CONTROL_SIGNAL_TYPE;
		
		-- control signal output
		OUT_WB_FORWARD : out STD_LOGIC;
		OUT_WB_CHOOSE : out WB_CHOOSE_TYPE;
		OUT_REG_WN : out STD_LOGIC
		
	);
end component;

component wb_mux
	Port ( 
		CLK : in STD_LOGIC;
		
		-- data input
		IN_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		IN_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_PC : in STD_LOGIC_VECTOR(15 downto 0);
		
		-- data output
		OUT_WB_DATA : out STD_LOGIC_VECTOR(15 downto 0);
		
		-- control signal input
		IN_WB_CHOOSE : in WB_CHOOSE_TYPE
		
		-- control signal output
	);
end component;

component alu
	port (
		alu_op1 , alu_op2 :   in std_logic_vector(15 downto 0);
		alu_inst :   in std_logic_vector(4 downto 0);
		alu_res : out std_logic_vector(15 downto 0)
	  );
end component;

component cmp8k
	port (
		data_in: in std_logic_vector(15 downto 0);
		res : out std_logic
	  );
end component;

signal RAM1_READ_WRITE : STD_LOGIC_VECTOR(1	downto 0);
signal RAM1_DATA : STD_LOGIC_VECTOR(15 downto 0);
signal RAM1_ADDR : STD_LOGIC_VECTOR(15 downto 0);
signal PC_EX_MEM_LATCH_TO_MEM_WB_LATCH : STD_LOGIC_VECTOR(15 downto 0);
signal REG_NO_EX_MEM_LATCH_TO_MEM_WB_LATCH : STD_LOGIC_VECTOR(3 downto 0);
signal DATA_RAM1_TO_MEM_WB_LATCH : STD_LOGIC_VECTOR(15 downto 0);
signal DATA_MEM_WB_LATCH_TO_MUX : STD_LOGIC_VECTOR(15 downto 0);
signal ADDR_MEM_WB_LATCH_TO_MUX : STD_LOGIC_VECTOR(15 downto 0);
signal PC_MEM_WB_LATCH_TO_MUX : STD_LOGIC_VECTOR(15 downto 0);
signal WB_CONTROL_SIGNAL_EX_MEM_LATCH_TO_MEM_WB_LATCH : WB_CONTROL_SIGNAL_TYPE;
signal WB_CHOOSE_MEM_WB_LATCH_TO_WB_MUX : WB_CHOOSE_TYPE;

signal CMP_RS_CMP8K_TO_EX_MEM_LATCH : STD_LOGIC;
signal ALU_RESULT : STD_LOGIC_VECTOR(15 downto 0);

signal MEM_CTRL_ID_EX_LATCH_TO_EX_MEM_LATCH : MEM_CTRL_TYPE;
signal WB_CTRL_ID_EX_LATCH_TO_EX_MEM_LATCH : WB_CTRL_TYPE;

begin
	id_ex_latch_entity : id_ex_latch port map (
		out_mem_ctrl => MEM_CTRL_ID_EX_LATCH_TO_EX_MEM_LATCH,
		out_wb_ctrl => WB_CTRL_ID_EX_LATCH_TO_EX_MEM_LATCH
	);

	alu_entity : alu port map (
		alu_res => ALU_RESULT
	);

	cmp8k_entity : cmp8k port map (
		data_in => ALU_RESULT,

		res => CMP_RS_CMP8K_TO_EX_MEM_LATCH,
	);

	ex_mem_latch_entity: ex_mem_latch port map (
		IN_CMP_RS => CMP_RS_CMP8K_TO_EX_MEM_LATCH,
		IN_ADDR => ALU_RESULT,

		OUT_RAM1_READ_WRITE => RAM1_READ_WRITE,
		OUT_DATA => RAM1_DATA,
		OUT_ADDR => RAM1_ADDR,
		OUT_PC => PC_EX_MEM_LATCH_TO_MEM_WB_LATCH,
		OUT_REG_NO => REG_NO_EX_MEM_LATCH_TO_MEM_WB_LATCH,

		IN_MEM_CTRL => MEM_CTRL_ID_EX_LATCH_TO_EX_MEM_LATCH,
		IN_WB_CTRL => WB_CTRL_ID_EX_LATCH_TO_EX_MEM_LATCH,

		OUT_WB_CONTROL_SIGNAL => WB_CONTROL_SIGNAL_EX_MEM_LATCH_TO_MEM_WB_LATCH
	);

	mem_ctrl_entity: mem_ctrl port map (
		RAM_READ_WRITE => RAM1_READ_WRITE,
		RAM_DATA => RAM1_DATA,
		RAM_ADDR => RAM1_ADDR,
		RAM_OUTPUT => DATA_RAM1_TO_MEM_WB_LATCH
	);

	mem_wb_latch_entity: mem_wb_latch port map (
		IN_ADDR => RAM1_ADDR,
		IN_PC => PC_EX_MEM_LATCH_TO_MEM_WB_LATCH,
		IN_REG_NO => REG_NO_EX_MEM_LATCH_TO_MEM_WB_LATCH,
		IN_DATA => DATA_RAM1_TO_MEM_WB_LATCH,

		OUT_ADDR => ADDR_MEM_WB_LATCH_TO_MUX,
		OUT_DATA => DATA_MEM_WB_LATCH_TO_MUX,
		OUT_PC => PC_MEM_WB_LATCH_TO_MUX,

		IN_WB_CONTROL_SIGNAL => WB_CONTROL_SIGNAL_EX_MEM_LATCH_TO_MEM_WB_LATCH,

		OUT_WB_CHOOSE => WB_CHOOSE_MEM_WB_LATCH_TO_WB_MUX
	);

	wb_mux_entity : wb_mux port map (
		IN_ADDR => ADDR_MEM_WB_LATCH_TO_MUX,
		IN_DATA => DATA_MEM_WB_LATCH_TO_MUX,
		IN_PC => PC_MEM_WB_LATCH_TO_MUX,

		IN_WB_CHOOSE => WB_CHOOSE_MEM_WB_LATCH_TO_WB_MUX
	);

end Behavioral;

