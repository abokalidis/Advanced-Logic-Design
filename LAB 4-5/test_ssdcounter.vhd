--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:32:20 05/08/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_ssdcounter.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ssdFSM
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
 
ENTITY test_ssdcounter IS
END test_ssdcounter;
 
ARCHITECTURE behavior OF test_ssdcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ssdFSM
    PORT(
         CLK : IN  std_logic;
         reset : IN  std_logic;
         En : IN  std_logic;
         Output : OUT  std_logic_vector(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal reset : std_logic := '0';
   signal En : std_logic := '0';

 	--Outputs
   signal Output : std_logic_vector(16 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ssdFSM PORT MAP (
          CLK => CLK,
          reset => reset,
          En => En,
          Output => Output
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
      -- hold reset state for 100 ns.
		reset<='1';
      wait for 100 ns;
      reset<='0';
		En<='1';
      wait for 100 ns;
		reset<='0';
		En<='0';
      wait for 100 ns;



      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
