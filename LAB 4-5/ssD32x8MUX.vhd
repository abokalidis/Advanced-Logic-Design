----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:53:03 03/30/2017 
-- Design Name: 
-- Module Name:    ssD32x8MUX - Behavioral 
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

entity ssD32x8MUX is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
			  S : in STD_LOGIC_VECTOR (1 downto 0);
           SegLed : out  STD_LOGIC_VECTOR (7 downto 0));
end ssD32x8MUX;

architecture Behavioral of ssD32x8MUX is

begin

     SegLed<=A(7 downto 0) when S(0)='0' and S(1)='0' else
             A(15 downto 8) when S(0)='1' and S(1)='0' else
             A(23 downto 16) when S(0)='0' and S(1)='1' else
             A(31 downto 24) when S(0)='1' and S(1)='1' else
				 (others => 'X');

end Behavioral;

