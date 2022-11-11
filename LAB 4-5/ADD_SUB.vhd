----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:30:29 05/15/2017 
-- Design Name: 
-- Module Name:    ADD_SUB - Behavioral 
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

entity ADD_SUB is
    Port ( Praxis : in  STD_LOGIC_VECTOR (1 downto 0);
           Num : in  STD_LOGIC_VECTOR (7 downto 0);
           F_num : out  STD_LOGIC_VECTOR (7 downto 0);
			  Mode : out STD_LOGIC);
end ADD_SUB;

architecture Behavioral of ADD_SUB is

begin

process(Praxis,Num)
begin

If(Praxis="00") then F_num<=(Num XOR "00000000");
                     Mode<='0';
elsif(Praxis="01") then F_num<=(Num XOR "11111111");
                        Mode<='1';
elsif(Praxis="10") then F_num<=(Num XOR "11111111");
                        Mode<='1';
else F_num<=(Num XOR "00000000");
     Mode<='0';

end if;
end process;
end Behavioral;

