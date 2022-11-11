--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:54 04/26/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_TOP_LEVEL.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TOP_LEVEL
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
 
ENTITY test_TOP_LEVEL IS
END test_TOP_LEVEL;
 
ARCHITECTURE behavior OF test_TOP_LEVEL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TOP_LEVEL
    PORT(
         BTN_0 : IN  std_logic;
         BTN_1 : IN  std_logic;
         BTN_2 : IN  std_logic;
         BTN_3 : IN  std_logic;
         CLOCK : IN  std_logic;
         NUM_IN : IN  std_logic_vector(7 downto 0);
         NUM_OUT : OUT  std_logic_vector(7 downto 0);
         SSD_LED : OUT  std_logic_vector(7 downto 0);
         AN_LED : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BTN_0 : std_logic := '0';
   signal BTN_1 : std_logic := '0';
   signal BTN_2 : std_logic := '0';
   signal BTN_3 : std_logic := '0';
   signal CLOCK : std_logic := '0';
   signal NUM_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal NUM_OUT : std_logic_vector(7 downto 0);
   signal SSD_LED : std_logic_vector(7 downto 0);
   signal AN_LED : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TOP_LEVEL PORT MAP (
          BTN_0 => BTN_0,
          BTN_1 => BTN_1,
          BTN_2 => BTN_2,
          BTN_3 => BTN_3,
          CLOCK => CLOCK,
          NUM_IN => NUM_IN,
          NUM_OUT => NUM_OUT,
          SSD_LED => SSD_LED,
          AN_LED => AN_LED
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
      -- hold reset state for 100 ns.
		BTN_0 <= '0'; 
      BTN_1 <= '0';
      BTN_2 <= '0';
      BTN_3 <= '1';
      wait for 100 ns;
      BTN_0 <= '1'; --PUSH
      BTN_3 <= '0';
      NUM_IN<="00000011";
      wait for 30 ns;
      BTN_0 <= '0'; --PUSH
		BTN_3 <= '0';
      --NUM_IN<="00000100";
      wait for 30 ns;
      BTN_0 <= '1'; --PUSH
		BTN_3 <= '0';
      NUM_IN<="00000101";
      wait for 30 ns;
		BTN_0 <= '0'; --PUSH
		BTN_3 <= '0';
      --NUM_IN<="00000100";
      wait for 30 ns;
      BTN_0 <= '1'; --PUSH
		BTN_3 <= '0';
      NUM_IN<="00000110";
      wait for 30 ns;
		BTN_0 <= '0'; --MODE 1
      BTN_1 <= '0';
      BTN_2 <= '1';
      BTN_3 <= '0';
      wait for 80 ns;
      --BTN_0 <= '1'; --ADD
      --BTN_1 <= '0';
      --BTN_2 <= '0';
      --BTN_3 <= '0';
      --wait for 100 ns;
		--BTN_0 <= '0'; --SUB
      --BTN_1 <= '1';
      --BTN_2 <= '0';
      --BTN_3 <= '0';
      --wait for 100 ns;
      --BTN_0 <= '0'; --MODE 2
      --BTN_1 <= '0';
      --BTN_2 <= '1';
      --BTN_3 <= '0';
      --wait for 70 ns;
		--BTN_0 <= '1'; --USub
      --BTN_1 <= '0';
      --BTN_2 <= '0';
      --BTN_3 <= '0';
      --wait for 100 ns;
      BTN_0 <= '0'; --CHANGE
      BTN_1 <= '1';
      BTN_2 <= '0';
      BTN_3 <= '0';
      wait for 100 ns;
      --BTN_0 <= '0'; --MODE 0
      --BTN_1 <= '0';
      --BTN_2 <= '1';
      --BTN_3 <= '0';
      --wait for 70 ns;
      BTN_0 <= '0'; --RESET
      BTN_1 <= '0';
      BTN_2 <= '0';
      BTN_3 <= '1';
      wait for 100 ns;
      		

      --wait for CLOCK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
