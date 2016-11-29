--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:00:30 11/28/2016
-- Design Name:   
-- Module Name:   E:/whz/2016Autumn/COD/cpu410/cpu410/testcpuWithram2.vhd
-- Project Name:  cpu410
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vhdcpu410
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.constants.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testcpuWithram2 IS
END testcpuWithram2;
 
ARCHITECTURE behavior OF testcpuWithram2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vhdcpu410
    PORT(
         clk : IN  std_logic;
         Ram1OE : OUT  std_logic;
         Ram1EN : OUT  std_logic;
         Ram1WE : OUT  std_logic;
         Ram1Addr : OUT  std_logic_vector(17 downto 0);
         Ram1Data : INOUT  std_logic_vector(15 downto 0);
         wrn : OUT  std_logic;
         rdn : OUT  std_logic;
         tbre : IN  std_logic;
         tsre : IN  std_logic;
         data_ready : IN  std_logic;
         Ram2OE : OUT  std_logic;
         Ram2EN : OUT  std_logic;
         Ram2WE : OUT  std_logic;
         Ram2Addr : OUT  std_logic_vector(17 downto 0);
         Ram2Data : INOUT  std_logic_vector(15 downto 0);
         DYP0 : OUT  std_logic_vector(6 downto 0);
         DYP1 : OUT  std_logic_vector(6 downto 0);
         L : OUT  std_logic_vector(15 downto 0);
         PC_RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal tbre : std_logic := '1';
   signal tsre : std_logic := '1';
   signal data_ready : std_logic := '1';
   signal PC_RST : std_logic := '1';

	--BiDirs
   signal Ram1Data : std_logic_vector(15 downto 0);
   signal Ram2Data : std_logic_vector(15 downto 0);

 	--Outputs
   signal Ram1OE : std_logic;
   signal Ram1EN : std_logic;
   signal Ram1WE : std_logic;
   signal Ram1Addr : std_logic_vector(17 downto 0);
   signal wrn : std_logic;
   signal rdn : std_logic;
   signal Ram2OE : std_logic;
   signal Ram2EN : std_logic;
   signal Ram2WE : std_logic;
   signal Ram2Addr : std_logic_vector(17 downto 0);
   signal DYP0 : std_logic_vector(6 downto 0);
   signal DYP1 : std_logic_vector(6 downto 0);
   signal L : std_logic_vector(15 downto 0);

  type RAM_type is array(4095 downto 0) of std_logic_vector(15 downto 0) ;
  signal ram1: RAM_type := (others => ZeroWord);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   type cmd_typs is array(0 to 20) of std_logic_vector(15 downto 0) ;
   constant cmds: cmd_typs := (0=>x"0055", 1=>x"0000", 2=> x"0040", 3 => x"0002", 4=> x"0000",
    others=>"0000100000000000");
   signal index: integer:= 0;
   signal state: std_logic := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vhdcpu410 PORT MAP (
          clk => clk,
          Ram1OE => Ram1OE,
          Ram1EN => Ram1EN,
          Ram1WE => Ram1WE,
          Ram1Addr => Ram1Addr,
          Ram1Data => Ram1Data,
          wrn => wrn,
          rdn => rdn,
          tbre => tbre,
          tsre => tsre,
          data_ready => data_ready,
          Ram2OE => Ram2OE,
          Ram2EN => Ram2EN,
          Ram2WE => Ram2WE,
          Ram2Addr => Ram2Addr,
          Ram2Data => Ram2Data,
          DYP0 => DYP0,
          DYP1 => DYP1,
          L => L,
          PC_RST => PC_RST
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
  Ram1Process : process( Ram1En, Ram1OE, Ram1WE, Ram1Addr, Ram1Data, rdn, wrn, clk)
  begin
    if falling_edge(clk)
	 then
    case state is 
    when '0' =>
      if Ram1EN = '0' then
      state <= '1';
        if Ram1OE = '0' then 
          Ram1Data <= ram1(conv_integer(Ram1Addr(11 downto 0)));
        elsif Ram1WE = '0' then
          ram1(conv_integer(Ram1Addr(11 downto 0))) <= Ram1Data;
        end if;
  	  elsif rdn = '0' then
      state <= '1';
    			Ram1Data <= cmds(index);
          index <= index + 1;
      end if;
    when others =>
      state <= '0';
    end case;
    end if;
  end process ; -- Ram1Process

  Ram2Process : process( Ram2EN, Ram2EN, Ram2OE, Ram2Addr )
  begin
    if Ram2En = '0' and ram2OE = '0' then
      case Ram2Addr(15 downto 0) is
            when x"0000" =>
              Ram2Data <= x"0000"; --ADDSP3 R0 0000
                when x"0001" =>
                  Ram2Data <= x"0000"; --ADDSP3 R0 0000
                when x"0002" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0003" =>
                  Ram2Data <= x"1061"; --B 0061
                when x"0004" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0005" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0006" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0007" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0008" =>
                  Ram2Data <= x"6ebf"; --LI R6 00bf
                when x"0009" =>
                  Ram2Data <= x"36c0"; --SLL R6 R6 0000
                when x"000a" =>
                  Ram2Data <= x"4e10"; --ADDIU R6 0010
                when x"000b" =>
                  Ram2Data <= x"de00"; --SW R6 R0 0000
                when x"000c" =>
                  Ram2Data <= x"de21"; --SW R6 R1 0001
                when x"000d" =>
                  Ram2Data <= x"de42"; --SW R6 R2 0002
                when x"000e" =>
                  Ram2Data <= x"de84"; --SW R6 R4 0004
                when x"000f" =>
                  Ram2Data <= x"dea5"; --SW R6 R5 0005
                when x"0010" =>
                  Ram2Data <= x"9100"; --LW-SP R1 0000
                when x"0011" =>
                  Ram2Data <= x"6301"; --ADDSP 0001
                when x"0012" =>
                  Ram2Data <= x"68ff"; --LI R0 00ff
                when x"0013" =>
                  Ram2Data <= x"e90c"; --AND R1 R0
                when x"0014" =>
                  Ram2Data <= x"9200"; --LW-SP R2 0000
                when x"0015" =>
                  Ram2Data <= x"6301"; --ADDSP 0001
                when x"0016" =>
                  Ram2Data <= x"63ff"; --ADDSP ffff
                when x"0017" =>
                  Ram2Data <= x"d300"; --SW-SP R3 0000
                when x"0018" =>
                  Ram2Data <= x"63ff"; --ADDSP ffff
                when x"0019" =>
                  Ram2Data <= x"d700"; --SW-SP R7 0000
                when x"001a" =>
                  Ram2Data <= x"6b0f"; --LI R3 000f
                when x"001b" =>
                  Ram2Data <= x"ef40"; --MFPC R7
                when x"001c" =>
                  Ram2Data <= x"4f03"; --ADDIU R7 0003
                when x"001d" =>
                  Ram2Data <= x"0800"; --NOP
                when x"001e" =>
                  Ram2Data <= x"10ac"; --B 00ac
                when x"001f" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0020" =>
                  Ram2Data <= x"6ebf"; --LI R6 00bf
                when x"0021" =>
                  Ram2Data <= x"36c0"; --SLL R6 R6 0000
                when x"0022" =>
                  Ram2Data <= x"de60"; --SW R6 R3 0000
                when x"0023" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0024" =>
                  Ram2Data <= x"6ebf"; --LI R6 00bf
                when x"0025" =>
                  Ram2Data <= x"36c0"; --SLL R6 R6 0000
                when x"0026" =>
                  Ram2Data <= x"4e10"; --ADDIU R6 0010
                when x"0027" =>
                  Ram2Data <= x"6800"; --LI R0 0000
                when x"0028" =>
                  Ram2Data <= x"e82a"; --CMP R0 R1
                when x"0029" =>
                  Ram2Data <= x"6102"; --BTNEZ 0002
                when x"002a" =>
                  Ram2Data <= x"0800"; --NOP
                when x"002b" =>
                  Ram2Data <= x"9e87"; --LW R6 R4 0007
                when x"002c" =>
                  Ram2Data <= x"6820"; --LI R0 0020
                when x"002d" =>
                  Ram2Data <= x"e82a"; --CMP R0 R1
                when x"002e" =>
                  Ram2Data <= x"6102"; --BTNEZ 0002
                when x"002f" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0030" =>
                  Ram2Data <= x"9e88"; --LW R6 R4 0008
                when x"0031" =>
                  Ram2Data <= x"6810"; --LI R0 0010
                when x"0032" =>
                  Ram2Data <= x"e82a"; --CMP R0 R1
                when x"0033" =>
                  Ram2Data <= x"6102"; --BTNEZ 0002
                when x"0034" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0035" =>
                  Ram2Data <= x"9e89"; --LW R6 R4 0009
                when x"0036" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0037" =>
                  Ram2Data <= x"9ea6"; --LW R6 R5 0006
                when x"0038" =>
                  Ram2Data <= x"eca2"; --SLT R4 R5
                when x"0039" =>
                  Ram2Data <= x"610b"; --BTNEZ 000b
                when x"003a" =>
                  Ram2Data <= x"0800"; --NOP
                when x"003b" =>
                  Ram2Data <= x"de86"; --SW R6 R4 0006
                when x"003c" =>
                  Ram2Data <= x"ef40"; --MFPC R7
                when x"003d" =>
                  Ram2Data <= x"4f03"; --ADDIU R7 0003
                when x"003e" =>
                  Ram2Data <= x"0800"; --NOP
                when x"003f" =>
                  Ram2Data <= x"108b"; --B 008b
                when x"0040" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0041" =>
                  Ram2Data <= x"6ebf"; --LI R6 00bf
                when x"0042" =>
                  Ram2Data <= x"36c0"; --SLL R6 R6 0000
                when x"0043" =>
                  Ram2Data <= x"de20"; --SW R6 R1 0000
                when x"0044" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0045" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0046" =>
                  Ram2Data <= x"6b0f"; --LI R3 000f
                when x"0047" =>
                  Ram2Data <= x"ef40"; --MFPC R7
                when x"0048" =>
                  Ram2Data <= x"4f03"; --ADDIU R7 0003
                when x"0049" =>
                  Ram2Data <= x"0800"; --NOP
                when x"004a" =>
                  Ram2Data <= x"1080"; --B 0080
                when x"004b" =>
                  Ram2Data <= x"0800"; --NOP
                when x"004c" =>
                  Ram2Data <= x"6ebf"; --LI R6 00bf
                when x"004d" =>
                  Ram2Data <= x"36c0"; --SLL R6 R6 0000
                when x"004e" =>
                  Ram2Data <= x"de60"; --SW R6 R3 0000
                when x"004f" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0050" =>
                  Ram2Data <= x"42c0"; --ADDIU3 R2 R6 0000
                when x"0051" =>
                  Ram2Data <= x"f300"; --MFIH R3
                when x"0052" =>
                  Ram2Data <= x"6880"; --LI R0 0080
                when x"0053" =>
                  Ram2Data <= x"3000"; --SLL R0 R0 0000
                when x"0054" =>
                  Ram2Data <= x"eb0d"; --OR R3 R0
                when x"0055" =>
                  Ram2Data <= x"6fbf"; --LI R7 00bf
                when x"0056" =>
                  Ram2Data <= x"37e0"; --SLL R7 R7 0000
                when x"0057" =>
                  Ram2Data <= x"4f10"; --ADDIU R7 0010
                when x"0058" =>
                  Ram2Data <= x"9f00"; --LW R7 R0 0000
                when x"0059" =>
                  Ram2Data <= x"9f21"; --LW R7 R1 0001
                when x"005a" =>
                  Ram2Data <= x"9f42"; --LW R7 R2 0002
                when x"005b" =>
                  Ram2Data <= x"9f84"; --LW R7 R4 0004
                when x"005c" =>
                  Ram2Data <= x"9fa5"; --LW R7 R5 0005
                when x"005d" =>
                  Ram2Data <= x"9700"; --LW-SP R7 0000
                when x"005e" =>
                  Ram2Data <= x"6301"; --ADDSP 0001
                when x"005f" =>
                  Ram2Data <= x"6301"; --ADDSP 0001
                when x"0060" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0061" =>
                  Ram2Data <= x"f301"; --MTIH R3
                when x"0062" =>
                  Ram2Data <= x"ee00"; --JR R6
                when x"0063" =>
                  Ram2Data <= x"93ff"; --LW-SP R3 00ff
                when x"0064" =>
                  Ram2Data <= x"0800"; --NOP
                when x"0065" =>
                  Ram2Data <= x"6807"; --LI R0 0007
                when x"0066" =>
                  Ram2Data <= x"f001"; --MTIH R0
                when x"0067" =>
                  Ram2Data <= x"68bf"; --LI R0 00bf
                when x"0068" =>
                  Ram2Data <= x"3000"; --SLL R0 R0 0000
                when x"0069" =>
                  Ram2Data <= x"4810"; --ADDIU R0 0010
                when x"006a" =>
                  Ram2Data <= x"6400"; --MTSP R0
                when x"006b" =>
                  Ram2Data <= x"0800"; --NOP
                when x"006c" =>
                  Ram2Data <= x"6ebf"; --LI R6 00bf
                when x"006d" =>
                  Ram2Data <= x"36c0"; --SLL R6 R6 0000
                when x"006e" =>
                  Ram2Data <= x"4e10"; --ADDIU R6 0010
                when x"006f" =>
                  Ram2Data <= x"6800"; --LI R0 0000
                when x"0070" =>
                  Ram2Data <= x"de00"; --SW R6 R0 0000
                when x"0071" =>
                  Ram2Data <= x"de01"; --SW R6 R0 0001
                when x"0072" =>
                  Ram2Data <= x"de02"; --SW R6 R0 0002
                when x"0073" =>
                  Ram2Data <= x"de03"; --SW R6 R0 0003
                when x"0074" =>
                  Ram2Data <= x"de04"; --SW R6 R0 0004
                when x"0075" =>
                  Ram2Data <= x"de05"; --SW R6 R0 0005
                when x"0076" =>
                  Ram2Data <= x"de06"; --SW R6 R0 0006
                when x"0077" =>
                  Ram2Data <= x"4801"; --ADDIU R0 0001
                when x"0078" =>
                  Ram2Data <= x"de07"; --SW R6 R0 0007
                when x"0079" =>
                  Ram2Data <= x"4801"; --ADDIU R0 0001
                when x"007a" =>
                  Ram2Data <= x"de08"; --SW R6 R0 0008
                when x"007b" =>
                  Ram2Data <= x"4801"; --ADDIU R0 0001
                when x"007c" =>
                  Ram2Data <= x"de09"; --SW R6 R0 0009
                when x"007d" =>
                  Ram2Data <= x"ef40"; --MFPC R7
                when x"007e" =>
                  Ram2Data <= x"4f03"; --ADDIU R7 0003
                when x"007f" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0080" =>
                  Ram2Data <= x"104a"; -- B 004a
                when x"0081" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0082" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0083" =>
                  Ram2Data <= x"684f"; -- LI R0 004f
                when x"0084" =>
                  Ram2Data <= x"de00"; -- SW R6 R0 0000
                when x"0085" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0086" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0087" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0088" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0089" =>
                  Ram2Data <= x"1041"; -- B 0041
                when x"008a" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"008b" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"008c" =>
                  Ram2Data <= x"684b"; -- LI R0 004b
                when x"008d" =>
                  Ram2Data <= x"de00"; -- SW R6 R0 0000
                when x"008e" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"008f" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0090" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0091" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0092" =>
                  Ram2Data <= x"1038"; -- B 0038
                when x"0093" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0094" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0095" =>
                  Ram2Data <= x"680a"; -- LI R0 000a
                when x"0096" =>
                  Ram2Data <= x"de00"; -- SW R6 R0 0000
                when x"0097" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0098" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0099" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"009a" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"009b" =>
                  Ram2Data <= x"102f"; -- B 002f
                when x"009c" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"009d" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"009e" =>
                  Ram2Data <= x"680d"; -- LI R0 000d
                when x"009f" =>
                  Ram2Data <= x"de00"; -- SW R6 R0 0000
                when x"00a0" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00a1" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"00a2" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"00a3" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00a4" =>
                  Ram2Data <= x"1031"; -- B 0031
                when x"00a5" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00a6" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"00a7" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"00a8" =>
                  Ram2Data <= x"9e20"; -- LW R6 R1 0000
                when x"00a9" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"00aa" =>
                  Ram2Data <= x"e9cc"; -- AND R1 R6
                when x"00ab" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00ac" =>
                  Ram2Data <= x"6852"; -- LI R0 0052 开始检测是否是R
                when x"00ad" =>
                  Ram2Data <= x"e82a"; -- CMP R0 R1
                when x"00ae" =>
                  Ram2Data <= x"6032"; -- BTEQZ 0032
                when x"00af" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00b0" =>
                  Ram2Data <= x"6844"; -- LI R0 0044
                when x"00b1" =>
                  Ram2Data <= x"e82a"; -- CMP R0 R1
                when x"00b2" =>
                  Ram2Data <= x"604d"; -- BTEQZ 004d
                when x"00b3" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00b4" =>
                  Ram2Data <= x"6841"; -- LI R0 0041 检测是否为D命令
                when x"00b5" =>
                  Ram2Data <= x"e82a"; -- CMP R0 R1
                when x"00b6" =>
                  Ram2Data <= x"600e"; -- BTEQZ 000e
                when x"00b7" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00b8" =>
                  Ram2Data <= x"6855"; -- LI R0 0055 检测是否为U
                when x"00b9" =>
                  Ram2Data <= x"e82a"; -- CMP R0 R1
                when x"00ba" =>
                  Ram2Data <= x"6007"; -- BTEQZ 0007
                when x"00bb" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00bc" =>
                  Ram2Data <= x"6847"; -- LI R0 0047 是否为G
                when x"00bd" =>
                  Ram2Data <= x"e82a"; -- CMP R0 R1
                when x"00be" =>
                  Ram2Data <= x"6009"; -- BTEQZ 0009
                when x"00bf" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00c0" =>
                  Ram2Data <= x"17e0"; -- B ffe0
                when x"00c1" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00c2" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00c3" =>
                  Ram2Data <= x"10c0"; -- B 00c0
                when x"00c4" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00c5" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00c6" =>
                  Ram2Data <= x"1082"; -- B 0082
                when x"00c7" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00c8" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00c9" =>
                  Ram2Data <= x"1103"; -- B 0103
                when x"00ca" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00cb" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00cc" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"00cd" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"00ce" =>
                  Ram2Data <= x"4e01"; -- ADDIU R6 0001
                when x"00cf" =>
                  Ram2Data <= x"9e00"; -- LW R6 R0 0000
                when x"00d0" =>
                  Ram2Data <= x"6e01"; -- LI R6 0001
                when x"00d1" =>
                  Ram2Data <= x"e8cc"; -- AND R0 R6
                when x"00d2" =>
                  Ram2Data <= x"20f8"; -- BEQZ R0 fff8
                when x"00d3" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00d4" =>
                  Ram2Data <= x"ef00"; -- JR R7
                when x"00d5" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00d6" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00d7" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"00d8" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"00d9" =>
                  Ram2Data <= x"4e01"; -- ADDIU R6 0001
                when x"00da" =>
                  Ram2Data <= x"9e00"; -- LW R6 R0 0000
                when x"00db" =>
                  Ram2Data <= x"6e02"; -- LI R6 0002
                when x"00dc" =>
                  Ram2Data <= x"e8cc"; -- AND R0 R6
                when x"00dd" =>
                  Ram2Data <= x"20f8"; -- BEQZ R0 fff8
                when x"00de" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00df" =>
                  Ram2Data <= x"ef00"; -- JR R7
                when x"00e0" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00e1" =>
                  Ram2Data <= x"6906"; -- LI R1 0006
                when x"00e2" =>
                  Ram2Data <= x"6a06"; -- LI R2 0006
                when x"00e3" =>
                  Ram2Data <= x"68bf"; -- LI R0 00bf
                when x"00e4" =>
                  Ram2Data <= x"3000"; -- SLL R0 R0 0000
                when x"00e5" =>
                  Ram2Data <= x"4810"; -- ADDIU R0 0010
                when x"00e6" =>
                  Ram2Data <= x"e22f"; -- SUBU R2 R1 R3
                when x"00e7" =>
                  Ram2Data <= x"e061"; -- ADDU R0 R3 R0
                when x"00e8" =>
                  Ram2Data <= x"9860"; -- LW R0 R3 0000
                when x"00e9" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"00ea" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"00eb" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00ec" =>
                  Ram2Data <= x"17de"; -- B ffde
                when x"00ed" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00ee" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"00ef" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"00f0" =>
                  Ram2Data <= x"de60"; -- SW R6 R3 0000
                when x"00f1" =>
                  Ram2Data <= x"3363"; -- SRA R3 R3 0000
                when x"00f2" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"00f3" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"00f4" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00f5" =>
                  Ram2Data <= x"17d5"; -- B ffd5
                when x"00f6" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00f7" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"00f8" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"00f9" =>
                  Ram2Data <= x"de60"; -- SW R6 R3 0000
                when x"00fa" =>
                  Ram2Data <= x"49ff"; -- ADDIU R1 ffff
                when x"00fb" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00fc" =>
                  Ram2Data <= x"29e6"; -- BNEZ R1 ffe6
                when x"00fd" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"00fe" =>
                  Ram2Data <= x"17a2"; -- B ffa2
                when x"00ff" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0100" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0101" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0102" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0103" =>
                  Ram2Data <= x"17d2"; -- B ffd2
                when x"0104" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0105" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0106" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0107" =>
                  Ram2Data <= x"9ea0"; -- LW R6 R5 0000
                when x"0108" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"0109" =>
                  Ram2Data <= x"edcc"; -- AND R5 R6
                when x"010a" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"010b" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"010c" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"010d" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"010e" =>
                  Ram2Data <= x"17c7"; -- B ffc7
                when x"010f" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0110" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0111" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0112" =>
                  Ram2Data <= x"9e20"; -- LW R6 R1 0000
                when x"0113" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"0114" =>
                  Ram2Data <= x"e9cc"; -- AND R1 R6
                when x"0115" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0116" =>
                  Ram2Data <= x"3120"; -- SLL R1 R1 0000
                when x"0117" =>
                  Ram2Data <= x"e9ad"; -- OR R1 R5
                when x"0118" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0119" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"011a" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"011b" =>
                  Ram2Data <= x"17ba"; -- B ffba
                when x"011c" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"011d" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"011e" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"011f" =>
                  Ram2Data <= x"9ea0"; -- LW R6 R5 0000
                when x"0120" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"0121" =>
                  Ram2Data <= x"edcc"; -- AND R5 R6
                when x"0122" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0123" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0124" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0125" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0126" =>
                  Ram2Data <= x"17af"; -- B ffaf
                when x"0127" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0128" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0129" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"012a" =>
                  Ram2Data <= x"9e40"; -- LW R6 R2 0000
                when x"012b" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"012c" =>
                  Ram2Data <= x"eacc"; -- AND R2 R6
                when x"012d" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"012e" =>
                  Ram2Data <= x"3240"; -- SLL R2 R2 0000
                when x"012f" =>
                  Ram2Data <= x"eaad"; -- OR R2 R5
                when x"0130" =>
                  Ram2Data <= x"9960"; -- LW R1 R3 0000
                when x"0131" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0132" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0133" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0134" =>
                  Ram2Data <= x"1796"; -- B ff96
                when x"0135" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0136" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0137" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0138" =>
                  Ram2Data <= x"de60"; -- SW R6 R3 0000
                when x"0139" =>
                  Ram2Data <= x"3363"; -- SRA R3 R3 0000
                when x"013a" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"013b" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"013c" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"013d" =>
                  Ram2Data <= x"178d"; -- B ff8d
                when x"013e" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"013f" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0140" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0141" =>
                  Ram2Data <= x"de60"; -- SW R6 R3 0000
                when x"0142" =>
                  Ram2Data <= x"4901"; -- ADDIU R1 0001
                when x"0143" =>
                  Ram2Data <= x"4aff"; -- ADDIU R2 ffff
                when x"0144" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0145" =>
                  Ram2Data <= x"2aea"; -- BNEZ R2 ffea
                when x"0146" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0147" =>
                  Ram2Data <= x"1759"; -- B ff59
                when x"0148" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0149" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"014a" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"014b" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"014c" =>
                  Ram2Data <= x"1789"; -- B ff89
                when x"014d" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"014e" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"014f" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0150" =>
                  Ram2Data <= x"9ea0"; -- LW R6 R5 0000
                when x"0151" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"0152" =>
                  Ram2Data <= x"edcc"; -- AND R5 R6
                when x"0153" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0154" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0155" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0156" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0157" =>
                  Ram2Data <= x"177e"; -- B ff7e
                when x"0158" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0159" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"015a" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"015b" =>
                  Ram2Data <= x"9e20"; -- LW R6 R1 0000
                when x"015c" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"015d" =>
                  Ram2Data <= x"e9cc"; -- AND R1 R6
                when x"015e" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"015f" =>
                  Ram2Data <= x"3120"; -- SLL R1 R1 0000
                when x"0160" =>
                  Ram2Data <= x"e9ad"; -- OR R1 R5
                when x"0161" =>
                  Ram2Data <= x"6800"; -- LI R0 0000
                when x"0162" =>
                  Ram2Data <= x"e82a"; -- CMP R0 R1
                when x"0163" =>
                  Ram2Data <= x"601d"; -- BTEQZ 001d
                when x"0164" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0165" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0166" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0167" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0168" =>
                  Ram2Data <= x"176d"; -- B ff6d
                when x"0169" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"016a" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"016b" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"016c" =>
                  Ram2Data <= x"9ea0"; -- LW R6 R5 0000
                when x"016d" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"016e" =>
                  Ram2Data <= x"edcc"; -- AND R5 R6
                when x"016f" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0170" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0171" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0172" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0173" =>
                  Ram2Data <= x"1762"; -- B ff62
                when x"0174" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0175" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0176" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0177" =>
                  Ram2Data <= x"9e40"; -- LW R6 R2 0000
                when x"0178" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"0179" =>
                  Ram2Data <= x"eacc"; -- AND R2 R6
                when x"017a" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"017b" =>
                  Ram2Data <= x"3240"; -- SLL R2 R2 0000
                when x"017c" =>
                  Ram2Data <= x"eaad"; -- OR R2 R5
                when x"017d" =>
                  Ram2Data <= x"d940"; -- SW R1 R2 0000
                when x"017e" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"017f" =>
                  Ram2Data <= x"17c9"; -- B ffc9
                when x"0180" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0181" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0182" =>
                  Ram2Data <= x"171e"; -- B ff1e
                when x"0183" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0184" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0185" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0186" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0187" =>
                  Ram2Data <= x"174e"; -- B ff4e
                when x"0188" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0189" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"018a" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"018b" =>
                  Ram2Data <= x"9ea0"; -- LW R6 R5 0000
                when x"018c" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"018d" =>
                  Ram2Data <= x"edcc"; -- AND R5 R6
                when x"018e" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"018f" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"0190" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0191" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0192" =>
                  Ram2Data <= x"1743"; -- B ff43
                when x"0193" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0194" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0195" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0196" =>
                  Ram2Data <= x"9e20"; -- LW R6 R1 0000
                when x"0197" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"0198" =>
                  Ram2Data <= x"e9cc"; -- AND R1 R6
                when x"0199" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"019a" =>
                  Ram2Data <= x"3120"; -- SLL R1 R1 0000
                when x"019b" =>
                  Ram2Data <= x"e9ad"; -- OR R1 R5
                when x"019c" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"019d" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"019e" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"019f" =>
                  Ram2Data <= x"1736"; -- B ff36
                when x"01a0" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01a1" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"01a2" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"01a3" =>
                  Ram2Data <= x"9ea0"; -- LW R6 R5 0000
                when x"01a4" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"01a5" =>
                  Ram2Data <= x"edcc"; -- AND R5 R6
                when x"01a6" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01a7" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"01a8" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"01a9" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01aa" =>
                  Ram2Data <= x"172b"; -- B ff2b
                when x"01ab" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01ac" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"01ad" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"01ae" =>
                  Ram2Data <= x"9e40"; -- LW R6 R2 0000
                when x"01af" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"01b0" =>
                  Ram2Data <= x"eacc"; -- AND R2 R6
                when x"01b1" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01b2" =>
                  Ram2Data <= x"3240"; -- SLL R2 R2 0000
                when x"01b3" =>
                  Ram2Data <= x"eaad"; -- OR R2 R5
                when x"01b4" =>
                  Ram2Data <= x"9960"; -- LW R1 R3 0000
                when x"01b5" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"01b6" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"01b7" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01b8" =>
                  Ram2Data <= x"1712"; -- B ff12
                when x"01b9" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01ba" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"01bb" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"01bc" =>
                  Ram2Data <= x"de60"; -- SW R6 R3 0000
                when x"01bd" =>
                  Ram2Data <= x"3363"; -- SRA R3 R3 0000
                when x"01be" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"01bf" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"01c0" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01c1" =>
                  Ram2Data <= x"1709"; -- B ff09
                when x"01c2" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01c3" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"01c4" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"01c5" =>
                  Ram2Data <= x"de60"; -- SW R6 R3 0000
                when x"01c6" =>
                  Ram2Data <= x"4901"; -- ADDIU R1 0001
                when x"01c7" =>
                  Ram2Data <= x"4aff"; -- ADDIU R2 ffff
                when x"01c8" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01c9" =>
                  Ram2Data <= x"2aea"; -- BNEZ R2 ffea
                when x"01ca" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01cb" =>
                  Ram2Data <= x"16d5"; -- B fed5
                when x"01cc" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01cd" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"01ce" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"01cf" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01d0" =>
                  Ram2Data <= x"1705"; -- B ff05
                when x"01d1" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01d2" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"01d3" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"01d4" =>
                  Ram2Data <= x"9ea0"; -- LW R6 R5 0000
                when x"01d5" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"01d6" =>
                  Ram2Data <= x"edcc"; -- AND R5 R6
                when x"01d7" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01d8" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"01d9" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"01da" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01db" =>
                  Ram2Data <= x"16fa"; -- B fefa
                when x"01dc" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01dd" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"01de" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"01df" =>
                  Ram2Data <= x"9e40"; -- LW R6 R2 0000
                when x"01e0" =>
                  Ram2Data <= x"6eff"; -- LI R6 00ff
                when x"01e1" =>
                  Ram2Data <= x"eacc"; -- AND R2 R6
                when x"01e2" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01e3" =>
                  Ram2Data <= x"3240"; -- SLL R2 R2 0000
                when x"01e4" =>
                  Ram2Data <= x"eaad"; -- OR R2 R5
                when x"01e5" =>
                  Ram2Data <= x"42c0"; -- ADDIU3 R2 R6 0000
                when x"01e6" =>
                  Ram2Data <= x"6fbf"; -- LI R7 00bf
                when x"01e7" =>
                  Ram2Data <= x"37e0"; -- SLL R7 R7 0000
                when x"01e8" =>
                  Ram2Data <= x"4f10"; -- ADDIU R7 0010
                when x"01e9" =>
                  Ram2Data <= x"9fa5"; -- LW R7 R5 0005
                when x"01ea" =>
                  Ram2Data <= x"63ff"; -- ADDSP ffff
                when x"01eb" =>
                  Ram2Data <= x"d500"; -- SW-SP R5 0000
                when x"01ec" =>
                  Ram2Data <= x"f500"; -- MFIH R5
                when x"01ed" =>
                  Ram2Data <= x"6980"; -- LI R1 0080
                when x"01ee" =>
                  Ram2Data <= x"3120"; -- SLL R1 R1 0000
                when x"01ef" =>
                  Ram2Data <= x"ed2d"; -- OR R5 R1
                when x"01f0" =>
                  Ram2Data <= x"9f00"; -- LW R7 R0 0000
                when x"01f1" =>
                  Ram2Data <= x"9f21"; -- LW R7 R1 0001
                when x"01f2" =>
                  Ram2Data <= x"9f42"; -- LW R7 R2 0002
                when x"01f3" =>
                  Ram2Data <= x"9f63"; -- LW R7 R3 0003
                when x"01f4" =>
                  Ram2Data <= x"9f84"; -- LW R7 R4 0004
                when x"01f5" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"01f6" =>
                  Ram2Data <= x"4f04"; -- ADDIU R7 0004
                when x"01f7" =>
                  Ram2Data <= x"f501"; -- MTIH R5
                when x"01f8" =>
                  Ram2Data <= x"ee00"; -- JR R6
                when x"01f9" =>
                  Ram2Data <= x"9500"; -- LW-SP R5 0000
                when x"01fa" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01fb" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"01fc" =>
                  Ram2Data <= x"6301"; -- ADDSP 0001
                when x"01fd" =>
                  Ram2Data <= x"6fbf"; -- LI R7 00bf
                when x"01fe" =>
                  Ram2Data <= x"37e0"; -- SLL R7 R7 0000
                when x"01ff" =>
                  Ram2Data <= x"4f10"; -- ADDIU R7 0010
                when x"0200" =>
                  Ram2Data <= x"df00"; -- SW R7 R0 0000
                when x"0201" =>
                  Ram2Data <= x"df21"; -- SW R7 R1 0001
                when x"0202" =>
                  Ram2Data <= x"df42"; -- SW R7 R2 0002
                when x"0203" =>
                  Ram2Data <= x"df63"; -- SW R7 R3 0003
                when x"0204" =>
                  Ram2Data <= x"df84"; -- SW R7 R4 0004
                when x"0205" =>
                  Ram2Data <= x"dfa5"; -- SW R7 R5 0005
                when x"0206" =>
                  Ram2Data <= x"f000"; -- MFIH R0
                when x"0207" =>
                  Ram2Data <= x"697f"; -- LI R1 007f
                when x"0208" =>
                  Ram2Data <= x"3120"; -- SLL R1 R1 0000
                when x"0209" =>
                  Ram2Data <= x"6aff"; -- LI R2 00ff
                when x"020a" =>
                  Ram2Data <= x"e94d"; -- OR R1 R2
                when x"020b" =>
                  Ram2Data <= x"e82c"; -- AND R0 R1
                when x"020c" =>
                  Ram2Data <= x"f001"; -- MTIH R0
                when x"020d" =>
                  Ram2Data <= x"6907"; -- LI R1 0007
                when x"020e" =>
                  Ram2Data <= x"ef40"; -- MFPC R7
                when x"020f" =>
                  Ram2Data <= x"4f03"; -- ADDIU R7 0003
                when x"0210" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0211" =>
                  Ram2Data <= x"16b9"; -- B feb9
                when x"0212" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0213" =>
                  Ram2Data <= x"6ebf"; -- LI R6 00bf
                when x"0214" =>
                  Ram2Data <= x"36c0"; -- SLL R6 R6 0000
                when x"0215" =>
                  Ram2Data <= x"de20"; -- SW R6 R1 0000
                when x"0216" =>
                  Ram2Data <= x"168a"; -- B fe8a
                when x"0217" =>
                  Ram2Data <= x"0800"; -- NOP
                when x"0218" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
                when x"0219" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
                when x"021a" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
                when x"021b" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
                when x"021c" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
                when x"021d" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
                when x"021e" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
                when x"021f" =>
                  Ram2Data <= x"0000"; -- ADDSP3 R0 0000
					when others =>
						Ram2Data <= "0000100000000000";
      end case ;
    end if;
  end process ; -- Ram2Process

END;
