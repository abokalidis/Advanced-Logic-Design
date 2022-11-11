--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:34:59 05/08/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_multiplexer.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MULTI_2x1
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
 
ENTITY test_multiplexer IS
END test_multiplexer;
 
ARCHITECTURE behavior OF test_multiplexer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MULTI_2x1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Sel : IN  std_logic;
         X : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Sel : std_logic := '0';

 	--Outputs
   signal X : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MULTI_2x1 PORT MAP (
          A => A,
          B => B,
          Sel => Sel,
          X => X
        );

   -- Clock process definitions
  -- <clock>_process :process
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
		A<='1';
		B<='0';
		Sel<='0';
      wait for 100 ns;	
		A<='1';
		B<='0';
		Sel<='1';
      wait for 100 ns;

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
