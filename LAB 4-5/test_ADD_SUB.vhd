--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:51:11 05/15/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_ADD_SUB.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADD_SUB
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
 
ENTITY test_ADD_SUB IS
END test_ADD_SUB;
 
ARCHITECTURE behavior OF test_ADD_SUB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD_SUB
    PORT(
         Praxis : IN  std_logic_vector(1 downto 0);
         Num : IN  std_logic_vector(7 downto 0);
         F_num : OUT  std_logic_vector(7 downto 0);
         Mode : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Praxis : std_logic_vector(1 downto 0) := (others => '0');
   signal Num : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal F_num : std_logic_vector(7 downto 0);
   signal Mode : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD_SUB PORT MAP (
          Praxis => Praxis,
          Num => Num,
          F_num => F_num,
          Mode => Mode
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
		Num<="00001001";
		Praxis<="00";
      wait for 100 ns;
      Num<="01001001";
		Praxis<="01";
      wait for 100 ns;
      Num<="10001101";
		Praxis<="01";
      wait for 100 ns;
      Num<="01001001";
		Praxis<="10";
      wait for 100 ns;
      Num<="01001001";
		Praxis<="11";
      wait for 100 ns;		

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
