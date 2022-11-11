--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:48:10 05/16/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_OVF_CLA.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OVF_CLA
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
 
ENTITY test_OVF_CLA IS
END test_OVF_CLA;
 
ARCHITECTURE behavior OF test_OVF_CLA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OVF_CLA
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : IN  std_logic;
         OVF_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal S : std_logic := '0';

 	--Outputs
   signal OVF_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OVF_CLA PORT MAP (
          A => A,
          B => B,
          S => S,
          OVF_out => OVF_out
        );

   -- Clock process definitions
--clock>_process :process
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
		B<='1';
		S<='0';
      wait for 50 ns;
      A<='1';
		B<='1';
		S<='1';
      wait for 50 ns;
      A<='0';
		B<='0';
		S<='1';
      wait for 50 ns;
      A<='1';
		B<='0';
		S<='1';
      wait for 50 ns;				

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
