--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:48:13 05/06/2017
-- Design Name:   
-- Module Name:   C:/Users/Tasos/Documents/Proxwrhmenh Sxediash/LAB_4_PROX/test_ssd_fsm.vhd
-- Project Name:  LAB_4_PROX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SSD_TotalFSM
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
 
ENTITY test_ssd_fsm IS
END test_ssd_fsm;
 
ARCHITECTURE behavior OF test_ssd_fsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SSD_TotalFSM
    PORT(
         ControlFsm : IN  std_logic;
         Clk : IN  std_logic;
         Code : OUT  std_logic_vector(3 downto 0);
         AN : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ControlFsm : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Code : std_logic_vector(3 downto 0);
   signal AN : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SSD_TotalFSM PORT MAP (
          ControlFsm => ControlFsm,
          Clk => Clk,
          Code => Code,
          AN => AN
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		ControlFsm<='0';
      wait for 50 ns;
      ControlFsm<='1';
      wait for 50 ns;
      ControlFsm<='0';
      wait for 50 ns;
      ControlFsm<='1';
      wait for 50 ns;
      ControlFsm<='1';
      wait for 50 ns;
      ControlFsm<='0';
      wait for 50 ns;
      ControlFsm<='1';
      wait for 50 ns;
      ControlFsm<='0';
      wait for 50 ns;		

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
