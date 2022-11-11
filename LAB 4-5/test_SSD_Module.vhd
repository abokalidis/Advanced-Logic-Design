--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:06:37 04/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_SSD_Module.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SSD_FINAL
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
 
ENTITY test_SSD_Module IS
END test_SSD_Module;
 
ARCHITECTURE behavior OF test_SSD_Module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SSD_FINAL
    PORT(
         reset : IN  std_logic;
         en : IN  std_logic;
         clock : IN  std_logic;
         E : IN  std_logic;
         F : IN  std_logic;
         OVF : IN  std_logic;
         Mode : IN  std_logic_vector(1 downto 0);
         Act : IN  std_logic_vector(1 downto 0);
         LEDSSD : OUT  std_logic_vector(7 downto 0);
         LEDAN : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal en : std_logic := '0';
   signal clock : std_logic := '0';
   signal E : std_logic := '0';
   signal F : std_logic := '0';
   signal OVF : std_logic := '0';
   signal Mode : std_logic_vector(1 downto 0) := (others => '0');
   signal Act : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal LEDSSD : std_logic_vector(7 downto 0);
   signal LEDAN : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SSD_FINAL PORT MAP (
          reset => reset,
          en => en,
          clock => clock,
          E => E,
          F => F,
          OVF => OVF,
          Mode => Mode,
          Act => Act,
          LEDSSD => LEDSSD,
          LEDAN => LEDAN
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      reset<='1';
      en<='0';
      E<='0';
      F<='0';
      OVF<='0';
      Mode<="00";
      Act<="00";
      wait for 100 ns;
		reset<='0';
      en<='1';
      E<='0';
      F<='0';
      OVF<='0';
      Mode<="01";
      Act<="11";
      wait for 100 ns;
		wait for 100 ns;
		reset<='0';
      en<='1';
      E<='0';
      F<='0';
      OVF<='0';
      Mode<="10";
      Act<="00";
      wait for 100 ns;
		wait for 100 ns;
		reset<='0';
      en<='1';
      E<='0';
      F<='0';
      OVF<='0';
      Mode<="10";
      Act<="10";
      wait for 100 ns;
		reset<='0';
      en<='1';
      E<='0';
      F<='0';
      OVF<='0';
      Mode<="10";
      Act<="11";
      wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
