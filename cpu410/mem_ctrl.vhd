----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:30:58 11/18/2016 
-- Design Name: 
-- Module Name:    mem_ctrl - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.constants.all;

entity mem_ctrl is
	port(
		-- control signal
		CLK : in STD_LOGIC;
		RAM_READ_WRITE : in STD_LOGIC_VECTOR(1 downto 0);
		-- data signal
		RAM_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		RAM_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		-- data output
		RAM_OUTPUT : out STD_LOGIC_VECTOR(15 downto 0);
		
		-- inner signal, out to ram
		Ram1Addr : out STD_LOGIC_VECTOR(17 downto 0);
		Ram1Data : inout STD_LOGIC_VECTOR(15 downto 0);
		Ram1OE : out STD_LOGIC;
		Ram1WE : out STD_LOGIC;
		Ram1EN : out STD_LOGIC;
		
		-- 串口相关
		rdn : out  STD_LOGIC;
		wrn : out  STD_LOGIC;
		data_ready : in  STD_LOGIC;
		tbre : in  STD_LOGIC;
		tsre : in  STD_LOGIC
	);
end mem_ctrl;

architecture Behavioral of mem_ctrl is
	type state_set is (
		init,
		writing,
		reading,
		uart_writing,
		uart_reading,
		uart_status
	);
	signal state : state_set := init;
	
begin
	process(CLK)
		variable temp:std_logic_vector(15 downto 0);
		begin
		if (CLK'event and CLK = '1') then
			case state is
				when init =>
					case RAM_ADDR is
						when COM_DATA_ADDR => --串口读写
							if RAM_READ_WRITE = MEM_WRITE then --串口写
								state <= uart_writing;
								Ram1EN <= '1';
								Ram1OE <= '1';
								Ram1WE <= '1';
								rdn <= '1';
								wrn <= '0';
								Ram1Data <= RAM_DATA;
							elsif RAM_READ_WRITE = MEM_READ then -- 串口读
								state <= uart_reading;
								Ram1EN <= '1';
								Ram1OE <= '1';
								Ram1WE <= '1';
								rdn <= '0';
								wrn <= '1';
								Ram1Data <= "ZZZZZZZZZZZZZZZZ";
							end if;
							
						when COM_STATUS_ADDR => --串口状态
							state <= uart_status;
							temp:= "0000000000000001";
							temp(0) := tsre and tbre;
							temp(1) := data_ready;
							RAM_OUTPUT <= temp;
						
						when others =>
							if RAM_READ_WRITE = MEM_WRITE then --内存写
								state <= writing;
								Ram1EN <= '0';
								Ram1OE <= '1';
								Ram1WE <= '1';
								rdn <= '1';
								wrn <= '1';
								Ram1Data <= RAM_DATA;
								Ram1Addr <= "00" & RAM_ADDR;
							elsif RAM_READ_WRITE = MEM_READ then --内存读
								state <= reading;
								Ram1EN <= '0';
								Ram1OE <= '1';
								Ram1WE <= '1';
								rdn <= '1';
								wrn <= '1';
								Ram1Data <= "ZZZZZZZZZZZZZZZZ";
								Ram1Addr <= "00" & RAM_ADDR;
							end if;
					end case;
						
				when writing =>
					Ram1WE <= '0';
					RAM_OUTPUT <= "1111111111111111";
					state <= init;
				
				when reading =>
					Ram1OE <= '0';
					RAM_OUTPUT <= Ram1Data;
					state <= init;
					
				when uart_writing =>
					RAM_OUTPUT <= "1111111111111111";
					wrn <= '1';
					state <= init;
				
				when uart_reading =>
					RAM_OUTPUT <= Ram1Data;
					rdn <= '1';
					state <= init;
					
				when uart_status =>
					state <= init;
					temp:= "0000000000000001";
					temp(0) := tsre and tbre;
					temp(1) := data_ready;
					RAM_OUTPUT <= temp;
					
			end case;
		end if;
	end process;
end Behavioral;

