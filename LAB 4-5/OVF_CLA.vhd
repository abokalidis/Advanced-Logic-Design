----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:06 05/16/2017 
-- Design Name: 
-- Module Name:    OVF_CLA - Behavioral 
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

entity OVF_CLA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           OVF_out : out  STD_LOGIC);
end OVF_CLA;

architecture Behavioral of OVF_CLA is

begin
process(A,B,S)
begin

if(A='0' and B='0' and S='1') then OVF_out<='1';
elsif(A='1' and B='1' and S='0') then OVF_out<='1';
else OVF_out<='0';

end if;
end process;
end Behavioral;

