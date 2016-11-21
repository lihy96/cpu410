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

<<<<<<< HEAD

component pc_reg 
    port ( 
			rst, clk, pc_pause: in  STD_LOGIC;
			new_pc : in  STD_LOGIC_VECTOR(15 downto 0);
         	pc_output : out  STD_LOGIC_VECTOR(15 downto 0)
	 );
end component;

component pc_adder is
    Port ( 
    	   pc_adder_in : in  STD_LOGIC_VECTOR (15 downto 0);
           pc_adder_out : out  STD_LOGIC_VECTOR (15 downto 0)
          );
end component;

component inst_ram is
 	port (
=======
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
>>>>>>> 8107932a1afe2990e3cffe083235f9ed66809877
		CLK : in STD_LOGIC;
		RAM_READ_WRITE : in STD_LOGIC_VECTOR(1 downto 0);
		-- data signal
		RAM_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		RAM_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		-- data output
		RAM_OUTPUT : out STD_LOGIC_VECTOR(15 downto 0);
		
		-- inner signal, out to ram
<<<<<<< HEAD
		Ram2Addr : out STD_LOGIC_VECTOR(17 downto 0);
		Ram2Data : inout STD_LOGIC_VECTOR(15 downto 0);
		Ram2OE : out STD_LOGIC;
		Ram2WE : out STD_LOGIC;
		Ram2EN : out STD_LOGIC
	);
end component ;

component if_id_latch is
	port (
		clk: in std_logic;
		pause: in std_logic;
		in_pc,  in_pc_plus1,  in_inst:   in std_logic_vector(15 downto 0);
		out_pc, out_pc_plus1, out_inst: out std_logic_vector(15 downto 0)

	  );
end component;

component mux2 is
    Port ( 
    	   choose : in  STD_LOGIC;
           data1, data2 : in  STD_LOGIC_VECTOR (15 downto 0);
           outdata : out  STD_LOGIC_VECTOR (15 downto 0)
         );
end component;

component mux3 is
    Port ( 
    	   data1, data2 , data3  : in  STD_LOGIC_VECTOR (15 downto 0) ;
           choose : in  STD_LOGIC_VECTOR (1 downto 0) ;
           outdata : out  STD_LOGIC_VECTOR (15 downto 0) 
	);
end component;

---------------------------------------------------------------------------IF / ID

component adder is
	port(
		pc_old : in STD_LOGIC_VECTOR(15 downto 0);
		imm : in STD_LOGIC_VECTOR(15 downto 0);
		pc_new : out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

component registers is
port (
	clk, rst: in std_logic;
	r1_addr, r2_addr: in std_logic_vector(3 downto 0);
	r1_read_en, r2_read_en: in std_logic;
	r1_data, r2_data: out std_logic_vector(15 downto 0);
	write_addr: in std_logic_vector(3 downto 0);
	write_en: in std_logic;
	write_data: in std_logic_vector(15 downto 0)
);
end component;


component id_ex_latch is
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


signal pc_reg_out_W: std_logic_vector(15 downto 0) := ZeroWord;
signal pc_adder_out_W: std_logic_vector(15 downto 0) := ZeroWord;
signal mux3_TO_pc: std_logic_vector(15 downto 0) := ZeroWord;
signal mux2_TO_inst_ram: std_logic_vector(15 downto 0) := ZeroWord;
signal if_id_latch_out_pc_plus1: std_logic_vector(15 downto 0) := ZeroWord;
signal if_id_latch_out_pc: std_logic_vector(15 downto 0) := ZeroWord;
signal registers_r1_data_out: std_logic_vector(15 downto 0) := ZeroWord;
signal registers_r2_data_out: std_logic_vector(15 downto 0) := ZeroWord;
signal id_mux3_1_outdata: std_logic_vector(15 downto 0) := ZeroWord;
signal id_mux3_2_outdata: std_logic_vector(15 downto 0) := ZeroWord;

begin
  pc_reg_obj: pc_reg port map ( 
  	new_pc => mux3_TO_pc,
  	pc_output => pc_reg_out_W
  );

  pc_adder_obj: pc_adder port map (	
    pc_adder_in => pc_reg_out_W,
    pc_adder_out => pc_adder_out_W
  );

  inst_ram_obj: inst_ram port map (
    RAM_ADDR => mux2_TO_inst_ram
  );

  if_id_latch_obj: if_id_latch port map (
    in_pc => pc_reg_out_W,
    out_pc => if_id_latch_out_pc,
    in_pc_plus1 => pc_adder_out_W,
    out_pc_plus1 => if_id_latch_out_pc_plus1
  );

  if_mux2_obj: mux2 port map (
    data1 => pc_reg_out_W,
    outdata => mux2_TO_inst_ram
  );

  if_mux3_obj: mux3 port map (
    data3 => pc_adder_out_W,
    outdata => mux3_TO_pc
  );

---------------------------------------- IF / ID
  adder_obj: adder port map (
 	pc_old => if_id_latch_out_pc_plus1
  );


  registers_obj: registers port map (
	r1_addr
	r2_addr
	r1_read_en
	r2_read_en
	r1_data <= registers_r1_data_out,
	r2_data <= registers_r2_data_out,
	write_addr
	write_en
	write_data
 );

id_mux3_obj1: mux3 port map (
 	data2 => registers_r1_data_out,
	outdata => id_mux3_1_outdata
);

id_mux3_obj2: mux3 port map (
	data2 => registers_r2_data_out,
    outdata => id_mux3_2_outdata
);


  id_ex_latch_obj: id_ex_latch port map (

	in_wb
	out_wb_ctrl

	in_mem
	out_mem_ctrl
	out_pause

	in_ex
	out_reg_num_choose
	out_alu_op

	in_Rx_val <= id_mux3_1_outdata
	in_Ry_val <= id_mux3_2_outdata
	out_Rx_val
	out_Ry_val

	in_imme
	in_pc => if_id_latch_out_pc,
	out_imme
	out_pc

	 in_Rx_num
	 in_Ry_num
	 in_Rz_num
	 in_T_num
	 in_SP_num
	out_Rx_num
	out_Ry_num
	out_Rz_num
	out_T_num
	out_SP_num 
);


=======
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
>>>>>>> 8107932a1afe2990e3cffe083235f9ed66809877

		IN_WB_CHOOSE => WB_CHOOSE_MEM_WB_LATCH_TO_WB_MUX
	);

end Behavioral;

