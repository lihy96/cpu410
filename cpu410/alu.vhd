----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:31 10/15/2016 
-- Design Name: 
-- Module Name:    ALU - AluBhv 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( input_switch : in  STD_LOGIC_VECTOR (15 downto 0);
           output_res : out  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end ALU;

architecture AluBhv of ALU is
	signal status: std_logic_vector(1 downto 0) := "00";
	signal A: std_logic_vector(15 downto 0);
	signal B: std_logic_vector(15 downto 0);
	signal op: std_logic_vector(3 downto 0);
begin
process(clk, rst)
	variable tmpout: std_logic_vector(15 downto 0);
begin
	if (rising_edge(clk)) then
		case status is 
			when "00" => --initial state. wait for A
				A <= input_switch;
				status <= "01";
			when "01" => --wait for  B
				B <= input_switch;
				status <= "11";
			when "11" => -- wait for op. print 
				op <= input_switch(3 downto 0);
				case input_switch(3 downto 0) is 
					--0000 for add
					when "0000" =>
						tmpout := A + B;
						output_res <= A + B;
						B <= A + B;
					--0001 for sub
					when "0001" =>
						tmpout := A - B;
						output_res <= A - B;
					--0011 for and
					when "0011" =>
						output_res <= A and B;
					--0010 for or
					when "0010" =>
						output_res <= A or B;
					--0110 for xor
					when "0110" =>
						output_res <= A xor B;
					--0111 for not
					when "0111" =>
						output_res <= not A;
					--0101 for sll
					when "0101" =>
						output_res <= to_stdlogicvector(to_bitvector(A) sll CONV_integer(unsigned(B(3 downto 0))));
					--0100 for srl
					when "0100" =>
						output_res <= to_stdlogicvector(to_bitvector(A) srl CONV_integer(unsigned(B(3 downto 0))));
					--1100 for sra
					when "1100" =>
						output_res <= to_stdlogicvector(to_bitvector(A) sra CONV_integer(unsigned(B(3 downto 0))));
					--1101 for rol
					when "1101" =>
						output_res <= to_stdlogicvector(to_bitvector(A) rol CONV_integer(unsigned(B(3 downto 0))));
					when others => null;
				end case;
				status <= "10";
			when "10" => -- back to inital state and output f
				output_res <= "0000000000000000";
				case op is
					when "0000"	=> -- add
						output_res(0) <= (tmpout(15) xor A(15)) and (tmpout(15) xor B(15));
						--sign bit of ABO are 001 or 110
					when "0001" => --sub
						output_res(0) <= (A(15) xor B(15)) and (A(15) xor tmpout(15));
					when others =>
						null;
				end case;
				if tmpout = "0000000000000000" then
					output_res(1) <= '1';
				else
					output_res(1) <= '0';
				end if;
				output_res(2) <= tmpout(15);
				
				status <= "00";
			when others =>
				status <= "00";
		end case;
	end if;
	
	if rst = '0' then
		status <= "00";
		output_res <= "0000000000000000";
	end if;
end process;
end AluBhv;