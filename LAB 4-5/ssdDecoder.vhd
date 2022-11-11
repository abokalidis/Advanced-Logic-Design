----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:21:34 03/30/2017 
-- Design Name: 
-- Module Name:    ssdDecoder - Behavioral 
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

entity ssdDecoder is
    Port ( Code : in  STD_LOGIC_VECTOR (2 downto 0);
	        Mode : in  STD_LOGIC_VECTOR (1 downto 0);
			  Act  : in  STD_LOGIC_VECTOR (1 downto 0);
           Sel : out  STD_LOGIC_VECTOR (31 downto 0));
end ssdDecoder;

architecture Behavioral of ssdDecoder is

begin
process(Code,Mode,Act)
begin
		If(Mode="00") then if(Code(0)='1') then Sel<="11111111111111111111111100110000"; --E
		                   elsif(Code(1)='1') then Sel<="11111111111111111111111110111000"; --F 10111000
		                   elsif(Code(2)='1') then Sel<="11111111100000011000001100011101"; --OVF
	                      else Sel<="11111111111111111111111111111111";
		                   end if;
		elsif(Mode="01") then if(Act="00") then Sel<="10001000111111111111111111111111"; --A   10001000           
			                     elsif(Act="01") then Sel<="10100100111111111111111111111111"; --S10100100
		                        else Sel<="11001111111111111111111111111111"; 
		                        end if;
		elsif(Mode="10") then if(Act="10") then Sel<="11000001111111111111111111111111"; --U 11000001
			                   elsif(Mode="10" and Act="11") then Sel<="10110001100001111111111111111111"; --<> 1011000110000111
		                      else Sel<="10010010111111111111111111111111"; 
                            end if;		
      else Sel<="11111111111111111111111111111111";
		end if;		
end process;
end Behavioral;

