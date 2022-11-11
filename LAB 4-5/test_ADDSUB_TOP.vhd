--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:07:12 05/16/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_ADDSUB_TOP.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADD_SUB_TOP
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
 
ENTITY test_ADDSUB_TOP IS
END test_ADDSUB_TOP;
 
ARCHITECTURE behavior OF test_ADDSUB_TOP IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD_SUB_TOP
    PORT(
         Prax : IN  std_logic_vector(1 downto 0);
         NUM1 : IN  std_logic_vector(7 downto 0);
         NUM2 : IN  std_logic_vector(7 downto 0);
         Carry : OUT  std_logic;
         Outcome1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Prax : std_logic_vector(1 downto 0) := (others => '0');
   signal NUM1 : std_logic_vector(7 downto 0) := (others => '0');
   signal NUM2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Carry : std_logic;
   signal Outcome1 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD_SUB_TOP PORT MAP (
          Prax => Prax,
          NUM1 => NUM1,
          NUM2 => NUM2,
          Carry => Carry,
          Outcome1 => Outcome1
        );

   -- Clock process definitions
   --<clock>_process :process
   ---begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Prax<="00";
		NUM1<="00001010";
		NUM2<="00001001";
      wait for 50 ns;
      Prax<="01";
		NUM1<="00001010";
		NUM2<="00001001";
      wait for 50 ns;
      Prax<="00";
		NUM1<="00001110";
		NUM2<="00000101";
      wait for 50 ns;
      Prax<="01";
		NUM1<="10001010";
		NUM2<="10011001";
      wait for 50 ns;		

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
