----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:58:53 03/30/2017 
-- Design Name: 
-- Module Name:    SSD_TotalFSM - Behavioral 
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

entity SSD_TotalFSM is
    Port ( ControlFsm : in  STD_LOGIC;
	        Clk : in STD_LOGIC;
           Code : out  STD_LOGIC_VECTOR (3 downto 0);
           AN : out  STD_LOGIC_VECTOR (3 downto 0));
end SSD_TotalFSM;

architecture Behavioral of SSD_TotalFSM is

type state_type is (stateA,stateB,stateC,stateD);
signal state_next, state: state_type;

begin

fsm_change : process(state,state_next)
begin	
		case state is
		
		when stateA => Code<="0111";
		               AN<="0111";
		               state_next<=stateB;
							
		when stateB => Code<="1011";
		               AN<="1011";
		               state_next<=stateC;
		
		when stateC => Code<="1101";
		               AN<="1101";
		               state_next<=stateD;
							
		when stateD => Code<="1110";
		               AN<="1110";
		               state_next<=stateA;
		
		when others => Code<="1110";
		               AN<="1110";
		               state_next<=stateA;
end case;
end process fsm_change;

fsm_true : process(ControlFsm,state_next,Clk)
begin
   if(rising_edge(Clk)) then
      if (ControlFsm='1') then state <= state_next;
	   else state <= state;
	   end if;
	else state <= state;	
   end if;
end process fsm_true;

end Behavioral;

