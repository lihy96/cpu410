library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.ALL;

entity fake_ram2 is
    Port ( 
           data_in, addr_in : in  STD_LOGIC_VECTOR (15 downto 0);
           --ram2OE, ram2WE, ram2EN: in std_logic;
		   RAM_READ_WRITE: in std_logic_vector(1 downto 0);
           data_out: out  STD_LOGIC_VECTOR (15 downto 0)
         );
end fake_ram2;

architecture Behavioral of fake_ram2 is
--type Inst_Array is array(11 downto 0) of std_logic_vector(15 downto 0);
--signal  ia: Inst_Array := 
signal ram2OE, ram2WE, ram2EN: std_logic;
begin
	ram2EN <= '0';
	ram2WE <= RAM_READ_WRITE(0);
	ram2OE <= not ram2WE;
	process(data_in, addr_in, ram_read_write)
	constant NOP: std_logic_vector(15 downto 0) := "0000100000000000";
	constant LI_R1_1: std_logic_vector(15 downto 0) := "0110100100000001";
	constant LI_R2_1: std_logic_vector(15 downto 0) := "0110101000000001";
	constant LI_R3_8: std_logic_vector(15 downto 0) := "0110101110000101";
	constant SLL_R3_R3_0: std_logic_vector(15 downto 0) := "0011001101100000";
	constant LI_R4_9: std_logic_vector(15 downto 0) := "0110110000001001";
	constant SW_R3_R1_0: std_logic_vector(15 downto 0) := "1101101100100000";
	constant SW_R3_R2_1: std_logic_vector(15 downto 0) := "1101101101000001";
	constant ADDU_R1_R2_R1: std_logic_vector(15 downto 0) := "1110000101000101";
	constant ADDU_R1_R2_R2: std_logic_vector(15 downto 0) := "1110000101001001";
	constant ADDIU_R3_2: std_logic_vector(15 downto 0) := "0100101100000010";
	constant ADDIU_R4_FF: std_logic_vector(15 downto 0) := "0100110011111111";
	constant BNEZ_R4_F: std_logic_vector(15 downto 0) := "0010110011111001";
	begin
		if ram2OE = '0' and ram2EN = '0' then
			-- wait for 1 ns;
			case addr_in is
				when "0000000000000000" =>
					data_out <= NOP;
				when "0000000000000001" => 
					data_out <= LI_R1_1;
				when "0000000000000010" => 
					data_out <= LI_R2_1;
				when "0000000000000011" => 
					data_out <= LI_R3_8;
				when "0000000000000100" => 
					data_out <= SLL_R3_R3_0;
				when "0000000000000101" => 
					data_out <= LI_R4_9;
				when "0000000000000110" => 
					data_out <= SW_R3_R1_0;
				when "0000000000000111" => 
					data_out <= SW_R3_R2_1;
				when "0000000000001000" => 
					data_out <= ADDU_R1_R2_R1;
				when "0000000000001001" => 
					data_out <= ADDU_R1_R2_R2;
				when "0000000000001010" => 
					data_out <= ADDIU_R3_2;
				when "0000000000001011" => 
					data_out <= ADDIU_R4_FF;
				when "0000000000001100" => 
					data_out <= BNEZ_R4_F;
				when others =>
			
			end case ;
		end if;
	end process ;
end Behavioral;
