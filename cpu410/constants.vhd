----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:26 11/18/2016 
-- Design Name: 
-- Module Name:    constants - Behavioral 
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
use ieee.numeric_std.all;

package constants is
	constant Pc_reset: std_logic := 1;	--pc是否reset的控制信号
	constant Pc_pause: std_logic := 1;	--pc是否pause的控制信号
	constant Pc_origin_address : std_logic_vector(15 downto 0) := "0000000000000000";	--pc的初始地址
	constant Pc_offset: std_logic_vector(15 downto 0) := "0000000000000001";	--每次pc的偏移量
	type RegArray is array(11 down to 0) of std_logic_vector(15 downto 0);	-- 11个寄存器？8个通用？？？？？？？
	
	constant ZeroWord: std_logic_vector(15 downto 0) := "0000000000000000";	--全0
	constant OneWord: std_logic_vector(15 downto 0) := "0000000000000001";	--1

	constant ReadEnable: std_logic := '1';
	constant WriteEnable: std_logic := '1';
	constant ReadDisable: std_logic := '0';
	constant WriteDisable: std_logic := '0';

end package;



