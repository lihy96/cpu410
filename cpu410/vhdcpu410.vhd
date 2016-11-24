--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : vhdcpu410.vhf
-- /___/   /\     Timestamp : 11/24/2016 17:21:57
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -flat -suppress -vhdl vhdcpu410.vhf -w D:/Jiyuan/vhdcpu410/vhdcpu410.sch
--Design Name: vhdcpu410
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use work.constants.all;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity vhdcpu410 is
   port (
      clk: in std_logic;
      Ram1OE: out std_logic;
      Ram1EN: out std_logic;
      Ram1WE: out std_logic;
      Ram1Addr: out std_logic_vector(17 downto 0);
      wrn: out std_logic;
      rdn: out std_logic;
      tbre: in std_logic;
      tsre: in std_logic;
      data_ready: in std_logic
			);
end vhdcpu410;

architecture BEHAVIORAL of vhdcpu410 is
   signal XLXN_2                        : std_logic_vector (15 downto 0);
   signal XLXN_3                        : std_logic_vector (15 downto 0);
   signal XLXN_4                        : std_logic_vector (15 downto 0);
   signal XLXN_5                        : std_logic_vector (15 downto 0);
   signal XLXN_6                        : std_logic_vector (1 downto 0);
   signal XLXN_8                        : std_logic_vector (15 downto 0);
   signal XLXN_9                        : std_logic_vector (15 downto 0);
   signal XLXN_10                       : std_logic_vector (3 downto 0);
   signal XLXN_11                       : WB_CONTROL_TYPE;
   signal XLXN_12                       : std_logic_vector (15 downto 0);
   signal XLXN_14                       : WB_CHOOSE_TYPE;
   signal XLXN_15                       : std_logic;
   signal XLXN_16                       : MEM_CTRL_TYPE;
   signal XLXN_17                       : WB_CONTROL_TYPE;
   signal XLXN_18                       : std_logic_vector (15 downto 0);
   signal XLXN_20                       : std_logic_vector (1 downto 0);
   signal XLXN_21                       : std_logic_vector (15 downto 0);
   signal XLXN_22                       : std_logic_vector (15 downto 0);
   signal XLXN_23                       : std_logic_vector (15 downto 0);
   signal XLXN_25                       : std_logic_vector (15 downto 0);
   signal XLXN_28                       : std_logic_vector (15 downto 0);
   signal XLXN_29                       : std_logic_vector (15 downto 0);
   signal XLXN_31                       : std_logic;
   signal XLXN_32                       : std_logic;
   signal XLXN_35                       : std_logic_vector (15 downto 0);
   signal XLXN_36                       : std_logic_vector (15 downto 0);
   signal XLXN_38                       : std_logic_vector (15 downto 0);
   signal XLXN_42_mem                   : MEM_CTRL_TYPE;
   signal XLXN_42_wb                    : WB_CONTROL_TYPE;
   signal XLXN_43                       : ID_EX_LATCH_EX;
   signal XLXN_45                       : ID_EX_LATCH_EX; --change to record
   signal XLXN_47                       : WB_CONTROL_TYPE;
   signal XLXN_48                       : std_logic;
   signal XLXN_54                       : std_logic;
   signal XLXN_56                       : std_logic;
   signal XLXN_58                       : std_logic;
   signal XLXN_59                       : std_logic;
   signal XLXN_60                       : ID_EX_LATCH_MEM; --change to record
   signal XLXN_61                       : std_logic_vector (1 downto 0);
   signal XLXN_62                       : std_logic_vector (1 downto 0);
   signal XLXN_63                       : std_logic_vector (15 downto 0);
   signal XLXN_64                       : std_logic_vector (15 downto 0);
   signal XLXN_65                       : std_logic_vector (15 downto 0);
   signal XLXN_68                       : std_logic_vector (3 downto 0);
   signal XLXN_69                       : std_logic_vector (3 downto 0);
   signal XLXN_70                       : std_logic_vector (4 downto 0);
   signal XLXN_71                       : std_logic_vector (15 downto 0);
   signal XLXN_72                       : std_logic_vector (15 downto 0);
   signal XLXN_73                       : std_logic_vector (15 downto 0);
   signal XLXN_74                       : std_logic;
   signal XLXN_75                       : std_logic_vector (15 downto 0);
   signal XLXN_76                       : std_logic_vector (15 downto 0);
   signal XLXN_77                       : std_logic_vector (15 downto 0);
   signal XLXN_81                       : std_logic_vector (3 downto 0);
   signal XLXN_82                       : std_logic_vector (1 downto 0);
   signal XLXN_83                       : std_logic_vector (1 downto 0);
   signal XLXN_84                       : std_logic_vector (1 downto 0);
   signal XLXN_85                       : std_logic_vector (11 downto 0);
   signal XLXN_88                       : std_logic_vector (15 downto 0);
   signal XLXN_98                       : std_logic;
   signal XLXN_99                       : std_logic_vector (15 downto 0);
   signal XLXN_101                      : std_logic;
   signal XLXN_102                      : std_logic;
   signal XLXN_103                      : std_logic_vector (15 downto 0);
   signal XLXN_104                      : std_logic_vector (3 downto 0);
	--signal XLXI_4_clk_openSignal         : std_logic;
   --signal XLXI_7_clk_openSignal         : std_logic;
   signal XLXI_7_rst_openSignal         : std_logic;
   --signal XLXI_13_clk_openSignal        : std_logic;
   signal XLXI_13_rst_openSignal        : std_logic;
   --signal XLXI_18_data_ready_openSignal : std_logic;
   --signal XLXI_18_tbre_openSignal       : std_logic;
   --signal XLXI_18_tsre_openSignal       : std_logic;
   --signal XLXI_19_CLK_openSignal        : std_logic;
   --signal XLXI_28_clk_openSignal        : std_logic;
   --signal XLXI_31_clk_openSignal        : std_logic;
   --signal XLXI_32_clk_openSignal        : std_logic;
   component if_id_latch
      port ( clk          : in    std_logic; 
             pause        : in    std_logic; 
             in_pc        : in    std_logic_vector (15 downto 0); 
             in_pc_plus1  : in    std_logic_vector (15 downto 0); 
             in_inst      : in    std_logic_vector (15 downto 0); 
             out_pc       : out   std_logic_vector (15 downto 0); 
             out_pc_plus1 : out   std_logic_vector (15 downto 0); 
             out_inst     : out   std_logic_vector (15 downto 0));
   end component;
   
   component id_ex_latch
      port (
		clk: in std_logic;

		in_wb: in WB_CONTROL_TYPE;
		out_wb_ctrl: out WB_CONTROL_TYPE;


		in_mem: in ID_EX_LATCH_MEM;
		out_mem_ctrl: out MEM_CTRL_TYPE;
		out_pause: out std_logic_vector(1 downto 0);

		in_ex: in ID_EX_LATCH_EX;
		out_reg_num_choose: out std_logic_vector(3 downto 0);
		out_alu_op: out std_logic_vector(4 downto 0);
		out_alu1_ri_choose: out std_logic;

		in_Rx_val, in_Ry_val: in std_logic_vector(15 downto 0);
		out_Rx_val, out_Ry_val: out std_logic_vector(15 downto 0);

		in_imme, in_pc : in std_logic_vector(15 downto 0);
		out_imme, out_pc: out std_logic_vector(15 downto 0)
	  );
   end component;
   
   component mem_wb_latch
      Port ( 
		CLK : in STD_LOGIC;
		
		-- data input
		IN_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		IN_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_PC : in STD_LOGIC_VECTOR(15 downto 0);
		IN_REG_NO : in STD_LOGIC_VECTOR(3 downto 0);
		
		-- data output
		OUT_ADDR : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_DATA : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_PC : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_REG_NO : out STD_LOGIC_VECTOR(3 downto 0);
		
		-- control signal input
		IN_WB_CONTROL : in WB_CONTROL_TYPE;
		
		-- control signal output
		--OUT_WB_FORWARD : out STD_LOGIC;
		OUT_WB_CHOOSE : out WB_CHOOSE_TYPE;
		OUT_REG_WN : out STD_LOGIC
		
	);
   end component;
   
   component ex_mem_latch
      Port ( 
		CLK : in STD_LOGIC;
		
		-- data input
		IN_ADDR : in STD_LOGIC_VECTOR(15 downto 0);
		IN_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_PC : in STD_LOGIC_VECTOR(15 downto 0);
		IN_REG_NO : in STD_LOGIC_VECTOR(3 downto 0);
		
		-- data output
		OUT_ADDR : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_DATA : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_PC : out STD_LOGIC_VECTOR(15 downto 0);
		OUT_REG_NO : out STD_LOGIC_VECTOR(3 downto 0);
		
		-- control signal input
		IN_WB_CTRL : in WB_CONTROL_TYPE;
		IN_MEM_CTRL : in MEM_CTRL_TYPE;
		IN_CMP_RS : in STD_LOGIC; --对读写地址进行比较后的结果
		
		-- control signal output
		OUT_WB_CONTROL : out WB_CONTROL_TYPE;
		OUT_RAM1_READ_WRITE : out STD_LOGIC_VECTOR(1 downto 0);
		OUT_RAM2_READ_WRITE : out STD_LOGIC_VECTOR(1 downto 0)
		-- OUT_MEM_FORWARD : out STD_LOGIC
	);
   end component;
   
   component pc_reg
      port ( rst       : in    std_logic; 
             clk       : in    std_logic; 
             pc_pause  : in    std_logic; 
             new_pc    : in    std_logic_vector (15 downto 0); 
             pc_output : out   std_logic_vector (15 downto 0));
   end component;
   
   component pc_adder
      port ( pc_adder_in  : in    std_logic_vector (15 downto 0); 
             pc_adder_out : out   std_logic_vector (15 downto 0));
   end component;
   
