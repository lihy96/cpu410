library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.constants.all;

entity forward is
  port (
  	reg_bus: in std_logic_vector(11 downto 0) ;
 	reg_prev1: in std_logic_vector(3 downto 0) ;
 	reg_prev2: in std_logic_vector(3 downto 0);
 	reg_prev_type: in std_logic_vector(1 downto 0)
  ) ;
end entity ; -- forward

architecture Behavioral of forward is
	signal reg1: std_logic_vector(3 downto 0) ;
	signal reg2: std_logic_vector(3 downto 0) ;
	signal reg0: std_logic_vector(3 downto 0) ;
	signal reg1_prev_type: std_logic_vector(1 downto 0) ;
	signal reg2_prev_type: std_logic_vector(1 downto 0) ;

begin
	reg1 <= reg_bus(11 downto 8);
	reg2 <= reg_bus(7 downto 4);
	reg0 <= reg_bus(3 downto 0);
	process
	begin
		if reg0 = reg_prev1 and reg1_prev_type = WB_EXE then

		elsif reg0 = reg_prev2 and reg2_prev_type = WB_MEM then
			
		end if;
		
		if rising_edge(clk) then
			reg1_prev_type <= reg_prev_type;
			reg2_prev_type <= reg1_prev_type;
		end if;
	end process ; -- identifier

end architecture ; -- Behavioral