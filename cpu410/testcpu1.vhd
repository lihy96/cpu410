--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:09:53 11/24/2016
-- Design Name:   
-- Module Name:   E:/whz/2016Autumn/COD/cpu410/cpu410/testcpu.vhd
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
 
ENTITY testcpu IS
END testcpu;
 
ARCHITECTURE behavior OF testcpu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vhdcpu410
    PORT(
         clk : IN  std_logic;
         Ram1OE : OUT  std_logic;
         Ram1EN : OUT  std_logic;
         Ram1WE : OUT  std_logic;
         Ram1Addr : OUT  std_logic_vector(17 downto 0);
         wrn : OUT  std_logic;
         rdn : OUT  std_logic;
         tbre : IN  std_logic;
         tsre : IN  std_logic;
         data_ready : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal tbre : std_logic := '0';
   signal tsre : std_logic := '0';
   signal data_ready : std_logic := '0';

 	--Outputs
   signal Ram1OE : std_logic;
   signal Ram1EN : std_logic;
   signal Ram1WE : std_logic;
   signal Ram1Addr : std_logic_vector(17 downto 0);
   signal wrn : std_logic;
   signal rdn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 2 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vhdcpu410 PORT MAP (
          clk => clk,
          Ram1OE => Ram1OE,
          Ram1EN => Ram1EN,
          Ram1WE => Ram1WE,
          Ram1Addr => Ram1Addr,
          wrn => wrn,
          rdn => rdn,
          tbre => tbre,
          tsre => tsre,
          data_ready => data_ready
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

END;
