--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:58:26 04/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_DataPath.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataPath
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
 
ENTITY test_DataPath IS
END test_DataPath;
 
ARCHITECTURE behavior OF test_DataPath IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataPath
    PORT(
         Empty : IN  std_logic;
         Full : IN  std_logic;
         Ovf : IN  std_logic;
         Mode_status : IN  std_logic_vector(1 downto 0);
         Action : IN  std_logic_vector(1 downto 0);
         CodeSel : IN  std_logic_vector(3 downto 0);
         Ledss : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Empty : std_logic := '0';
   signal Full : std_logic := '0';
   signal Ovf : std_logic := '0';
   signal Mode_status : std_logic_vector(1 downto 0) := (others => '0');
   signal Action : std_logic_vector(1 downto 0) := (others => '0');
   signal CodeSel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Ledss : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataPath PORT MAP (
          Empty => Empty,
          Full => Full,
          Ovf => Ovf,
          Mode_status => Mode_status,
          Action => Action,
          CodeSel => CodeSel,
          Ledss => Ledss
        );

   -- Clock process definitions
   --<clock>_process :process
  -- begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Empty<='0';
      Full<='0'; 
      Ovf<='0';
      CodeSel<="1110"; 
      wait for 100 ns;
      Empty<='1';
      Full<='0'; 
      Ovf<='0';
      CodeSel<="1110"; 
      wait for 100 ns;
      Empty<='0';
      Full<='1'; 
      Ovf<='0';
      CodeSel<="1110"; 
      wait for 100 ns;
      Empty<='0';
      Full<='0'; 
      Ovf<='1';
      CodeSel<="1011"; 
      wait for 100 ns;
		Mode_status<="01";
		Action<="00";
		Empty<='0';
      Full<='0'; 
      Ovf<='0';
      --CodeSel<="1110"; 
      wait for 100 ns;
		Mode_status<="10";
		Action<="11";
		Empty<='0';
      Full<='0'; 
      Ovf<='0';
      --CodeSel<="1110"; 
      wait for 100 ns;

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
