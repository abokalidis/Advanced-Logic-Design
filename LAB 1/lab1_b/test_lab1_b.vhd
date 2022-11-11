--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:17:06 02/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/lab1_b/test_lab1_b.vhd
-- Project Name:  lab1_b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
ENTITY test_lab1_b IS
END test_lab1_b;
 
ARCHITECTURE behavior OF test_lab1_b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         IN0 : IN  std_logic;
         IN1 : IN  std_logic;
         IN2 : IN  std_logic;
         LED0 : OUT  std_logic;
         LED1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN0 : std_logic := '0';
   signal IN1 : std_logic := '0';
   signal IN2 : std_logic := '0';

 	--Outputs
   signal LED0 : std_logic;
   signal LED1 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          IN0 => IN0,
          IN1 => IN1,
          IN2 => IN2,
          LED0 => LED0,
          LED1 => LED1
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
		IN0<='0';
		IN1<='0';
		IN2<='0';
      wait for 100 ns;
      IN0<='0';
		IN1<='1';
		IN2<='0';
      wait for 100 ns;
      IN0<='1';
		IN1<='0';
		IN2<='0';
      wait for 100 ns;
      IN0<='1';
		IN1<='1';
		IN2<='0';
      wait for 100 ns;

      IN0<='0';
		IN1<='0';
		IN2<='1';
      wait for 100 ns;
      IN0<='0';
		IN1<='1';
		IN2<='1';
      wait for 100 ns;
      IN0<='1';
		IN1<='0';
		IN2<='1';
      wait for 100 ns;
      IN0<='1';
		IN1<='1';
		IN2<='1';
      wait for 100 ns;		

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
