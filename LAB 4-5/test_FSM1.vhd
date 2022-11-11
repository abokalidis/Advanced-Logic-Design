--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:51:28 04/25/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_FSM1.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_FSM1 IS
END test_FSM1;
 
ARCHITECTURE behavior OF test_FSM1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_1
    PORT(
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         BTN0 : IN  std_logic;
         BTN1 : IN  std_logic;
         Full_Stack : IN  std_logic;
         Empty_Stack : IN  std_logic;
         Mode : IN  std_logic_vector(1 downto 0);
         CounterEnable : OUT  std_logic;
         UpDown : OUT  std_logic;
         Output : OUT  std_logic_vector(1 downto 0);
         CounterRst : OUT  std_logic;
         We : OUT  std_logic_vector(0 downto 0);
         Ovf_Stack : OUT  std_logic;
			ovf : in STD_LOGIC;
			Ctrl : out  STD_LOGIC;
			reg1 : out std_logic;
		   reg2 : out std_logic;
		   reg3 : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';
   signal BTN0 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal Full_Stack : std_logic := '0';
   signal Empty_Stack : std_logic := '0';
   signal Mode : std_logic_vector(1 downto 0) := (others => '0');
   signal ovf : std_logic := '0';
 	--Outputs
   signal CounterEnable : std_logic;
   signal UpDown : std_logic;
   signal Output : std_logic_vector(1 downto 0);
   signal CounterRst : std_logic;
   signal We : std_logic_vector(0 downto 0);
   signal Ovf_Stack : std_logic;
   signal reg1 : std_logic;
   signal reg2 : std_logic;
   signal reg3 : std_logic;
	signal Ctrl : std_logic;
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_1 PORT MAP (
          CLK => CLK,
          Reset => Reset,
          BTN0 => BTN0,
          BTN1 => BTN1,
          Full_Stack => Full_Stack,
          Empty_Stack => Empty_Stack,
          Mode => Mode,
          CounterEnable => CounterEnable,
          UpDown => UpDown,
          Output => Output,
          CounterRst => CounterRst,
          We => We,
          Ovf_Stack => Ovf_Stack,
			 ovf => ovf,
			 reg1 => reg1,
			 reg2 => reg2,
			 reg3 => reg3,
			 Ctrl => Ctrl
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset<='1';
		BTN0<='0';
		BTN1<='0';
		Mode<="00";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='1';
		BTN1<='0';
		Mode<="00";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='1';
		BTN1<='0';
		Mode<="00";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='0';
		BTN1<='1';
		Mode<="00";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='1';
		BTN1<='0';
		Mode<="01";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='0';
		BTN1<='1';
		Mode<="01";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='1';
		BTN1<='0';
		Mode<="10";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='0';
		BTN1<='1';
		Mode<="10";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='0';
		BTN1<='1';
		Mode<="00";
		Empty_Stack<='1';
		Full_Stack<='0';
      wait for 50 ns;
		Reset<='0';
		BTN0<='1';
		BTN1<='0';
		Mode<="00";
		Empty_Stack<='0';
		Full_Stack<='1';
      wait for 50 ns;
		Reset<='1';
		BTN0<='0';
		BTN1<='0';
		Mode<="00";
		Empty_Stack<='0';
		Full_Stack<='0';
      wait for 50 ns;     
          		
		
      wait for CLK_period*10; 

      wait;
   end process;

END;
