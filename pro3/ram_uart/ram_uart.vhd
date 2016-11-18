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
use IEEE.NUMERIC_STD.ALL;

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
   
  signal main_state: STD_LOGIC;
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

  signal addr : STD_LOGIC_VECTOR(17 DOWNTO 0);
  signal data : STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal adder16 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal adder18 : STD_LOGIC_VECTOR(17 DOWNTO 0);
begin
  switch_proc : process(clk_ram, rst)
  begin
    state <= (not(clk_ram or rst) and sw(0)) or ((clk_ram or rst) and state);
  end process ; -- switch_proc
  PROCESS(CLK,RST)
    VARIABLE work_state : INTEGER RANGE 0 TO 6 := 0;
    -- 0:准备读入地址
    -- 1:准备读入数据
    -- 2:开始写
    -- 3:开始读
    -- 4:终�
    --variable visit_state : INTEGER RANGE 0 TO 2 := 0;
    -- 0:写建立开�
    -- 1:写入
    -- 2：写保持开�
    variable count : INTEGER;
    
    BEGIN
      adder16 <= "0000000000000001";
      adder18 <= "000000000000000001";
      IF(RST = '0') THEN  --初始�
        work_state := 0;
        count := 0;
        rdn <= '1';
        wrn <= '1';
      ELSIF(CLK' EVENT AND CLK = '0') THEN
        case work_state is
          when 0 =>
            addr <= "00" & SW;
            work_state := work_state + 1;
            iL_ram <= "1111000011110000";

          when 1 =>
            data <= SW;
            work_state := work_state + 1;
            iL_ram(7 downto 0) <= addr(7 downto 0);--显示低八�
            iL_ram(15 downto 8) <= data(7 downto 0);
            Ram1OE <= '1';--�
            Ram1WE <= '1';
            Ram1En <= '0';

          when 2 =>
            if(count < 10) then--计数器没�0
              addr <= addr + adder18;
              data <= data + adder16;
              iRam1Addr_ram <= addr;
              iRam1Data_ram <= data;
              Ram1OE <= '1';--�
              Ram1WE <= '0';
              iL_ram(7 downto 0) <= addr(7 downto 0);--显示低八�
              iL_ram(15 downto 8) <= data(7 downto 0);
              count := count + 1;
            else
              addr <= addr - "000000000000001010";--恢复addr
              iRam1Addr_ram <= addr - "000000000000001010";
              iRam1Data_ram <= "ZZZZZZZZZZZZZZZZ";--写入数据高阻�
              Ram1OE <= '0';--�
              Ram1WE <= '1';
              iL_ram <= "1111111111111111";
              count := 0;--重置计数�
              work_state := 3;--进入读状�
            end if;
          
          when 3 =>
            if(count < 10) then--计数器没�0      
              iRam1Data_ram <= "ZZZZZZZZZZZZZZZZ";--写入数据高阻�
              iRam1Addr_ram <= addr + adder18;--准备下次写的ram1addr
              addr <= addr + adder18;--自增
              Ram1OE <= '0';--�
              Ram1WE <= '1';
              iL_ram <= iRam1Data_ram;
              count := count + 1;
            else
              addr <= addr - "000000000000001010";--恢复addr
              data <= data - "0000000000001011";--恢复data
              Ram2Addr <= addr - "000000000000001010";--设置ram2addr
              Ram2Data <= data - "0000000000001011";--设置ram2data，此处需要减1
              Ram2OE <= '1';--�
              Ram2WE <= '1';
              Ram2En <= '0';
              iL_ram <= "1111111111111111";
              count := 0;--重置计数�
              work_state := 4;--进入预备写ram2     
            end if;
            
          when 4 =>
            if(count < 10) then--计数器没�0
              addr <= addr + adder18;
              data <= data + adder16;
              Ram2Addr <= addr;
              Ram2Data <= data;
              Ram2OE <= '1';--�
              Ram2WE <= '0';
              iL_ram(7 downto 0) <= addr(7 downto 0);--显示低八�
              iL_ram(15 downto 8) <= data(7 downto 0);
              count := count + 1;
            else
              addr <= addr - "000000000000001010";--恢复addr
              Ram2Addr <= addr - "000000000000001010";
              Ram2Data <= "ZZZZZZZZZZZZZZZZ";--写入数据高阻�
              Ram2OE <= '0';--�
              Ram2WE <= '1';
              iL_ram <= "1111111111111111";
              count := 0;--重置计数�
              work_state := 5;--进入读状�
            end if;
            
          when 5 =>
            if(count < 10) then--计数器没�0      
              Ram2Data <= "ZZZZZZZZZZZZZZZZ";--写入数据高阻�
              Ram2Addr <= addr + adder18;--准备下次写的ram1addr
              addr <= addr + adder18;--自增
              Ram2OE <= '0';--�
              Ram2WE <= '1';
              iL_ram <= Ram2Data;
              count := count + 1;
            else
              addr <= addr - "000000000000001010";--恢复addr
              data <= data - "0000000000001010";--恢复data
              iL_ram <= "1111111111111111";
              count := 0;--重置计数�
              work_state := 6;--进入终�     
            end if;
          
          when 6 =>
        end case;
        --end if;
      END IF;
    END PROCESS;

end Behavioral;