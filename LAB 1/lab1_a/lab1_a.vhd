----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:36:56 02/27/2017 
-- Design Name: 
-- Module Name:    lab1_a - Behavioral 
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

entity lab1_a is
    Port ( IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           LED0 : out  STD_LOGIC;
           LED1 : out  STD_LOGIC;
           LED2 : out  STD_LOGIC;
           LED3 : out  STD_LOGIC;
           LED4 : out  STD_LOGIC;
           LED5 : out  STD_LOGIC;
           LED6 : out  STD_LOGIC;
           LED7 : out  STD_LOGIC);
end lab1_a;

architecture Behavioral of lab1_a is

begin

LED0 <= (IN0 AND IN1) AND BTN0;
LED1 <= (IN0 XOR IN1) AND BTN1;
LED2 <= (IN0 NOR IN1) AND BTN2;
LED3 <= (NOT IN0) AND BTN3;
LED4 <= IN0;
LED5 <= IN1;

end Behavioral;

