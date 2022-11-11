----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:32:05 03/13/2017 
-- Design Name: 
-- Module Name:    FINAL_FSM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FINAL_FSM is
    Port ( CLOCK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end FINAL_FSM;

architecture Behavioral of FINAL_FSM is

component singlepulsegen is
    Port ( clk 		: in std_logic;		
           rst 		: in std_logic;				
           input 	: in std_logic;
           output 	: out std_logic		
          );
end component; 

component fsm is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal signal_1 : std_logic;
signal signal_2 : std_logic;
signal signal_3 : std_logic;

begin

singlepulsegen_1_instance: singlepulsegen
port map(clk => CLOCK,
         rst => RESET,
			input => IN0,
			output => signal_1);

singlepulsegen_2_instance: singlepulsegen
port map(clk => CLOCK,
         rst => RESET,
			input => IN1,
			output => signal_2);
			
singlepulsegen_3_instance: singlepulsegen
port map(clk => CLOCK,
         rst => RESET,
			input => IN2,
			output => signal_3);
			
fsm_instance : fsm
port map(RST => RESET,
         CLK => CLOCK,
			IN0 => signal_1,
			IN1 => signal_2,
			IN2 => signal_3,
			LED => LED);


end Behavioral;

