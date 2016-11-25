library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;


entity alu is
	port (
		alu_op1 , alu_op2 :   in std_logic_vector(15 downto 0);
		alu_inst :   in std_logic_vector(4 downto 0);
		alu_res : out std_logic_vector(15 downto 0)
	  );
end alu;

architecture Behavioral of alu is
signal alu_res_origin: std_logic_vector(15 downto 0) := ZeroWord ;
begin
alu_res <= alu_res_origin;
process(alu_op1, alu_op2, alu_inst)
	variable res : std_logic_vector(15 downto 0) := ZeroWord;
	begin
		case alu_inst  is
			when ALU_ADD =>
				res := alu_op1 + alu_op2;
			when ALU_SUB =>
				res := alu_op1 - alu_op2;
			when ALU_AND =>
				res := alu_op1 and alu_op2;
			when ALU_OR =>
				res := alu_op1 or alu_op2;
			when ALU_NOT =>
				res := not(alu_op2);
			when ALU_SLL =>
				res := to_stdlogicvector(to_bitvector(alu_op1) sll conv_integer(alu_op2));
			when ALU_SRL =>
				res := to_stdlogicvector(to_bitvector(alu_op1) srl conv_integer(alu_op2));
			when ALU_SRA =>
				res := to_stdlogicvector(to_bitvector(alu_op1) sra conv_integer(alu_op2));
			when ALU_ASSIGN =>
				res := alu_op2;
			when ALU_LOAD =>
				res := alu_op1 + alu_op2;
			when ALU_CMP =>
				if(alu_op1 < alu_op2) then
					res := OneWord;
				else 
					res := ZeroWord;
				end if;
			when ALU_EQUAL =>
				if(alu_op1 = alu_op2) then
					res := ZeroWord;
				else 
					res := OneWord;
				end if;

			when others =>
				NULL;
		end case;

		alu_res <= res;

	end process;
end Behavioral;