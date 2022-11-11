----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:54 02/27/2017 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           LED0 : out  STD_LOGIC;
           LED1 : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

component half_adder is
    Port ( IN0 : in  STD_LOGIC; -- IN0=A
           IN1 : in  STD_LOGIC; -- IN1=B
			  LED0 : out  STD_LOGIC; --LED0=Sum
           LED1 : out  STD_LOGIC); --LED1=Cout
end component ;

signal hsum, hcarry, tcarry: std_logic;

begin

HA1 : half_adder 
         port map ( IN0=>IN0,
			           IN1=>IN1,
						  LED0=>hsum,
                    LED1=>hcarry);
HA2 : half_adder 
         port map ( IN0=>hsum,
			           IN1=>IN2, --Cin
						  LED0=>LED0,
                    LED1=>tcarry);
		
		LED1 <= tcarry or hcarry;

end Behavioral;

