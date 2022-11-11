----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:37:07 03/29/2017 
-- Design Name: 
-- Module Name:    ssdComparator - Behavioral 
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

entity ssdComparator is
    Port ( A : in  STD_LOGIC_VECTOR (16 downto 0);
           B : in  STD_LOGIC_VECTOR (16 downto 0);
           Y : out  STD_LOGIC);
end ssdComparator;

architecture Behavioral of ssdComparator is

begin

Y<='1' when (A=B) else '0';

end Behavioral;