--   component inst_ram
--      port ( CLK            : in    std_logic; 
--             RAM_READ_WRITE : in    std_logic_vector (1 downto 0); 
--             RAM_ADDR       : in    std_logic_vector (15 downto 0); 
--             RAM_DATA       : in    std_logic_vector (15 downto 0); 
--             Ram2Data       : inout std_logic_vector (15 downto 0); 
--             Ram2OE         : out   std_logic; 
--             Ram2WE         : out   std_logic; 
--             Ram2EN         : out   std_logic; 
--             RAM_OUTPUT     : out   std_logic_vector (15 downto 0); 
--             Ram2Addr       : out   std_logic_vector (17 downto 0));
--   end component;
	component fake_ram2
		Port ( 
           data_in, addr_in : in  STD_LOGIC_VECTOR (15 downto 0);
           --ram2OE, ram2WE, ram2EN: in std_logic;
			  RAM_READ_WRITE: in std_logic_vector(1 downto 0);
           data_out: out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
   
   component adder
      port ( pc_old : in    std_logic_vector (15 downto 0); 
             imm    : in    std_logic_vector (15 downto 0); 
             pc_new : out   std_logic_vector (15 downto 0));
   end component;
   
   component registers
      port ( clk        : in    std_logic; 
             rst        : in    std_logic; 
             write_en   : in    std_logic; 
             r1_addr    : in    std_logic_vector (3 downto 0); 
             r2_addr    : in    std_logic_vector (3 downto 0); 
             write_addr : in    std_logic_vector (3 downto 0); 
             write_data : in    std_logic_vector (15 downto 0); 
             r1_data    : out   std_logic_vector (15 downto 0); 
             r2_data    : out   std_logic_vector (15 downto 0));
   end component;
   
   component mux3
      port ( data1   : in    std_logic_vector (15 downto 0); 
             data2   : in    std_logic_vector (15 downto 0); 
             data3   : in    std_logic_vector (15 downto 0); 
             choose  : in    std_logic_vector (1 downto 0); 
             outdata : out   std_logic_vector (15 downto 0));
   end component;
   
   component alu
      port ( alu_op1  : in    std_logic_vector (15 downto 0); 
             alu_op2  : in    std_logic_vector (15 downto 0); 
             alu_inst : in    std_logic_vector (4 downto 0); 
             alu_res  : out   std_logic_vector (15 downto 0));
   end component;
   
   component mem_ctrl
      port ( CLK            : in    std_logic; 
             data_ready     : in    std_logic; 
             tbre           : in    std_logic; 
             tsre           : in    std_logic; 
             RAM_READ_WRITE : in    std_logic_vector (1 downto 0); 
             RAM_ADDR       : in    std_logic_vector (15 downto 0); 
             RAM_DATA       : in    std_logic_vector (15 downto 0); 
             Ram1Data       : inout std_logic_vector (15 downto 0); 
             Ram1OE         : out   std_logic; 
             Ram1WE         : out   std_logic; 
             Ram1EN         : out   std_logic; 
             rdn            : out   std_logic; 
             wrn            : out   std_logic; 
             RAM_OUTPUT     : out   std_logic_vector (15 downto 0); 
             Ram1Addr       : out   std_logic_vector (17 downto 0));
   end component;
   
   component wb_mux
      Port ( 
		--CLK : in STD_LOGIC;
		
		-- data input
		IN_ALU_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_MEM_DATA : in STD_LOGIC_VECTOR(15 downto 0);
		IN_PC : in STD_LOGIC_VECTOR(15 downto 0);
		
		-- data output
		OUT_WB_DATA : out STD_LOGIC_VECTOR(15 downto 0);
		
		-- control signal input
		IN_WB_CHOOSE : in WB_CHOOSE_TYPE
		
		-- control signal output
	);
   end component;
   
   component cmp8k
      port ( data_in : in    std_logic_vector (15 downto 0); 
             res     : out   std_logic);
   end component;
   
   component mux2_pc_inst
      port ( choose  : in    std_logic_vector (1 downto 0); 
             pc      : in    std_logic_vector (15 downto 0); 
             addr    : in    std_logic_vector (15 downto 0); 
             outdata : out   std_logic_vector (15 downto 0));
   end component;
   
   component controller
      port (
		instruction : in std_logic_vector(15 downto 0);	-- input instruction

		--lu_inst: out std_logic_vector(4 downto 0);	-- instruction that put to alu
		immd: out std_logic_vector(15 downto 0);	-- immediate that output
		jr_or_not: out std_logic;
		b_inst: out std_logic;
		b_eq_ne: out std_logic;

		wb_ctrl: out WB_CONTROL_TYPE;

		reg_wb_type: out std_logic_vector(1 downto 0);
		-- what kind of value will be written back?
		-- an ALU calculated(known after EXE)?
		-- or read from mem(known after MEM)?
		mem_ctrl: out MEM_CTRL_TYPE;
		ex_ctrl: out ID_EX_LATCH_EX;
		reg_r1: out std_logic_vector(3 downto 0);
		reg_r2: out std_logic_vector(3 downto 0)
	);
   end component;
   
   component mux3_pc
      port ( b_or_not    : in    std_logic; 
             jr_or_not   : in    std_logic; 
             pc_add_1    : in    std_logic_vector (15 downto 0); 
             pc_add_n    : in    std_logic_vector (15 downto 0); 
             pc_from_reg : in    std_logic_vector (15 downto 0); 
             out_next_pc : out   std_logic_vector (15 downto 0));
   end component;
   
   component and_xor_equal
      port ( b_inst       : in    std_logic; 
             b_eq_ne      : in    std_logic; 
             reg1         : in    std_logic_vector (15 downto 0); 
             reg2         : in    std_logic_vector (15 downto 0); 
             out_and_gate : out   std_logic);
   end component;
   
   component ctrl_mux
      Port ( 
    	in_wb_ctrl: in WB_CONTROL_TYPE;
    	in_mem_ctrl: in MEM_CTRL_TYPE;
    	in_ex_ctrl: in ID_EX_LATCH_EX;
		in_reg_wb_type: in std_logic_vector(1 downto 0);
    	pause_or_not: in std_logic;
    	out_wb_ctrl: out WB_CONTROL_TYPE;
    	--out_mem_ctrl: out MEM_CTRL_TYPE;
    	out_ex_ctrl: out ID_EX_LATCH_EX;
		--out_reg_wb_type: out std_logic_vector(1 downto 0)
		out_latch_mem: out ID_EX_LATCH_MEM
         );
   end component;
   
   component pause_pipeline
      port ( clk                : in    std_logic; 
             prev_reg           : in    std_logic_vector (3 downto 0); 
             instr              : in    std_logic_vector (15 downto 0); 
             prev_reg_type      : in    std_logic_vector (1 downto 0); 
             latch_1_pause_ctrl : out   std_logic; 
             pc_pause_ctrl      : out   std_logic; 
             ctrl_choose        : out   std_logic; 
             reg_bus            : out   std_logic_vector (11 downto 0));
   end component;
   
   component mux2
      port ( choose  : in    std_logic; 
             data1   : in    std_logic_vector (15 downto 0); 
             data2   : in    std_logic_vector (15 downto 0); 
             outdata : out   std_logic_vector (15 downto 0));
   end component;
   
   component forward
      port ( clk           : in    std_logic; 
             reg_bus       : in    std_logic_vector (11 downto 0); 
             reg_prev      : in    std_logic_vector (3 downto 0); 
             reg_prev1     : in    std_logic_vector (3 downto 0); 
             reg_prev2     : in    std_logic_vector (3 downto 0); 
             reg_prev_type : in    std_logic_vector (1 downto 0); 
             alu_choose1   : out   std_logic_vector (1 downto 0); 
             alu_choose2   : out   std_logic_vector (1 downto 0); 
             reg_choose1   : out   std_logic_vector (1 downto 0));
   end component;
   
   component clk_ctrl
      port ( clk         : in    std_logic;
             origin_clk  : out   std_logic;
             half_clk    : out   std_logic;
             quarter_clk : out   std_logic);
   end component;
   
begin
   IfIdLatch : if_id_latch
      port map (clk=>XLXN_102,
                in_inst(15 downto 0)=>XLXN_21(15 downto 0),
                in_pc(15 downto 0)=>XLXN_18(15 downto 0),
                in_pc_plus1(15 downto 0)=>XLXN_22(15 downto 0),
                pause=>XLXN_58,
                out_inst(15 downto 0)=>XLXN_29(15 downto 0),
                out_pc(15 downto 0)=>XLXN_103(15 downto 0),
                out_pc_plus1(15 downto 0)=>XLXN_23(15 downto 0));
   
   IdExLatch : id_ex_latch
      port map (clk=>XLXN_102,
                in_ex=>XLXN_45,
                in_imme(15 downto 0)=>XLXN_38(15 downto 0),
                in_mem=>XLXN_60,
                in_pc(15 downto 0)=>XLXN_103(15 downto 0),
                in_Rx_val(15 downto 0)=>XLXN_65(15 downto 0),
                in_Ry_val(15 downto 0)=>XLXN_63(15 downto 0),
                in_wb=>XLXN_47,
                out_alu_op(4 downto 0)=>XLXN_70(4 downto 0),
                out_alu1_ri_choose=>XLXN_74,
                out_imme(15 downto 0)=>XLXN_73(15 downto 0),
                out_mem_ctrl=>XLXN_16,
                out_pause(1 downto 0)=>XLXN_62(1 downto 0),
                out_pc(15 downto 0)=>XLXN_25(15 downto 0),
                out_reg_num_choose(3 downto 0)=>XLXN_81(3 downto 0),
                out_Rx_val(15 downto 0)=>XLXN_71(15 downto 0),
                out_Ry_val(15 downto 0)=>XLXN_72(15 downto 0),
                out_wb_ctrl=>XLXN_17);
   
   MemWbLatch : mem_wb_latch
      port map (CLK=>XLXN_102,
                IN_ADDR(15 downto 0)=>XLXN_88(15 downto 0),
                IN_DATA(15 downto 0)=>XLXN_5(15 downto 0),
                IN_PC(15 downto 0)=>XLXN_9(15 downto 0),
                IN_REG_NO(3 downto 0)=>XLXN_10(3 downto 0),
                IN_WB_CONTROL=>XLXN_11,
                OUT_ADDR(15 downto 0)=>XLXN_3(15 downto 0),
                OUT_DATA(15 downto 0)=>XLXN_2(15 downto 0),
                OUT_PC(15 downto 0)=>XLXN_4(15 downto 0),
                OUT_REG_NO(3 downto 0)=>XLXN_104(3 downto 0),
                OUT_REG_WN=>XLXN_98,
                OUT_WB_CHOOSE=>XLXN_14);
   
   ExMemLatch : ex_mem_latch
      port map (CLK=>XLXN_102,
                IN_ADDR(15 downto 0)=>XLXN_12(15 downto 0),
                IN_CMP_RS=>XLXN_15,
                IN_DATA(15 downto 0)=>XLXN_72(15 downto 0),
                IN_MEM_CTRL=>XLXN_16,
                IN_PC(15 downto 0)=>XLXN_25(15 downto 0),
                IN_REG_NO(3 downto 0)=>XLXN_81(3 downto 0),
                IN_WB_CTRL=>XLXN_17,
                OUT_ADDR(15 downto 0)=>XLXN_88(15 downto 0),
                OUT_DATA(15 downto 0)=>XLXN_8(15 downto 0),
                OUT_PC(15 downto 0)=>XLXN_9(15 downto 0),
                OUT_RAM1_READ_WRITE(1 downto 0)=>XLXN_6(1 downto 0),
                OUT_RAM2_READ_WRITE(1 downto 0)=>XLXN_20(1 downto 0),
                OUT_REG_NO(3 downto 0)=>XLXN_10(3 downto 0),
                OUT_WB_CONTROL=>XLXN_11);
   
   XLXI_7 : pc_reg
      port map (clk=>XLXN_102,
                new_pc(15 downto 0)=>XLXN_35(15 downto 0),
                pc_pause=>XLXN_59,
                rst=>XLXI_7_rst_openSignal,
                pc_output(15 downto 0)=>XLXN_18(15 downto 0));
   
   XLXI_8 : pc_adder
      port map (pc_adder_in(15 downto 0)=>XLXN_18(15 downto 0),
                pc_adder_out(15 downto 0)=>XLXN_22(15 downto 0));
   
--   XLXI_10 : inst_ram
--      port map (CLK=>XLXN_101,
--                RAM_ADDR(15 downto 0)=>XLXN_28(15 downto 0),
--                RAM_DATA(15 downto 0)=>XLXN_8(15 downto 0),
--                RAM_READ_WRITE(1 downto 0)=>XLXN_20(1 downto 0),
--                RAM_OUTPUT(15 downto 0)=>XLXN_21(15 downto 0),
--                Ram2Addr=>open,
--                Ram2EN=>open,
--                Ram2OE=>open,
--                Ram2WE=>open,
--                Ram2Data=>open);
	XLXI_10: fake_ram2
	    Port map( 
           data_in => XLXN_8(15 downto 0),
			  addr_in => XLXN_28(15 downto 0),
           --ram2OE, ram2WE, ram2EN: in std_logic;
			  RAM_READ_WRITE(1 downto 0) => XLXN_20(1 downto 0),
           data_out => XLXN_21(15 downto 0)
         );
   
   XLXI_12 : adder
      port map (imm(15 downto 0)=>XLXN_38(15 downto 0),
                pc_old(15 downto 0)=>XLXN_23(15 downto 0),
                pc_new(15 downto 0)=>XLXN_36(15 downto 0));
   
   XLXI_13 : registers
      port map (clk=>XLXN_102,
                rst=>XLXI_13_rst_openSignal,
                r1_addr(3 downto 0)=>XLXN_68(3 downto 0),
                r2_addr(3 downto 0)=>XLXN_69(3 downto 0),
                write_addr(3 downto 0)=>XLXN_104(3 downto 0),
                write_data(15 downto 0)=>XLXN_99(15 downto 0),
                write_en=>XLXN_98,
                r1_data(15 downto 0)=>XLXN_64(15 downto 0),
                r2_data(15 downto 0)=>XLXN_63(15 downto 0));
   
   XLXI_14 : mux3
      port map (choose(1 downto 0)=>XLXN_82(1 downto 0),
                data1(15 downto 0)=>XLXN_71(15 downto 0),
                data2(15 downto 0)=>XLXN_88(15 downto 0),
                data3(15 downto 0)=>XLXN_99(15 downto 0),
                outdata(15 downto 0)=>XLXN_76(15 downto 0));
   
   XLXI_15 : mux3
      port map (choose(1 downto 0)=>XLXN_83(1 downto 0),
                data1(15 downto 0)=>XLXN_88(15 downto 0),
                data2(15 downto 0)=>XLXN_75(15 downto 0),
                data3(15 downto 0)=>XLXN_99(15 downto 0),
                outdata(15 downto 0)=>XLXN_77(15 downto 0));
   
   XLXI_16 : alu
      port map (alu_inst(4 downto 0)=>XLXN_70(4 downto 0),
                alu_op1(15 downto 0)=>XLXN_76(15 downto 0),
                alu_op2(15 downto 0)=>XLXN_77(15 downto 0),
                alu_res(15 downto 0)=>XLXN_12(15 downto 0));
   
   XLXI_18 : mem_ctrl
      port map (CLK=>XLXN_101,
                data_ready=>data_ready,--XLXI_18_data_ready_openSignal,
                RAM_ADDR(15 downto 0)=>XLXN_88(15 downto 0),
                RAM_DATA(15 downto 0)=>XLXN_8(15 downto 0),
                RAM_READ_WRITE(1 downto 0)=>XLXN_6(1 downto 0),
                tbre=>tbre,--XLXI_18_tbre_openSignal,
                tsre=>tsre,--XLXI_18_tsre_openSignal,
                RAM_OUTPUT(15 downto 0)=>XLXN_5(15 downto 0),
                Ram1Addr=>Ram1Addr,
                Ram1EN=>Ram1EN,
                Ram1OE=>Ram1OE,
                Ram1WE=>Ram1WE,
                rdn=>rdn,
                wrn=>wrn,
                Ram1Data=>open);
   
   XLXI_19 : wb_mux
      port map (
        --CLK=>XLXI_19_CLK_openSignal,
                IN_ALU_DATA(15 downto 0)=>XLXN_3(15 downto 0),
                IN_MEM_DATA(15 downto 0)=>XLXN_2(15 downto 0),
                IN_PC(15 downto 0)=>XLXN_4(15 downto 0),
                IN_WB_CHOOSE=>XLXN_14,
                OUT_WB_DATA(15 downto 0)=>XLXN_99(15 downto 0));
   
   XLXI_20 : cmp8k
      port map (data_in(15 downto 0)=>XLXN_12(15 downto 0),
                res=>XLXN_15);
   
   XLXI_22 : mux2_pc_inst
      port map (addr(15 downto 0)=>XLXN_88(15 downto 0),
                choose(1 downto 0)=>XLXN_20(1 downto 0),
                pc(15 downto 0)=>XLXN_18(15 downto 0),
                outdata(15 downto 0)=>XLXN_28(15 downto 0));
   
   XLXI_23 : controller
      port map (instruction(15 downto 0)=>XLXN_29(15 downto 0),
                b_eq_ne=>XLXN_54,
                b_inst=>XLXN_32,
                ex_ctrl=>XLXN_43,
                immd(15 downto 0)=>XLXN_38(15 downto 0),
                jr_or_not=>XLXN_31,
                mem_ctrl=>XLXN_42_mem,
                reg_r1(3 downto 0)=>XLXN_68(3 downto 0),
                reg_r2(3 downto 0)=>XLXN_69(3 downto 0),
                reg_wb_type(1 downto 0)=>XLXN_61(1 downto 0),
                wb_ctrl=>XLXN_42_wb);
   
   XLXI_24 : mux3_pc
      port map (b_or_not=>XLXN_56,
                jr_or_not=>XLXN_31,
                pc_add_n(15 downto 0)=>XLXN_36(15 downto 0),
                pc_add_1(15 downto 0)=>XLXN_22(15 downto 0),
                pc_from_reg(15 downto 0)=>XLXN_65(15 downto 0),
                out_next_pc(15 downto 0)=>XLXN_35(15 downto 0));
   
   XLXI_25 : and_xor_equal
      port map (b_eq_ne=>XLXN_54,
                b_inst=>XLXN_32,
                reg1(15 downto 0)=>XLXN_65(15 downto 0),
                reg2(15 downto 0)=>XLXN_63(15 downto 0),
                out_and_gate=>XLXN_56);
   
   XLXI_27 : ctrl_mux
      port map (in_ex_ctrl=>XLXN_43,
                in_mem_ctrl=>XLXN_42_mem,
                in_reg_wb_type(1 downto 0)=>XLXN_61(1 downto 0),
                in_wb_ctrl=>XLXN_42_wb,
                pause_or_not=>XLXN_48,
                out_ex_ctrl=>XLXN_45,
                out_latch_mem=>XLXN_60,
                out_wb_ctrl=>XLXN_47);
   
   XLXI_28 : pause_pipeline
      port map (clk=>XLXN_102,
                instr(15 downto 0)=>XLXN_29(15 downto 0),
                prev_reg(3 downto 0)=>XLXN_81(3 downto 0),
                prev_reg_type(1 downto 0)=>XLXN_62(1 downto 0),
                ctrl_choose=>XLXN_48,
                latch_1_pause_ctrl=>XLXN_58,
                pc_pause_ctrl=>XLXN_59,
                reg_bus(11 downto 0)=>XLXN_85(11 downto 0));
   
   XLXI_29 : mux3
      port map (choose(1 downto 0)=>XLXN_84(1 downto 0),
                data1(15 downto 0)=>XLXN_88(15 downto 0),
                data2(15 downto 0)=>XLXN_64(15 downto 0),
                data3(15 downto 0)=>XLXN_99(15 downto 0),
                outdata(15 downto 0)=>XLXN_65(15 downto 0));
   
   XLXI_30 : mux2
      port map (choose=>XLXN_74,
                data1(15 downto 0)=>XLXN_72(15 downto 0),
                data2(15 downto 0)=>XLXN_73(15 downto 0),
                outdata(15 downto 0)=>XLXN_75(15 downto 0));
   
   XLXI_31 : forward
      port map (clk=>XLXN_102,
                reg_bus(11 downto 0)=>XLXN_85(11 downto 0),
                reg_prev(3 downto 0)=>XLXN_81(3 downto 0),
                reg_prev_type(1 downto 0)=>XLXN_62(1 downto 0),
                reg_prev1(3 downto 0)=>XLXN_10(3 downto 0),
                reg_prev2(3 downto 0)=>XLXN_104(3 downto 0),
                alu_choose1(1 downto 0)=>XLXN_82(1 downto 0),
                alu_choose2(1 downto 0)=>XLXN_83(1 downto 0),
                reg_choose1(1 downto 0)=>XLXN_84(1 downto 0));
   
   XLXI_32 : clk_ctrl
      port map (clk=>clk,
                half_clk=>XLXN_102,
                origin_clk=>XLXN_101,
                quarter_clk=>open);
   process(clk)
   begin
     --XLXI_13_rst_openSignal <= RstEnable;
     --wait for 1 ns;
     XLXI_13_rst_openSignal <= RstDisable;
	  XLXI_7_rst_openSignal <= not Pc_reset;
     --wait;
   end process ; -- mp
   
end BEHAVIORAL;


