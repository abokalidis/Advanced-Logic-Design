----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:51:02 03/29/2017 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssdCounter is
    Port ( Load : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Control : out  STD_LOGIC;
           Outr : out  STD_LOGIC_VECTOR (16 downto 0);
           CLK : in  STD_LOGIC);
end ssdCounter;

architecture Behavioral of ssdCounter is

signal y :STD_LOGIC_VECTOR (16 downto 0);

Component ssdComparator is
    Port ( A : in  STD_LOGIC_VECTOR (16 downto 0);
           B : in  STD_LOGIC_VECTOR (16 downto 0);
           Y : out  STD_LOGIC);
end component;

Component ssdFSM is
    Port ( CLK : in STD_LOGIC;
			  reset : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR(16 downto 0));
end component;

begin

equalcomparator : ssdComparator
                  Port map( A=>y,
                            B=>"11110100001001000",--"00000000000000001",    --"11110100001001000",
                            Y=>Control									 
                           );									 
countersimple : ssdFSM
                Port map(CLK=>CLK,
								 reset=>Load,
								 En=>En,
								 Output=>y);
Outr<=y; 	
end Behavioral;

