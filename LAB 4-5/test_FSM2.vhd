--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:16:05 04/25/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_FSM2.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_2
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
 
ENTITY test_FSM2 IS
END test_FSM2;
 
ARCHITECTURE behavior OF test_FSM2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_2
    PORT(
         BTN2 : IN  std_logic;
         CLK : IN  std_logic;
         MODE : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BTN2 : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal MODE : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_2 PORT MAP (
          BTN2 => BTN2,
          CLK => CLK,
          MODE => MODE
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
      BTN2<='0';
      wait for 10 ns;
      BTN2<='1';
      wait for 10 ns;
      BTN2<='0';
      wait for 10 ns;
      BTN2<='1';
      wait for 10 ns;
      BTN2<='0';
      wait for 10 ns;
      BTN2<='1';
      wait for 10 ns;
      BTN2<='0';
      wait for 10 ns;		

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
