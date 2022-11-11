----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:28 03/24/2017 
-- Design Name: 
-- Module Name:    MUX_4x2 - Behavioral 
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

entity MUX_4x2 is
    Port ( IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           IN3 : in  STD_LOGIC;
           C : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC);
end MUX_4x2;

architecture Behavioral of MUX_4x2 is

Component MUX_2x1 is
Port ( A : in  STD_LOGIC;
	    B : in  STD_LOGIC;
		 C : in  STD_LOGIC;
       Outp : out  STD_LOGIC	
      );
end Component;

signal O1: std_logic;
signal O2: std_logic;

begin

MUX0_2x1 : MUX_2x1
           port map(A => IN0, 
                    B => IN1,
                    C => C(0),
                    Outp => O1);
MUX1_2x1 : MUX_2x1
           port map(A => IN2, 
                    B => IN3,
                    C => C(0),
                    Outp => O2);
MUX2_2x1 : MUX_2x1
           port map(A => O1, 
                    B => O2,
                    C => C(1),
                    Outp => Output);

end Behavioral;

