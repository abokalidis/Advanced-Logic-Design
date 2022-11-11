----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:30:50 03/30/2017 
-- Design Name: 
-- Module Name:    ssdEncoder - Behavioral 
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

entity ssdEncoder is
    Port ( Code : in  STD_LOGIC_VECTOR (3 downto 0);
           Sel : out  STD_LOGIC_VECTOR (1 downto 0)
			 );
end ssdEncoder;

architecture Behavioral of ssdEncoder is

begin
process(Code)
begin
 
		
		if(Code="1110") then Sel<="00";
		elsif(Code="1101") then Sel<="01";
      elsif(Code="1011") then Sel<="10";
      elsif(Code="0111") then Sel<="11";
		else Sel<="11";
      end if;
end process;

end Behavioral;

