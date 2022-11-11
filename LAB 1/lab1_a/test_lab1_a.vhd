--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:40:00 02/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/lab1_a/test_lab1_a.vhd
-- Project Name:  lab1_a
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab1_a
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
 
ENTITY test_lab1_a IS
END test_lab1_a;
 
ARCHITECTURE behavior OF test_lab1_a IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab1_a
    PORT(
         IN0 : IN  std_logic;
         IN1 : IN  std_logic;
         BTN0 : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         BTN3 : IN  std_logic;
         LED0 : OUT  std_logic;
         LED1 : OUT  std_logic;
         LED2 : OUT  std_logic;
         LED3 : OUT  std_logic;
         LED4 : OUT  std_logic;
         LED5 : OUT  std_logic;
         LED6 : OUT  std_logic;
         LED7 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN0 : std_logic := '0';
   signal IN1 : std_logic := '0';
   signal BTN0 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal BTN3 : std_logic := '0';

 	--Outputs
   signal LED0 : std_logic;
   signal LED1 : std_logic;
   signal LED2 : std_logic;
   signal LED3 : std_logic;
   signal LED4 : std_logic;
   signal LED5 : std_logic;
   signal LED6 : std_logic;
   signal LED7 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab1_a PORT MAP (
          IN0 => IN0,
          IN1 => IN1,
          BTN0 => BTN0,
          BTN1 => BTN1,
          BTN2 => BTN2,
          BTN3 => BTN3,
          LED0 => LED0,
          LED1 => LED1,
          LED2 => LED2,
          LED3 => LED3,
          LED4 => LED4,
          LED5 => LED5,
          LED6 => LED6,
          LED7 => LED7
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      IN0 <= '0';
		IN1 <= '0';
		BTN0 <= '1';
		BTN1 <= '1';
		BTN2 <= '1';
		BTN3 <= '1';
      wait for 100 ns;
      
		IN0 <= '0';
		IN1 <= '1';
		BTN0 <= '1';
		BTN1 <= '1';
		BTN2 <= '1';
		BTN3 <= '1';
      wait for 100 ns;
      
		IN0 <= '1';
		IN1 <= '0';
		BTN0 <= '1';
		BTN1 <= '1';
		BTN2 <= '1';
		BTN3 <= '1';
      wait for 100 ns;	
      
		IN0 <= '1';
		IN1 <= '1';
		BTN0 <= '1';
		BTN1 <= '1';
		BTN2 <= '1';
		BTN3 <= '1';
      wait for 100 ns;	
      
      IN0 <= '1';
		IN1 <= '0';
		BTN0 <= '0';
		BTN1 <= '0';
		BTN2 <= '0';
		BTN3 <= '0';
      wait for 100 ns;
	

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
