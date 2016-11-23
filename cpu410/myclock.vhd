library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.constants.ALL;


entity myclock is
	port(
		Reset : IN  std_logic;
		Clock_50: 		in std_logic;
		Clock_50_out, Clock_25_out, Clock_12_out: out std_logic	--输出时钟频率
	);
end myclock;

architecture Behavioral of myclock is
	signal clk_12M: std_logic := '0';
	signal clk_25M:	std_logic := '0';
	shared variable count_flash: integer := 0;	--等待flash读取
	shared variable count_25: integer := 0;	--分别用于2分频，4分频，很慢的频率调试用
	shared variable count_12: integer := 0;
begin
	Clock_50_out <= Clock_50;
	Clock_25_out <= clk_25M;
	Clock_12_out <= clk_12M;
	process(Clock_50)
	begin
		if Clock_50'event and Clock_50 = '0' then
			if (count_flash > Clock_wait_num_before_work) then	-- 程序刚启动先不执行，等待读取flash
				count_25 := count_25 + 1;
				if (count_25 = 1) then	--这里应该等于1，25M
					clk_25M <= not clk_25M;
					count_25 := 0;
				end if;
				
				count_12 := count_12 + 1;
				if (count_12 = 3) then	--4分频，12M
					clk_12M <= not clk_12M;
					count_12 := 0;
				end if;
			else
				count_flash := count_flash + 1;
			end if;
		end if;
		Clock_12_out <= '0';
	end process;

end Behavioral;

