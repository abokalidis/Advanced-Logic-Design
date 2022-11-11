--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:50:08 03/13/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/lab2_b/lab2_b_test.vhd
-- Project Name:  lab2_b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FINAL_FSM
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
 
ENTITY lab2_b_test IS
END lab2_b_test;
 
ARCHITECTURE behavior OF lab2_b_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FINAL_FSM
    PORT(
         CLOCK : IN  std_logic;
         RESET : IN  std_logic;
         IN0 : IN  std_logic;
         IN1 : IN  std_logic;
         IN2 : IN  std_logic;
         LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal IN0 : std_logic := '0';
   signal IN1 : std_logic := '0';
   signal IN2 : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FINAL_FSM PORT MAP (
          CLOCK => CLOCK,
          RESET => RESET,
          IN0 => IN0,
          IN1 => IN1,
          IN2 => IN2,
          LED => LED
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      RESET<='1';
		IN0<='0';
		IN1<='0';
		IN2<='0';
      wait for 100 ns;
		
      RESET<='0';
		IN0<='0';
		IN1<='0';
		IN2<='1';
      wait for 100 ns;

      RESET<='0';
		IN0<='1';
		IN1<='0';
		IN2<='0';
      wait for 100 ns;
      
      RESET<='0';
		IN0<='0';
		IN1<='0';
		IN2<='1';
      wait for 100 ns;

      RESET<='0';
		IN0<='1';
		IN1<='0';
		IN2<='0';
      wait for 100 ns;
      
      RESET<='0';
		IN0<='0';
		IN1<='0';
		IN2<='1';
      wait for 100 ns;
      
      RESET<='0';
		IN0<='0';
		IN1<='1';
		IN2<='0';
      wait for 100 ns;
		
		RESET<='0';
		IN0<='0';
		IN1<='0';
		IN2<='1';
      wait for 100 ns;

      RESET<='0';
		IN0<='0';
		IN1<='1';
		IN2<='0';
      wait for 100 ns;
      
      RESET<='0';
		IN0<='0';
		IN1<='0';
		IN2<='1';
      wait for 100 ns; 

      wait for CLOCK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
