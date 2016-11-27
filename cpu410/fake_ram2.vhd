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
	constant LI_R3_85: std_logic_vector(15 downto 0) := "0110101110000101";
	constant SLL_R3_R3_0: std_logic_vector(15 downto 0) := "0011001101100000";
	constant LI_R4_9: std_logic_vector(15 downto 0) := "0110110000001001";
	constant SW_R3_R1_0: std_logic_vector(15 downto 0) := "1101101100100000";
	constant SW_R3_R2_1: std_logic_vector(15 downto 0) := "1101101101000001";
	constant ADDU_R1_R2_R1: std_logic_vector(15 downto 0) := "1110000101000101";
	constant ADDU_R1_R2_R2: std_logic_vector(15 downto 0) := "1110000101001001";
	constant ADDIU_R3_2: std_logic_vector(15 downto 0) := "0100101100000010";
	constant ADDIU_R4_FF: std_logic_vector(15 downto 0) := "0100110011111111";
	constant BNEZ_R4_F9: std_logic_vector(15 downto 0) := "0010110011111001";
	begin
		if ram2OE = '0' and ram2EN = '0' then
			-- wait for 1 ns;
			case addr_in is
				when "0000000000000000" =>
					data_out <= NOP;
				when x"0001" => 
				    data_out <= x"6c48";-- LI R4 0048
				when x"0002" => 
				    data_out <= x"6d85";-- LI R5 0085
				when x"0003" => 
				    data_out <= x"35a0";-- SLL R5 R5 0000
				when x"0004" => 
				    data_out <= x"6800";-- LI R0 0000
				when x"0005" => 
				    data_out <= x"6901";-- LI R1 0001
				when x"0006" => 
				    data_out <= x"dd00";-- SW R5 R0 0000
				when x"0007" => 
				    data_out <= x"dd01";-- SW R5 R0 0001
				when x"0008" => 
				    data_out <= x"dd22";-- SW R5 R1 0002
				when x"0009" => 
				    data_out <= x"4d03";-- ADDIU R5 0003
				when x"000a" => 
				    data_out <= x"dd00";-- SW R5 R0 0000
				when x"000b" => 
				    data_out <= x"dd01";-- SW R5 R0 0001
				when x"000c" => 
				    data_out <= x"dd22";-- SW R5 R1 0002
				when x"000d" => 
				    data_out <= x"4d03";-- ADDIU R5 0003
				when x"000e" => 
				    data_out <= x"9d1f";-- LW R5 R0 ffff
				when x"000f" => 
				    data_out <= x"9d3c";-- LW R5 R1 fffc
				when x"0010" => 
				    data_out <= x"e029";-- ADDU R0 R1 R2
				when x"0011" => 
				    data_out <= x"dd42";-- SW R5 R2 0002
				when x"0012" => 
				    data_out <= x"ea03";-- SLTU R2 R0
				when x"0013" => 
				    data_out <= x"6107";-- BTNEZ 0007
				when x"0014" => 
				    data_out <= x"0800";-- NOP
				when x"0015" => 
				    data_out <= x"ea23";-- SLTU R2 R1
				when x"0016" => 
				    data_out <= x"6104";-- BTNEZ 0004
				when x"0017" => 
				    data_out <= x"0800";-- NOP
				when x"0018" => 
				    data_out <= x"6b00";-- LI R3 0000
				when x"0019" => 
				    data_out <= x"1002";-- B 0002
				when x"001a" => 
				    data_out <= x"0800";-- NOP
				when x"001b" => 
				    data_out <= x"6b01";-- LI R3 0001
				when x"001c" => 
				    data_out <= x"9d1e";-- LW R5 R0 fffe
				when x"001d" => 
				    data_out <= x"9d3b";-- LW R5 R1 fffb
				when x"001e" => 
				    data_out <= x"e029";-- ADDU R0 R1 R2
				when x"001f" => 
				    data_out <= x"e349";-- ADDU R3 R2 R2
				when x"0020" => 
				    data_out <= x"dd41";-- SW R5 R2 0001
				when x"0021" => 
				    data_out <= x"ea03";-- SLTU R2 R0
				when x"0022" => 
				    data_out <= x"6107";-- BTNEZ 0007
				when x"0023" => 
				    data_out <= x"0800";-- NOP
				when x"0024" => 
				    data_out <= x"ea23";-- SLTU R2 R1
				when x"0025" => 
				    data_out <= x"6104";-- BTNEZ 0004
				when x"0026" => 
				    data_out <= x"0800";-- NOP
				when x"0027" => 
				    data_out <= x"6b00";-- LI R3 0000
				when x"0028" => 
				    data_out <= x"1002";-- B 0002
				when x"0029" => 
				    data_out <= x"0800";-- NOP
				when x"002a" => 
				    data_out <= x"6b01";-- LI R3 0001
				when x"002b" => 
				    data_out <= x"9d1d";-- LW R5 R0 fffd
				when x"002c" => 
				    data_out <= x"9d3a";-- LW R5 R1 fffa
				when x"002d" => 
				    data_out <= x"e029";-- ADDU R0 R1 R2
				when x"002e" => 
				    data_out <= x"e349";-- ADDU R3 R2 R2
				when x"002f" => 
				    data_out <= x"dd40";-- SW R5 R2 0000
				when x"0030" => 
				    data_out <= x"4cff";-- ADDIU R4 ffff
				when x"0031" => 
				    data_out <= x"4d03";-- ADDIU R5 0003
				when x"0032" => 
				    data_out <= x"2cdb";-- BNEZ R4 ffdb
				when x"0033" => 
				    data_out <= x"0800";-- NOP
				--when x"0034" => 
				--    data_out <= x"ffff";-- RET
				--when x"0035" => 
				--    data_out <= x"0800";-- NOP
				--when "0000000000000001" => 
				--	data_out <= LI_R1_1;
				--when "0000000000000010" => 
				--	data_out <= LI_R2_1;
				--when "0000000000000011" => 
				--	data_out <= LI_R3_85;
				--when "0000000000000100" => 
				--	data_out <= SLL_R3_R3_0;
				--when "0000000000000101" => 
				--	data_out <= LI_R4_9;
				--when "0000000000000110" => 
				--	data_out <= SW_R3_R1_0;
				--when "0000000000000111" => 
				--	data_out <= SW_R3_R2_1;
				--when "0000000000001000" => 
				--	data_out <= ADDU_R1_R2_R1;
				--when "0000000000001001" => 
				--	data_out <= ADDU_R1_R2_R2;
				--when "0000000000001010" => 
				--	data_out <= ADDIU_R3_2;
				--when "0000000000001011" => 
				--	data_out <= ADDIU_R4_FF;
				--when "0000000000001100" => 
				--	data_out <= BNEZ_R4_F9;
				--when "0000000000001101" =>
				--	data_out <= NOP;

				when others =>
					data_out <= NOP;
			end case ;
		end if;
	end process ;
end Behavioral;
