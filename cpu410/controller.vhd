library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;


entity controller is
 	port (
 		pc : in std_logic_vector(15 downto 0);
 		instruction : in std_logic_vector(15 downto 0);

 		alu_inst: out std_logic_vector(4 downto 0);
 		immd: out std_logic_vector(15 downto 0)
	);
end entity ;


architecture arch of controller is
begin
	process(pc, instruction)
	signal instruction_temp: std_logic_vector(4 downto 0);
	begin
		instruction_temp := instruction(15 downto 11);
		case (instruction_temp) is
			when OP_ADDIU =>
 				immd(15 downto 8) <= (others => instruction(7));
 				immd(7 downto 0) <= instruction(7 downto 0);
 				alu_inst <= THU_ID_ADD;
 			when OP_ADDIU3 =>
 				immd(15 downto 4) <= (others => instruction(3));
 				immd(3 downto 0) <= instruction(3 downto 0);
 				alu_inst <= THU_ID_ADD;
 			when OP_B =>
 				immd(15 downto 11) <= (others => instruction(10));
 				immd(10 downto 0) <= instruction(10 downto 0);
 				alu_inst <= THU_ID_BRANCH;			
 			when OP_BEQZ => 
 				immd(15 downto 8) <= (others => instruction(7));
 				immd(7 downto 0) <= instruction(7 downto 0);
 				alu_inst <= THU_ID_BRANCHE;		
 			when OP_BNEZ =>
 				immd(15 downto 8) <= (others => instruction(7));
 				immd(7 downto 0) <= instruction(7 downto 0);
 				alu_inst <= THU_ID_BRANCHN;		
 			when OP_LI =>
 				immd(15 downto 8) <= (others => '0');
 				immd(7 downto 0) <= instruction(7 downto 0);
 				alu_inst <= THU_ID_ASSIGN;
 			when OP_LW =>
 				immd(15 downto 5) <= (others => instruction(4));
 				immd(4 downto 0) <= instruction(4 downto 0); 	
 				alu_inst <= THU_ID_LOAD;		
 			when OP_LW_SP =>
 				immd(15 downto 8) <= (others => instruction(7));
 				immd(7 downto 0) <= instruction(7 downto 0); 
 				alu_inst <= THU_ID_LOAD;			
 			when OP_IH =>
 				case( instruction(7 downto 0) ) is				
 					when IH_MFIH =>
		 				immd(15 downto 0) <= ZERO16;
						alu_inst <= THU_ID_ASSIGN;
 					when IH_MTIH =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_ASSIGN;
 					when others =>				
 				end case ;
 			when OP_NOP =>
 				immd(15 downto 0) <= ZERO16;
 				alu_inst <= THU_ID_NOP;
 			when OP_SHIFT =>
 				case( instruction(1 downto 0) ) is
 					when SHIFT_SLL =>
 						alu_inst <= THU_ID_SLL;
		 				if (instruction(4 downto 2) = "000") then
			 				immd(15 downto 4) <= (others => '0');
			 				immd(3 downto 0) <= "1000";
			 			else
			 				immd(15 downto 3) <= (others => '0');
			 				immd(2 downto 0) <= instruction(4 downto 2);
			 			end if;	
 					when SHIFT_SRA =>
						alu_inst <= THU_ID_SRA;
		 				if (instruction(4 downto 2) = "000") then
			 				immd(15 downto 4) <= (others => '0');
			 				immd(3 downto 0) <= "1000";
			 			else
			 				immd(15 downto 3) <= (others => '0');
			 				immd(2 downto 0) <= instruction(4 downto 2);
			 			end if;	
 					when SHIFT_SRL =>
						alu_inst <= THU_ID_SRL;
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
 				alu_inst <= THU_ID_ADD;	
 			when OP_SW_SP =>
 				immd(15 downto 8) <= (others => instruction(7));
 				immd(7 downto 0) <= instruction(7 downto 0); 
 				alu_inst <= THU_ID_ADD;	
 			when OP_ADDSP3 =>
 				immd(15 downto 8) <= (others => instruction(7));
 				immd(7 downto 0) <= instruction(7 downto 0);
 				alu_inst <= THU_ID_ADD;
 			when OP_SLTI =>
 				immd(15 downto 8) <= (others => instruction(7));
 				immd(7 downto 0) <= instruction(7 downto 0); 	
 				alu_inst <= THU_ID_CMP;
 			when OP_SLTUI =>
 				immd(15 downto 8) <= (others => '0');
 				immd(7 downto 0) <= instruction(7 downto 0); 
 				alu_inst <= THU_ID_CMP;	
 			when OP_SPECIAL =>
 				case (instruction(10 downto 8)) is
 					when SPECIAL_ADDSP =>
		 				immd(15 downto 8) <= (others => instruction(7));
		 				immd(7 downto 0) <= instruction(7 downto 0); 	
		 				alu_inst <= THU_ID_ADD;	
 					when SPECIAL_BTEQZ =>
		 				immd(15 downto 8) <= (others => instruction(7));
		 				immd(7 downto 0) <= instruction(7 downto 0);
		 				alu_inst <= THU_ID_BRANCHE;		
 					when SPECIAL_MTSP =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_ASSIGN;
 					when SPECIAL_BTNEZ =>
		 				immd(15 downto 8) <= (others => instruction(7));
		 				immd(7 downto 0) <= instruction(7 downto 0); 
		 				alu_inst <= THU_ID_BRANCHN;		
 					when SPECIAL_SW_RS =>
		 				immd(15 downto 8) <= (others => instruction(7));
		 				immd(7 downto 0) <= instruction(7 downto 0); 
		 				alu_inst <= THU_ID_ADD;					
 					when others =>
 				
 				end case ;
 			when OP_ADD_SUB_U =>
 				immd(15 downto 0) <= ZERO16;
 				alu_inst <= THU_ID_SUB;
 			when OP_LOGIC =>
 				case( instruction(4 downto 0) ) is				
 					when LOGIC_AND =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_AND;
 					when LOGIC_CMP =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_EQUAL;
		 			when LOGIC_PC =>
		 				case( instruction(7 downto 5) ) is		 				
		 					when PC_JR =>
				 				immd(15 downto 0) <= ZERO16;
				 				alu_inst <= THU_ID_JR;
		 					when PC_MFPC =>
				 				immd(15 downto 0) <= pc;
				 				alu_inst <= THU_ID_ASSIGN;
		 					when others =>		 				
		 				end case ;
 							
		 			when LOGIC_OR =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_OR;
		 			when LOGIC_SRAV =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_SRA;
		 			when LOGIC_NOT =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_NOT;
		 			when LOGIC_SLLV =>
		 				immd(15 downto 0) <= ZERO16;
		 				alu_inst <= THU_ID_SLL;
		 			when LOGIC_SRLV =>
		 				immd <= ZERO16;
		 				alu_inst <= THU_ID_SRL;
 					when others =>
 				end case ; 				
 			
 			when others =>
				immd <= ZERO16;
				alu_inst <= ALU_NOP;

		end case;
	end process;	
end architecture ; -- arch
