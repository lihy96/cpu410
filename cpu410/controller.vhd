library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;


entity controller is
 	port (
 		pc : in std_logic_vector(15 downto 0);
 		instruction : in std_logic_vector(15 downto 0);
 		write_reg_enable, write_mem_enable, write_mem_data_from_reg1: out std_logic; 
 		read_mem_enable, reg1_read_enable, reg2_read_enable: out std_logic;
 		op1_from_reg, op2_from_reg: out std_logic;

 		reg1_addr, reg2_addr, write_reg_addr: out std_logic_vector(3 downto 0);

 		EXEInst: out std_logic_vector(4 downto 0);

 		immd: out std_logic_vector(15 downto 0)
	);
end entity ;



