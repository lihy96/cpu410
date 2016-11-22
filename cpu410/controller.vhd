library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;
--TODO: sw and related ones

entity controller is
	port (
		instruction : in std_logic_vector(15 downto 0);	-- input instruction

		--lu_inst: out std_logic_vector(4 downto 0);	-- instruction that put to alu
		immd: out std_logic_vector(15 downto 0);	-- immediate that output
		jr_or_not: out std_logic;
		b_inst: out std_logic;

		wb_ctrl: out WB_CONTROL_TYPE;

		reg_wb_type: out std_logic_vector(1 downto 0);
		-- what kind of value will be written back?
		-- an ALU calculated(known after EXE)?
		-- or read from mem(known after MEM)?
		mem_ctrl: out MEM_CTRL_TYPE;
		ex_ctrl: out ID_EX_LATCH_EX

	);
end entity ;


architecture arch of controller is
begin
	process(instruction)
	variable inst_15_to_11: std_logic_vector(4 downto 0) ;
	begin
		inst_15_to_11 := instruction(15 downto 11);
		jr_or_not <= JR_NO;
		b_inst <= B_INST_NO;
		case (inst_15_to_11) is
			when OP_ADDIU =>
				immd(15 downto 8) <= (others => instruction(7));
				immd(7 downto 0) <= instruction(7 downto 0);
				reg_wb_type <= WB_EXE;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteEnable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

				ex_ctrl.ALU_OP <= THU_ID_ADD;

			when OP_ADDIU3 =>
				immd(15 downto 4) <= (others => instruction(3));
				immd(3 downto 0) <= instruction(3 downto 0);
				reg_wb_type <= WB_EXE;
				ex_ctrl.ALU_OP <= THU_ID_ADD;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteEnable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(7 downto 5);
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			when OP_B =>
				immd(15 downto 11) <= (others => instruction(10));
				immd(10 downto 0) <= instruction(10 downto 0);

				ex_ctrl.ALU_OP <= THU_ID_BRANCH;
				reg_wb_type <= WB_NONE;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteDisable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
				b_inst <= B_INST_YES;

			when OP_BEQZ =>
				immd(15 downto 8) <= (others => instruction(7));
				immd(7 downto 0) <= instruction(7 downto 0);

				ex_ctrl.ALU_OP <= THU_ID_BRANCHE;
				reg_wb_type <= WB_NONE;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteDisable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
				b_inst <= B_INST_YES;

			when OP_BNEZ =>
				immd(15 downto 8) <= (others => instruction(7));
				immd(7 downto 0) <= instruction(7 downto 0);
				reg_wb_type <= WB_NONE;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteDisable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
				ex_ctrl.ALU_OP <= THU_ID_BRANCHN;

				b_inst <= B_INST_YES;

			when OP_LI =>
				immd(15 downto 8) <= (others => '0');
				immd(7 downto 0) <= instruction(7 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_ASSIGN;
				reg_wb_type <= WB_EXE;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteEnable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			when OP_LW =>
				immd(15 downto 5) <= (others => instruction(4));
				immd(4 downto 0) <= instruction(4 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_LOAD;
				reg_wb_type <= WB_MEM;
				wb_ctrl.WB_CHOOSE <= MEM_DATA;
				wb_ctrl.REG_WN <= WriteEnable;
				mem_ctrl.RAM_READ_WRITE <= MEM_READ;
				ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(7 downto 5);
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			when OP_LW_SP =>
				immd(15 downto 8) <= (others => instruction(7));
				immd(7 downto 0) <= instruction(7 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_LOAD;
				reg_wb_type <= WB_MEM;
				wb_ctrl.WB_CHOOSE <= MEM_DATA;
				wb_ctrl.REG_WN <= WriteEnable;
				mem_ctrl.RAM_READ_WRITE <= MEM_READ;
				ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			when OP_IH =>
				case( instruction(7 downto 0) ) is
					when IH_MFIH =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_ASSIGN;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

					when IH_MTIH =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_ASSIGN;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= IH_REG;
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;
					when others =>

				end case ;

			when OP_NOP =>
				immd(15 downto 0) <= ZERO16;
				ex_ctrl.ALU_OP <= THU_ID_NOP;
				reg_wb_type <= WB_NONE;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteDisable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			when OP_SHIFT =>
				case( instruction(1 downto 0) ) is

					when SHIFT_SLL =>
						ex_ctrl.ALU_OP <= THU_ID_SLL;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
						if (instruction(4 downto 2) = "000") then
							immd(15 downto 4) <= (others => '0');
							immd(3 downto 0) <= "1000";
						else
							immd(15 downto 3) <= (others => '0');
							immd(2 downto 0) <= instruction(4 downto 2);
						end if;

					when SHIFT_SRA =>
						ex_ctrl.ALU_OP <= THU_ID_SRA;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
						if (instruction(4 downto 2) = "000") then
							immd(15 downto 4) <= (others => '0');
							immd(3 downto 0) <= "1000";
						else
							immd(15 downto 3) <= (others => '0');
							immd(2 downto 0) <= instruction(4 downto 2);
						end if;

					when SHIFT_SRL =>
						ex_ctrl.ALU_OP <= THU_ID_SRL;
						reg_wb_type <= WB_EXE;
						if (instruction(4 downto 2) = "000") then
							immd(15 downto 4) <= (others => '0');
							immd(3 downto 0) <= "1000";
						else
							immd(15 downto 3) <= (others => '0');
							immd(2 downto 0) <= instruction(4 downto 2);
						end if;

					when others =>

				end case ;

			when OP_SW =>
				immd(15 downto 5) <= (others => instruction(4));
				immd(4 downto 0) <= instruction(4 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_ADD;
				reg_wb_type <= WB_MEM;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteDisable;
				mem_ctrl.RAM_READ_WRITE <= MEM_WRITE;
				ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			when OP_SW_SP =>
				immd(15 downto 8) <= (others => instruction(7));
				immd(7 downto 0) <= instruction(7 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_ADD;
				reg_wb_type <= WB_MEM;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteDisable;
				mem_ctrl.RAM_READ_WRITE <= MEM_WRITE;
				ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			-- THIS INSTR WE NOT USE SO IT IS NOT COMPLETE
			when OP_ADDSP3 =>
				immd(15 downto 8) <= (others => instruction(7));
				immd(7 downto 0) <= instruction(7 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_ADD;

			when OP_SLTI =>
				immd(15 downto 8) <= (others => instruction(7));
				immd(7 downto 0) <= instruction(7 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_CMP;
				reg_wb_type <= WB_EXE;
				wb_ctrl.WB_CHOOSE <= ALU_DATA;
				wb_ctrl.REG_WN <= WriteEnable;
				mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
				ex_ctrl.REG_WB_CHOOSE <= T_REG;
				ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

			-- THIS INS WE NOT HAVE
			when OP_SLTUI =>
				immd(15 downto 8) <= (others => '0');
				immd(7 downto 0) <= instruction(7 downto 0);
				ex_ctrl.ALU_OP <= THU_ID_CMP;

			when OP_SPECIAL =>
				case (instruction(10 downto 8)) is

					when SPECIAL_ADDSP =>
						immd(15 downto 8) <= (others => instruction(7));
						immd(7 downto 0) <= instruction(7 downto 0);
						ex_ctrl.ALU_OP <= THU_ID_ADD;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= SP_REG;
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

					when SPECIAL_BTEQZ =>
						immd(15 downto 8) <= (others => instruction(7));
						immd(7 downto 0) <= instruction(7 downto 0);
						ex_ctrl.ALU_OP <= THU_ID_BRANCHE;
						reg_wb_type <= WB_NONE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteDisable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
						b_inst <= B_INST_YES;

					when SPECIAL_MTSP =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_ASSIGN;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= SP_REG;
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

					when SPECIAL_BTNEZ =>

						immd(15 downto 8) <= (others => instruction(7));
						immd(7 downto 0) <= instruction(7 downto 0);
						ex_ctrl.ALU_OP <= THU_ID_BRANCHN;
						reg_wb_type <= WB_NONE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteDisable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;
						b_inst <= B_INST_YES;

					when SPECIAL_SW_RS =>
						immd(15 downto 8) <= (others => instruction(7));
						immd(7 downto 0) <= instruction(7 downto 0);
						ex_ctrl.ALU_OP <= THU_ID_ADD;
						reg_wb_type <= WB_NONE;
						reg_wb_type <= WB_MEM;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteDisable;
						mem_ctrl.RAM_READ_WRITE <= MEM_WRITE;
						ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_INS;

					when others =>

				end case ;

			when OP_ADD_SUB_U =>
				case (instruction(1 downto 0)) is
					when (ADD_SUB_U_ADDU) =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_ADD;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(4 downto 2);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;
					when (ADD_SUB_U_SUBU) =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_SUB;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(4 downto 2);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;
					when others =>
				end case ;

			when OP_LOGIC =>
				case( instruction(4 downto 0) ) is

					when LOGIC_AND =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_AND;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

					when LOGIC_CMP =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_EQUAL;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= T_REG;
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

					when LOGIC_PC =>
						case( instruction(7 downto 5) ) is

							when PC_JR =>
								immd(15 downto 0) <= ZERO16;
								ex_ctrl.ALU_OP <= THU_ID_JR;
								jr_or_not <= JR_YES;
								reg_wb_type <= WB_NONE;
								wb_ctrl.WB_CHOOSE <= ALU_DATA;
								wb_ctrl.REG_WN <= WriteDisable;
								mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
								ex_ctrl.REG_WB_CHOOSE <= IMG_REG;
								ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

							when PC_MFPC =>
								immd(15 downto 0) <= ZERO16;
								ex_ctrl.ALU_OP <= THU_ID_ASSIGN;
								reg_wb_type <= WB_MEM;
								wb_ctrl.WB_CHOOSE <= PC_DATA;
								wb_ctrl.REG_WN <= WriteEnable;
								mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
								ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
								ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

							when others =>
						end case ;

					when LOGIC_OR =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_OR;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(10 downto 8);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

					when LOGIC_SRAV =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_SRA;

					when LOGIC_NOT =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_NOT;

					when LOGIC_SLLV =>
						immd(15 downto 0) <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_SLL;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(7 downto 5);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

					when LOGIC_SRLV =>
						immd <= ZERO16;
						ex_ctrl.ALU_OP <= THU_ID_SRL;
						reg_wb_type <= WB_EXE;
						wb_ctrl.WB_CHOOSE <= ALU_DATA;
						wb_ctrl.REG_WN <= WriteEnable;
						mem_ctrl.RAM_READ_WRITE <= MEM_NONE;
						ex_ctrl.REG_WB_CHOOSE <= '0' & instruction(7 downto 5);
						ex_ctrl.ALU1_RI_CHOOSE <= ALU_SRC2_FROM_REG;

					when others =>

				end case ;

			when others =>
				immd <= ZERO16;
				ex_ctrl.ALU_OP <= THU_ID_NOP;

		end case;
	end process;
end architecture; -- arch
