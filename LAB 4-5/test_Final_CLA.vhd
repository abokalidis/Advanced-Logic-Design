--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:44 05/15/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_Final_CLA.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Final_CLA
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
 
ENTITY test_Final_CLA IS
END test_Final_CLA;
 
ARCHITECTURE behavior OF test_Final_CLA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Final_CLA
    PORT(
         A_in : IN  std_logic_vector(7 downto 0);
         B_in : IN  std_logic_vector(7 downto 0);
         C_in : IN  std_logic;
         Outcome : OUT  std_logic_vector(7 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_in : std_logic_vector(7 downto 0) := (others => '0');
   signal B_in : std_logic_vector(7 downto 0) := (others => '0');
   signal C_in : std_logic := '0';

 	--Outputs
   signal Outcome : std_logic_vector(7 downto 0);
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Final_CLA PORT MAP (
          A_in => A_in,
          B_in => B_in,
          C_in => C_in,
          Outcome => Outcome,
          C_out => C_out
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
		A_in<="00000001";
		B_in<="00000010";
		C_in<='0';
      wait for 50 ns;
      A_in<="00100001";
		B_in<="00001010";
		C_in<='0';
      wait for 50 ns;
      A_in<="01000001";
		B_in<="00010010";
		C_in<='1';
      wait for 50 ns;
      A_in<="11000001";
		B_in<="01000010";
		C_in<='0';
      wait for 50 ns;		

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
