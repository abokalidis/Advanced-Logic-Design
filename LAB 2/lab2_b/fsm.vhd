----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:12:14 03/13/2017 
-- Design Name: 
-- Module Name:    fsm - Behavioral 
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

entity fsm is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           IN0 : in  STD_LOGIC;
           IN1 : in  STD_LOGIC;
           IN2 : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end fsm;

architecture Behavioral of fsm is

TYPE State IS (A,B,C);
Signal fsm_state : State;

begin
 
state_change : process
begin

wait until CLK' event and CLK='1';

if RST='1' then fsm_state <= A;
else
case fsm_state is 
    when A => if (IN0='1') then fsm_state <= B;
              elsif (IN1='1') then fsm_state <= C; 
		        elsif (IN2='1') then fsm_state <= A;
				  end if;
	 when B => if (IN0='1') then fsm_state <= C;
              elsif (IN1='1') then fsm_state <= A; 
		        elsif (IN2='1') then fsm_state <= B;
				  end if;
	 when C => if (IN0='1') then fsm_state <= A;
              elsif (IN1='1') then fsm_state <= B; 
		        elsif (IN2='1') then fsm_state <= C;
				  end if;
end case;
end if;
end process state_change;

state_output : process (fsm_state)
begin
     case fsm_state is
	  when A => LED <= "11111111";
	  when B => LED <= "11000011";
	  when C => LED <= "00111100";
end case;
end process state_output;

end Behavioral;

