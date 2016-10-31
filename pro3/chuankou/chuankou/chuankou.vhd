----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:09 10/30/2016 
-- Design Name: 
-- Module Name:    chuankou - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity chuankou is
	port(
		CLK	:	in std_logic;
		RST	:	in std_logic;
		SW		:	in std_logic_vector(7 downto 0);	-- 读入
		L		:	out std_logic_vector(7 downto 0);	-- LED灯输出
		Ram1Data 	: inout std_logic_vector(7 downto 0);	--双向,数据总线
		Ram1WE		: out std_logic;	--RAM1写使能
		Ram1OE		: out std_logic;	--输出使能
		Ram1EN		: out std_logic;	--使能
		data_ready 	: in std_logic;	--数据准备信号
		tbre			: in std_logic;	--发送数据标志
		tsre			: in std_logic;	--数据发送完毕标志
		rdn			: out std_logic;	--读串口
		wrn			: out std_logic	--写串口
	);
end chuankou;

architecture Behavioral of chuankou is
	type state_set is (
		init,		--	有限状态自动机
		write_state_1,
		write_state_2,
		write_state_3,
		write_state_4,
		read_state_1,
		read_state_2,
		read_state_3
		);
	signal state : state_set := init;
	signal data : std_logic_vector(7 downto 0);
begin
	process(CLK, RST)
	begin
		if (RST = '0') then		--reset的时候初始化，
			wrn <= '1'; 
			Ram1EN <= '1';
			Ram1OE <= '1';
			Ram1WE <= '1';
			rdn <= '1';	
			state <= init;
		elsif (CLK'event and CLK = '0') then
			case state is
				when init =>			-- 初始化状态
					state <= read_state_1;	-- 初始状态后进入读的第一个状态
				when write_state_1 =>
					Ram1Data <= data + 1;	-- 准备数据
					wrn <= '0';		-- wrn置0
					state <= write_state_2;
				when write_state_2 => 
					wrn <= '1';		-- wrn置1
					state <= write_state_3;
				when write_state_3 =>
					if (tbre = '1') then	-- 等待tbre为1
						state <= write_state_4;
					end if;
				when write_state_4 => 
					if (tsre = '1') then	-- 等待tsre为1，发送完毕
						state <= init;
					end if;
				when read_state_1 =>			-- 读准备状态
					rdn <= '1';		-- rdn置1
					Ram1Data <= (Others => 'Z');	-- Ram1数据线置于高阻状态
					state <= read_state_2;
				when read_state_2 =>	
					if (data_ready = '1') then	
						rdn <= '0';		-- rdn置0，开始读数据啦哈哈哈
						state <= read_state_3;
					else
						state <= read_state_1;	-- 没准备好回去
					end if;
				when read_state_3 =>
					L <= Ram1Data;		-- 接收串口的数据，显示出来
					data <= Ram1Data; -- 记录数据，加1后返回
					rdn <= '1';			-- 关闭数据读入
					state <= write_state_1;				
			end case;
		
		end if;
	end process;
end Behavioral;

