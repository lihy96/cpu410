----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:26 11/18/2016 
-- Design Name: 
-- Module Name:    constants - Behavioral 
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
use ieee.numeric_std.all;

package constants is
	
	constant RstEnable: std_logic := '1';
	constant RstDisable: std_logic := '0'; 

	constant Pc_reset: std_logic := '0';	--pc是否reset的控制信号
	constant Pc_pause: std_logic := '1';	--pc是否pause的控制信号
	constant Pc_origin_address : std_logic_vector(15 downto 0) := "0000000000000000";	--pc的初始地址
	constant Pc_offset: std_logic_vector(15 downto 0) := "0000000000000001";	--每次pc的偏移量

	type RegArray is array(15 downto 0) of std_logic_vector(15 downto 0);	-- 11个寄存器？8个通用？？？？？？？
	
	constant ZeroWord: std_logic_vector(15 downto 0) := "0000000000000000";	--全0
	constant OneWord: std_logic_vector(15 downto 0) := "0000000000000001";	--1
	constant HIGH_RESIST : std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ";

	constant ReadEnable: std_logic := '1';
	constant WriteEnable: std_logic := '1';
	constant ReadDisable: std_logic := '0';
	constant WriteDisable: std_logic := '0';

	-- if id latch
	constant IF_ID_LATCH_PAUSE : std_logic := '1';

	-- controller
	constant ZERO1: std_logic := '0';
	constant ZERO3: std_logic_vector(2 downto 0) := "000";
	constant ZERO4: std_logic_vector(3 downto 0) := "0000";
	constant ZERO16: std_logic_vector(15 downto 0) := "0000000000000000";

	constant ONE1: std_logic := '1';

	constant JR_YES :    std_logic := '1';
	constant JR_NO  :    std_logic := '0';
	constant B_INST_YES: std_logic := '1';
	constant B_INST_NO:  std_logic := '0';
	constant B_NE: std_logic := '1';
	constant B_EQ: std_logic := '0';
	constant And_Door_True: std_logic := '1';
	constant And_Door_False: std_logic := '0';
	constant And_Door_No_use: std_logic := 'Z';


	-- funct
	constant OP_ADDIU: std_logic_vector(4 downto 0) := "01001"; -- 1
	constant OP_ADDIU3: std_logic_vector(4 downto 0) := "01000";	-- 2
	constant OP_SPECIAL: std_logic_vector(4 downto 0) := "01100";	-- 3 & 9 & 18 & 28 & 29
	constant OP_ADD_SUB_U: std_logic_vector(4 downto 0) := "11100"; -- 4 & 23
	constant OP_LOGIC: std_logic_vector(4 downto 0) := "11101";	-- 5 & 10 & 11 & 16 & 20 & 26 & 27
	constant OP_B: std_logic_vector(4 downto 0) := "00010";	-- 6
	constant OP_BEQZ: std_logic_vector(4 downto 0) := "00100"; -- 7
	constant OP_BNEZ: std_logic_vector(4 downto 0) := "00101";	-- 8
	constant OP_LI: std_logic_vector(4 downto 0) := "01101";	-- 12
	constant OP_LW: std_logic_vector(4 downto 0) := "10011";	-- 13
	constant OP_LW_SP: std_logic_vector(4 downto 0) := "10010";	-- 14
	constant OP_IH: std_logic_vector(4 downto 0) := "11110";	-- 15 & 17
	constant OP_NOP: std_logic_vector(4 downto 0) := "00001";	-- 19
	constant OP_SHIFT: std_logic_vector(4 downto 0) := "00110";	-- 21 & 22
	constant OP_SW: std_logic_vector(4 downto 0) := "11011";	-- 24
	constant OP_SW_SP: std_logic_vector(4 downto 0) := "11010";	-- 25
	constant OP_ADDSP3: std_logic_vector(4 downto 0) := "00000";	-- ano
	constant OP_SLTI: std_logic_vector(4 downto 0) := "01010";	-- 30
	constant OP_SLTUI: std_logic_vector(4 downto 0) := "01011";	-- ano

	-- 3 & 9 & 18 & 28 & 29
	constant SPECIAL_ADDSP: std_logic_vector(2 downto 0) := "011";	 -- 3
	constant SPECIAL_BTEQZ: std_logic_vector(2 downto 0) := "000";	-- 9
	constant SPECIAL_MTSP: std_logic_vector(2 downto 0) := "100";	-- 18
	constant SPECIAL_BTNEZ: std_logic_vector(2 downto 0) := "001";	-- 28
	constant SPECIAL_SW_RS: std_logic_vector(2 downto 0) := "010";	-- 29

	-- 4 & 23
	constant ADD_SUB_U_ADDU: std_logic_vector(1 downto 0) := "01";	-- 4
	constant ADD_SUB_U_SUBU: std_logic_vector(1 downto 0) := "11";	-- 23

	-- 5 & 10 & 11 & 16 & 20 & 26 & 27
	constant LOGIC_AND: std_logic_vector(4 downto 0) := "01100";	-- 5
	constant LOGIC_CMP: std_logic_vector(4 downto 0) := "01010";	-- 10
	constant LOGIC_PC: std_logic_vector(4 downto 0) := "00000";	-- see sub
		--sub function code for pc inst(7 downto 5)
		constant PC_JR: std_logic_vector(2 downto 0) := "000";	-- 11
		constant PC_MFPC: std_logic_vector(2 downto 0) := "010";	-- 16
		-- end sub --
	constant LOGIC_OR: std_logic_vector(4 downto 0) := "01101";	-- 20
	constant LOGIC_SRAV: std_logic_vector(4 downto 0) := "00111";	-- ano
	constant LOGIC_NOT: std_logic_vector(4 downto 0) := "01111";	-- ano
	constant LOGIC_SLLV: std_logic_vector(4 downto 0) := "00100";	-- 26
	constant LOGIC_SRLV: std_logic_vector(4 downto 0) := "00110";	-- 27

    -- 15 & 17
	constant IH_MFIH: std_logic_vector(7 downto 0) := "00000000";	-- 15
	constant IH_MTIH: std_logic_vector(7 downto 0) := "00000001";	-- 17

	-- 21 & 22
	constant SHIFT_SLL: std_logic_vector(1 downto 0) := "00";	-- 21
	constant SHIFT_SRA: std_logic_vector(1 downto 0) := "11";	-- 22
	constant SHIFT_SRL: std_logic_vector(1 downto 0) := "10";	-- ano


	-- controller tell alu work what
	constant THU_ID_ADD: std_logic_vector(4 downto 0) := "00000";
	constant THU_ID_BRANCH: std_logic_vector(4 downto 0) := "00001";
	constant THU_ID_BRANCHE: std_logic_vector(4 downto 0) := "00010";
	constant THU_ID_BRANCHN: std_logic_vector(4 downto 0) := "00011";
	constant THU_ID_ASSIGN: std_logic_vector(4 downto 0) := "00100";
	constant THU_ID_NOP: std_logic_vector(4 downto 0) := "00101";
	constant THU_ID_OR: std_logic_vector(4 downto 0) := "00110";
	constant THU_ID_SLL: std_logic_vector(4 downto 0) := "00111";
	constant THU_ID_SRA: std_logic_vector(4 downto 0) := "01000";
	constant THU_ID_SUB: std_logic_vector(4 downto 0) := "01001";
	constant THU_ID_SRL: std_logic_vector(4 downto 0) := "01010";
	constant THU_ID_NOT: std_logic_vector(4 downto 0) := "01011";
	constant THU_ID_AND: std_logic_vector(4 downto 0) := "01100";
	constant THU_ID_LOAD: std_logic_vector(4 downto 0) := "01101";
	constant THU_ID_JR: std_logic_vector(4 downto 0) := "01110";
	constant THU_ID_CMP: std_logic_vector(4 downto 0) := "01111";
	constant THU_ID_EQUAL: std_logic_vector(4 downto 0) := "10000";

	-- alu
	constant ALU_NOP: std_logic_vector(4 downto 0) := "00101";
	constant ALU_ADD: std_logic_vector(4 downto 0) := "00000";
	constant ALU_SUB: std_logic_vector(4 downto 0) := "01001";
	constant ALU_ASSIGN: std_logic_vector(4 downto 0) := "00100";
	constant ALU_OR: std_logic_vector(4 downto 0) := "00110";
	constant ALU_AND: std_logic_vector(4 downto 0) := "01100"; 
	constant ALU_SLL: std_logic_vector(4 downto 0) := "00111";
	constant ALU_SRA: std_logic_vector(4 downto 0) := "01000";
	constant ALU_SRL: std_logic_vector(4 downto 0) := "01010";
	constant ALU_NOT: std_logic_vector(4 downto 0) := "01011";
	constant ALU_LOAD: std_logic_vector(4 downto 0) := "01101";
	constant ALU_CMP: std_logic_vector(4 downto 0) := "01111";
	constant ALU_EQUAL: std_logic_vector(4 downto 0) := "10000";

	--euqal
	constant EQUAL_YES: std_logic_vector(15 downto 0) := "1111111111111111";
	constant EQUAL_NO:  std_logic_vector(15 downto 0) := "0000000000000000";

	
	-- added by evan69
	-- constant defination for ex_mem_latch to MEM
	constant MEM_READ : STD_LOGIC_VECTOR(1 downto 0) := "01"; --控制数据存储器进行读
	constant MEM_WRITE : STD_LOGIC_VECTOR(1 downto 0) := "10"; --控制数据存储器进行写
	constant MEM_NONE: std_logic_vector(1 downto 0) := "11";
	constant COM_STATUS_ADDR : std_logic_vector(15 downto 0) := "1011111100000001"; --BF01
	constant COM_DATA_ADDR : std_logic_vector(15 downto 0) := "1011111100000000"; --BF00

	-- added by whz
	-- special registers
	constant T_REG: std_logic_vector(3 downto 0) := "1000" ;--T regieter
	constant SP_REG: std_logic_vector(3 downto 0) := "1001"; -- stack pointer register
	constant IH_REG: std_logic_vector(3 downto 0) := "1010"; --IH reg
	constant RA_REG: std_logic_vector(3 downto 0) := "1011"; -- RA reg
	constant ZERO_REG: std_logic_vector(3 downto 0) := "1100"; -- this register always 0
	constant ONE_REG: std_logic_vector(3 downto 0) := "1101"; -- this register always 1
	constant IMG_REG: std_logic_vector(3 downto 0) := "1111"; -- the imageined register, deesn't exist actually, used for expressing 'None Register'
	-- used for id_ex_latch and pause_pipeline. if the reg known after MEM/EXE, or not needed
	constant WB_EXE: std_logic_vector(1 downto 0) := "10";
	constant WB_MEM: std_logic_vector(1 downto 0) := "01";
	constant WB_NONE: std_logic_vector(1 downto 0) := "00";
	-- alu data choose
	constant ALU_CHOOSE1_REG1: std_logic_vector(1 downto 0) := "00";
	constant ALU_CHOOSE1_EXEFWD: std_logic_vector(1 downto 0) := "01";
	constant ALU_CHOOSE1_MEMFWD: std_logic_vector(1 downto 0) := "10";
	constant ALU_CHOOSE2_EXEFWD: std_logic_vector(1 downto 0) := "00";
	constant ALU_CHOOSE2_RI: std_logic_vector(1 downto 0) := "01";
	constant ALU_CHOOSE2_MEMFWD: std_logic_vector(1 downto 0) := "10";
	-- register output choose. used for Bxxx instructions
	constant REG_CHOOSE1_EXEFWD: std_logic_vector(1 downto 0) := "00";
	constant REG_CHOOSE1_RF: std_logic_vector(1 downto 0) := "01" ;
	constant REG_CHOOSE1_MEMFWD: std_logic_vector(1 downto 0) := "10";
	
	--constant reg
	-- control signal : WB_CHOOSE
	type WB_CHOOSE_TYPE is (
		ALU_DATA,
		MEM_DATA,
		PC_DATA
	);
	
	-- record type for write back control signal
	type WB_CONTROL_TYPE is record --传给ex-mem锁存器的record type
		WB_CHOOSE : WB_CHOOSE_TYPE;
		REG_WN : STD_LOGIC;
	end record;
	
	-- record type for write back control signal
	type ID_EX_LATCH_EX is record
		REG_WB_CHOOSE : std_logic_vector(3 downto 0);
		ALU_OP : std_logic_vector(4 downto 0);
		ALU1_RI_CHOOSE: std_logic;
	end record;


	type MEM_CTRL_TYPE is record
		RAM_READ_WRITE : STD_LOGIC_VECTOR(1 downto 0);
	end record;

	type ID_EX_LATCH_MEM is record	--id_ex锁存器中mem的输入部分
		ID_EX_LATCH_MEM_MEMCTRL : MEM_CTRL_TYPE;
		ID_EX_LATCH_MEM_PAUSE: std_logic_vector(1 downto 0);
	end record;




	-- cmp with 8000
	constant Inst_ram2 : std_logic := '1';
	constant Data_ram1 : std_logic := '0';

	-- write back register number
	constant WB_reg_num_Rx: std_logic_vector(2 downto 0) := "000";
	constant WB_reg_num_Ry: std_logic_vector(2 downto 0) := "001";
	constant WB_reg_num_Rz: std_logic_vector(2 downto 0) := "010";
	constant WB_reg_num_T: std_logic_vector(2 downto 0) := "011";
	constant WB_reg_num_SP: std_logic_vector(2 downto 0) := "100";
	constant WB_reg_num_IH: std_logic_vector(2 downto 0) := "101";
	constant WB_reg_NO: std_logic_vector(2 downto 0) := "110";

	-- alu No.2 src in from register or immmediate of instruction
	constant ALU_SRC2_FROM_REG : std_logic := '0';
	constant ALU_SRC2_FROM_INS : std_logic := '1';

	-- FOR THE MUX THAT WILL GIVE VALUE TO PC (LIHY)
	constant PC_NEXT_VAL_FROM_B: std_logic := '1';
	constant PC_NEXT_VAL_NOT_FROM_B: std_logic := '0';
	constant PC_NEXT_VAL_FROM_JR: std_logic := '1';
	constant PC_NEXT_VAL_NOT_FROM_JR: std_logic := '0';

	-- clock by lihy
	constant Clock_wait_num_before_work: integer := 10000;

end package;



