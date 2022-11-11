----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:30 02/27/2017 
-- Design Name: 
-- Module Name:    half_adder - Behavioral 
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

entity half_adder is
    Port ( IN0 : in  STD_LOGIC; --A
           IN1 : in  STD_LOGIC; --B
           LED0 : out  STD_LOGIC; --SUM
           LED1 : out  STD_LOGIC); --CARRY
end half_adder;

architecture Behavioral of half_adder is

begin

LED0 <= IN0 XOR IN1;
LED1 <= IN0 AND IN1;

end Behavioral;

