--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:16:39 11/28/2016
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
         L : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal tbre : std_logic := '0';
   signal tsre : std_logic := '0';
   signal data_ready : std_logic := '0';

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

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
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
          L => L
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
