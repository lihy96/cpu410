library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;


entity mux_6_reg is
    Port ( 
    	   Rx_num, Ry_num , Rz_num, T_num, SP_num, IH_num  : in  STD_LOGIC_VECTOR (3 downto 0) ;
           choose : in  STD_LOGIC_VECTOR (2 downto 0) ;
           out_reg_num : out  STD_LOGIC_VECTOR (3 downto 0) 
	);
end mux_6_reg;

architecture Behavioral of mux_5_reg is
begin
	process(Rx_num, Ry_num, Rz_num, T_num, SP_num, IH_num , choose)
	begin
		case choose is
			when WB_reg_num_Rx =>
				out_reg_num <= Rx_num;
			when WB_reg_num_Ry =>
				out_reg_num <= Ry_num;
			when WB_reg_num_Rz =>
				out_reg_num <= Rz_num;
			when WB_reg_num_T =>
				out_reg_num <= T_num;
			when WB_reg_num_SP => 
				out_reg_num <= SP_num;
			when WB_reg_num_IH =>
				out_reg_num <= IH_num;
			when others =>
				out_reg_num <= HIGH_RESIST;
		end case;
	end process;
end Behavioral;