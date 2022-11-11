----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:08 04/25/2017 
-- Design Name: 
-- Module Name:    FSM_2 - Behavioral 
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

entity FSM_2 is
    Port ( BTN2 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           MODE : out  STD_LOGIC_VECTOR (1 downto 0));
end FSM_2;

architecture Behavioral of FSM_2 is

type state_type is (state_0,state_1,state_2); --mode0->2
signal state_next, state: state_type;

begin

fsm_change : process(state,state_next)
begin	
		case state is
		
		when state_0 => MODE<="00";
		                state_next<=state_1;
							
		when state_1 => MODE<="01";
		                state_next<=state_2;
		
		when state_2 => MODE<="10";
		               state_next<=state_0;
		
		when others => MODE<="00";
		               state_next<=state_0;
end case;
end process fsm_change;

fsm_true : process(BTN2,state_next,CLK)
begin
   if(rising_edge(Clk)) then
      if (BTN2='1') then state <= state_next;
	   else state <= state;
	   end if;
	else state <= state;	
   end if;
end process fsm_true;



end Behavioral;

