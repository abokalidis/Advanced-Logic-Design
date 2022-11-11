--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:12:24 04/26/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_decoder_ssd.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ssdDecoder
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
 
ENTITY test_decoder_ssd IS
END test_decoder_ssd;
 
ARCHITECTURE behavior OF test_decoder_ssd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ssdDecoder
    PORT(
         Code : IN  std_logic_vector(2 downto 0);
         Mode : IN  std_logic_vector(1 downto 0);
         Act : IN  std_logic_vector(1 downto 0);
         Sel : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Code : std_logic_vector(2 downto 0) := (others => '0');
   signal Mode : std_logic_vector(1 downto 0) := (others => '0');
   signal Act : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Sel : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ssdDecoder PORT MAP (
          Code => Code,
          Mode => Mode,
          Act => Act,
          Sel => Sel
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
		Code(0) <= '0';
		Code(1) <= '0';
		Code(2) <= '0';
      Mode <= "00";
      wait for 50 ns;
      Code(0) <= '1';
		Code(1) <= '0';
		Code(2) <= '0';
      Mode <= "00";
      wait for 50 ns;
      Code(0) <= '0';
		Code(1) <= '1';
		Code(2) <= '0';
      Mode <= "00";
      wait for 50 ns;
      Code(0) <= '0';
		Code(1) <= '0';
		Code(2) <= '1';
      Mode <= "00";
      wait for 50 ns;
      Code(0) <= '0';
		Code(1) <= '0';
		Code(2) <= '0';
      Mode <= "01";
		Act <= "00";
      wait for 50 ns;
		Code(0) <= '0';
		Code(1) <= '0';
		Code(2) <= '0';
      Mode <= "01";
      Act <= "01";
      wait for 50 ns;
		Code(0) <= '0';
		Code(1) <= '0';
		Code(2) <= '0';
      Mode <= "10";
      Act <= "10";
      wait for 50 ns;	
		Code(0) <= '0';
		Code(1) <= '0';
		Code(2) <= '0';
      Mode <= "10";
      Act <= "10";
      wait for 50 ns;
      Code(0) <= '0';
		Code(1) <= '0';
		Code(2) <= '0';
      Mode <= "10";
      Act <= "11";
      wait for 50 ns;		

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
