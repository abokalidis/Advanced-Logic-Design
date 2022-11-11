----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:58 03/29/2017 
-- Design Name: 
-- Module Name:    ssdCounter - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssdFSM is
    Port ( CLK : in STD_LOGIC;
			  reset : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR(16 downto 0));
end ssdFSM;

architecture Behavioral of ssdFsm is      

begin
   process(CLK,reset,En)
	variable temp : STD_LOGIC_VECTOR(16 downto 0);
	begin
	if(reset='1') then temp:="00000000000000000";   --"11110100001001001",
	elsif (temp="11110100001001001") then temp:="00000000000000000";
   elsif(rising_edge(clk)) then 
	   if(En='1') then temp:=temp+1;
      else temp:=temp;
		end if;
	end if;

Output<=temp;
end process;

end Behavioral;

