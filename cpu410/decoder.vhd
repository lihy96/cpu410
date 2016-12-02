LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY decoder is
	port(
		data: in std_logic_vector(3 downto 0);
		res: out std_logic_vector(6 downto 0) 
	);
end decoder;

architecture bhv of decoder is
begin
	process(data)
	begin
		case data is			
			when "0000" => res <= "1111110";	--0
			when "0001" => res <= "0110000";	--1
			when "0010" => res <= "1101101";	--2
			when "0011" => res <= "1111001";	--3
			when "0100" => res <= "0110011";	--4
			when "0101" => res <= "1011011";	--5
			when "0110" => res <= "0011111";	--6
			when "0111" => res <= "1110000";	--7
			when "1000" => res <= "1111111";	--8
			when "1001" => res <= "1110011";	--9
			when "1010" => res <= "1110111";	--a
			when "1011" => res <= "0011111";	--b
			when "1100" => res <= "1001110";	--c
			when "1101" => res <= "0111101";	--d
			when "1110" => res <= "1001111";	--e
			when "1111" => res <= "1000111";	--f
			when others => res <= "0000000";	--others
		end case;

	end process;
end bhv;