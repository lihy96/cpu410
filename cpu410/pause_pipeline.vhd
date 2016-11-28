----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:23:47 11/20/2016 
-- Design Name: 
-- Module Name:    pause_pipeline - Behavioral 
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
use work.constants.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pause_pipeline is
    Port ( latch_pause_ctrl : out  STD_LOGIC;
           pc_pause_ctrl : out  STD_LOGIC;
           --ctrl_choose : out  STD_LOGIC; -- '1' for pause, that is to choose all '0' this period
           reg_bus: out std_logic_vector(11 downto 0) ;
           clk: in STD_LOGIC;
           prev_reg : in  STD_LOGIC_VECTOR (3 downto 0);
           instr : in  STD_LOGIC_VECTOR (15 downto 0);
           prev_reg_type : in  STD_LOGIC_VECTOR (1 downto 0);
           ram2_read_write: in std_logic_vector(1 downto 0)
           );
end pause_pipeline;

architecture Behavioral of pause_pipeline is
signal reg1: std_logic_vector(3 downto 0) := IMG_REG; -- refered when EXE
signal reg2: std_logic_vector(3 downto 0) := IMG_REG; -- refered when EXE
signal reg0: std_logic_vector(3 downto 0) := IMG_REG; -- refered when ID
signal prev_reg1: std_logic_vector(3 downto 0);
signal prev_reg2: std_logic_vector(3 downto 0) ;
signal prev_reg1_type: std_logic_vector(1 downto 0);
signal prev_reg2_type: std_logic_vector(1 downto 0);
signal pause: std_logic;
begin
	prev_reg1 <= prev_reg;
	prev_reg1_type <= prev_reg_type;
	reg_bus <= reg1 & reg2 & reg0;
	process(instr, clk, prev_reg, prev_reg_type, prev_reg1_type, prev_reg1, prev_reg2_type, prev_reg2)
	begin
		case instr(15 downto 11) is
			when OP_ADDIU | OP_ADDIU3 | OP_LW | OP_SLTI | OP_LI=>
			-- only rx refered at 8 to 10
				reg0 <= IMG_REG;
				reg1 <= '0' & instr(10 downto 8);
				reg2 <= IMG_REG;
			when OP_SW_SP =>
				reg0 <= IMG_REG;
				reg1 <= SP_REG;
				reg2 <= '0' & instr(10 downto 8);
			when OP_BEQZ | OP_BNEZ =>
				reg0 <= '0' & instr(10 downto 8);	
				reg1 <= IMG_REG;
				reg2 <= IMG_REG;
			when OP_ADD_SUB_U => --ADDU, SUBU
			-- rx ry refered at 8to 10, 5 to 7
				reg0 <= IMG_REG;
				reg1 <= '0'&instr(10 downto 8);
				reg2 <= '0'&instr(7 downto 5);
			when OP_LOGIC => -- LOGIC: AND, OR, SLLV, SRLV, CMP. do nothing with MFPC
				case instr(4 downto 0) is
					when LOGIC_PC =>
						if instr(7 downto 5) = PC_JR then
							reg0 <= '0'&instr(10 downto 8);
							reg1 <= IMG_REG;
							reg2 <= IMG_REG;
						end if;
					when others =>
						reg0 <= IMG_REG;
						reg1 <= '0' & instr(10 downto 8);
						reg2 <= '0' & instr(7 downto 5);
				end case;
			when OP_SHIFT=>-- SRA, SLL
				reg0 <= IMG_REG;
				reg2 <= IMG_REG;
				reg1 <= '0' & instr(7 downto 5);
			when OP_SW =>
				reg0 <= IMG_REG;
				reg1 <= '0' & instr(10 downto 8);
				reg2 <= '0' & instr(7 downto 5);
			when OP_SPECIAL => --ADDSP, BTEQZ, BTNEZ, MTSP, SW_RS
			-- rx and special register refered
				case instr(10 downto 8) is
					when SPECIAL_ADDSP =>
						reg0 <= IMG_REG;
						reg1 <= SP_REG;
						reg2 <= IMG_REG;
					when SPECIAL_BTEQZ | SPECIAL_BTNEZ =>
						reg0 <= T_REG;
						reg1 <= IMG_REG;
						reg2 <= IMG_REG;
					when SPECIAL_MTSP =>
						reg0 <= IMG_REG;
						reg1 <= '0' & instr(7 downto 5);
						reg2 <= IMG_REG;
					when SPECIAL_SW_RS =>
						reg0 <= IMG_REG;
						reg1 <= SP_REG;
						reg2 <= RA_REG;
					when others =>
						reg0 <= IMG_REG;
						reg1 <= IMG_REG;
						reg2 <= IMG_REG;
				end case;
			when OP_LW_SP => 
				reg0 <= IMG_REG;
				reg1 <= SP_REG;
				reg2 <= IMG_REG;
			when OP_IH =>
				reg0 <= IMG_REG;
				reg2 <= IMG_REG;
				case instr(7 downto 0) is
					when IH_MFIH =>
						reg1 <= IH_REG;
					when IH_MTIH =>
						reg1 <= '0' & instr(10 downto 8);
					when others =>
						reg1 <= IMG_REG;
				end case ;
			--when OP_B | OP_NOP =>-- DO NOTHING
			when others =>
				reg0 <= IMG_REG;
				reg1 <= IMG_REG;
				reg2 <= IMG_REG;
		end case;
		if (prev_reg1_type = WB_MEM and ((prev_reg1 = reg1 and prev_reg1 /= IMG_REG) or (prev_reg1 = reg2 and prev_reg1 /= IMG_REG))) or
		   ((prev_reg1_type = WB_MEM or prev_reg1_type = WB_EXE) and prev_reg1 = reg0 and prev_reg1 /= IMG_REG) or
		   (prev_reg2_type = WB_MEM and prev_reg2 = reg0 and reg0 /= IMG_REG) or
		   ram2_read_write = MEM_WRITE
		   then -- pause at once!
			--pause <= '1';
			pc_pause_ctrl <= Pc_pause;
			latch_pause_ctrl <= IF_ID_LATCH_PAUSE;
			--ctrl_choose <= '1';
			
		else
			--pause <= '0';
			pc_pause_ctrl <= not Pc_pause;
			latch_pause_ctrl <= not IF_ID_LATCH_PAUSE;
			--ctrl_choose <= '0';
		end if;

		--if pause = '1' then -- we need to pause
		--else
			
		--end if ;
		if rising_edge(clk) then
			prev_reg2 <= prev_reg1;
			prev_reg2_type <= prev_reg1_type;
			
		end if;
	end process ;

end Behavioral;

