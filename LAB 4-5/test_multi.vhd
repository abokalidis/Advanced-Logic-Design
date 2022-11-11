--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:13:50 04/28/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_multi.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Multi_Compare
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
 
ENTITY test_multi IS
END test_multi;
 
ARCHITECTURE behavior OF test_multi IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multi_Compare
    PORT(
         X_in : IN  std_logic_vector(4 downto 0);
         Y_in : IN  std_logic_vector(4 downto 0);
         C_in : IN  std_logic_vector(1 downto 0);
         A_out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X_in : std_logic_vector(4 downto 0) := (others => '0');
   signal Y_in : std_logic_vector(4 downto 0) := (others => '0');
   signal C_in : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal A_out : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multi_Compare PORT MAP (
          X_in => X_in,
          Y_in => Y_in,
          C_in => C_in,
          A_out => A_out
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
		X_in<="00001";
      Y_in<="00010";
      C_in<="00";		
      wait for 50 ns;
      X_in<="00001";
      Y_in<="00010";
      C_in<="01";		
      wait for 50 ns;
      X_in<="00001";
      Y_in<="00010";
      C_in<="10";		
      wait for 50 ns;		

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
