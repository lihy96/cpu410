----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:18:26 11/07/2016 
-- Design Name: 
-- Module Name:    ram_uart - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram_uart is
    Port ( sw : in  STD_LOGIC_VECTOR (15 downto 0);
           clk_ram : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           L : out  STD_LOGIC_VECTOR (15 downto 0);
           Ram1Data : inout  STD_LOGIC_VECTOR (15 downto 0);
           Ram1Addr : out  STD_LOGIC_VECTOR (17 downto 0);
           Ram1OE : out  STD_LOGIC;
           Ram1WE : out  STD_LOGIC;
           Ram1EN : out  STD_LOGIC;
           Ram2Addr : out  STD_LOGIC_VECTOR (17 downto 0);
           Ram2Data : inout  STD_LOGIC_VECTOR (15 downto 0);
           Ram2OE : out  STD_LOGIC;
           Ram2WE : out  STD_LOGIC;
           Ram2EN : out  STD_LOGIC;
           rdn : out  STD_LOGIC;
           wrn : out  STD_LOGIC;
           clk_uart : in  STD_LOGIC;
           data_ready : in  STD_LOGIC;
           tbre : in  STD_LOGIC;
           tsre : in  STD_LOGIC);
end ram_uart;

architecture Behavioral of ram_uart is
   component ram
    port(
      SW : in STD_LOGIC_VECTOR(15 downto 0);
      CLK : in STD_LOGIC;
      RST : in STD_LOGIC;
      L : out STD_LOGIC_VECTOR(15 downto 0);
      
      Ram1Addr : out STD_LOGIC_VECTOR(17 downto 0);
      Ram1Data : inout STD_LOGIC_VECTOR(15 downto 0);
      Ram1OE : out STD_LOGIC;
      Ram1WE : out STD_LOGIC;
      Ram1EN : out STD_LOGIC;
      
      Ram2Addr : out STD_LOGIC_VECTOR(17 downto 0);
      Ram2Data : inout STD_LOGIC_VECTOR(15 downto 0);
      Ram2OE : out STD_LOGIC;
      Ram2WE : out STD_LOGIC;
      Ram2EN : out STD_LOGIC;
      
      rdn : out STD_LOGIC;
      wrn : out STD_LOGIC
      );
  end component;
  component uart
    port(
      clk : in  STD_LOGIC;
      rst : in  STD_LOGIC;
      L : out  STD_LOGIC_VECTOR (7 downto 0);
      Ram1Data : inout  STD_LOGIC_VECTOR (7 downto 0);
      Ram1OE : out  STD_LOGIC;
      Ram1WE : out  STD_LOGIC;
      Ram1EN : out  STD_LOGIC;
      rdn : out  STD_LOGIC;
      wrn : out  STD_LOGIC;
      data_ready : in  STD_LOGIC;
      tbre : in  STD_LOGIC;
      tsre : in  STD_LOGIC);
  end component;
  signal state: STD_LOGIC;
  signal iL_ram: std_logic_vector(15 downto 0);
  signal iL_uart: std_logic_vector(7 downto 0);
  signal iRam1Data_uart: std_logic_vector(7 downto 0) ;
  signal iRam1Data_ram: std_logic_vector(15 downto 0) ;
  signal iRam1OE_ram: STD_LOGIC;
  signal iRam1OE_uart: STD_LOGIC;
  signal iRam1WE_ram: STD_LOGIC;
  signal iRam1WE_uart: STD_LOGIC;
  signal iRam1EN_ram: STD_LOGIC;
  signal iRam1EN_uart: STD_LOGIC;
  signal irdn_ram: STD_LOGIC;
  signal irdn_uart: STD_LOGIC;
  signal iwrn_ram: STD_LOGIC;
  signal iwrn_uart: STD_LOGIC;
begin
  uart_cmpt: uart port map(
    clk => clk_uart,
    rst => rst,
    L => iL_uart,
    Ram1Data => iRam1Data_uart,
    Ram1OE => iRam1OE_uart,
    Ram1EN => iRam1EN_uart,
    Ram1WE => iRam1WE_uart,
    rdn => irdn_uart,
    wrn => iwrn_uart,
    data_ready => data_ready,
    tbre => tbre,
    tsre => tsre
  );
  ram_cmpt: ram port map(
    sw => sw,
    clk => clk_ram,
    rst => rst,
    L => iL_ram,
    
    Ram1Addr => Ram1Addr,
    Ram1Data => iRam1Data_ram,
    Ram1OE => iRam1OE_ram,
    Ram1WE => iRam1WE_ram,
    Ram1EN => iRam1EN_ram,

    Ram2Addr => Ram2Addr,
    Ram2Data => Ram2Data,
    Ram2OE => Ram2OE,
    Ram2WE => Ram2WE,
    Ram2EN => Ram2EN,

    rdn => irdn_ram,
    wrn => iwrn_ram
  );
  switch_proc : process(clk_ram, rst)
  begin
    state <= (not(clk_ram or rst) and sw(0)) or ((clk_ram or rst) and state);
  end process ; -- switch_proc
  main_proc : process(clk_ram, clk_uart, rst, iRam1OE_ram, iRam1WE_ram)
  begin
    case state is
      when '0' => -- ram read-write
        L <= iL_ram;
        if iRam1WE_ram = '0' then
          Ram1Data <= iRam1Data_ram;
        elsif iRam1OE_ram = '0' then
          iRam1Data_ram <= Ram1Data;
        end if;
      when '1' =>
        
      when others =>
    end case ;
  end process ; -- main_proc

end Behavioral;