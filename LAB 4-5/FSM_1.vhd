----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:07 03/27/2017 
-- Design Name: 
-- Module Name:    FSM_1 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_1 is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           Full_Stack : in  STD_LOGIC;
           Empty_Stack : in  STD_LOGIC;
			  ovf : in  STD_LOGIC;
			  Mode : in STD_LOGIC_VECTOR(1 downto 0);
			  CounterEnable : out  STD_LOGIC;
           UpDown : out  STD_LOGIC;
			  Output : out  STD_LOGIC_VECTOR(1 downto 0); --praksi
			  CounterRst : out  STD_LOGIC;
           We : out  STD_LOGIC_VECTOR(0 downto 0);
           Ovf_Stack : out  STD_LOGIC;
			  Ctrl : out  STD_LOGIC;
			  reg1 : out std_logic;
		     reg2 : out std_logic;
		     reg3 : out std_logic);
end FSM_1;

architecture Behavioral of FSM_1 is

type state_type is (state_0,state_Push,state_Push1,state_Pop,state_Ovf,state_Add,state_Sub,state_USub,state_Change,
                    state_Add_1,state_Add_2,state_Add_3,state_Add_4,state_Add_5,state_Add_6,state_Usub1,state_Usub2,state_Usub3,
						  state_Change1,state_Change2,state_Change3,state_Change4,state_Change5,state_Change6,state_Change7,state_Sub_1,
						  state_Sub_2,state_Sub_3,state_Sub_4,state_Sub_5,state_Sub_6);
signal state_next, state: state_type;

begin

fsm_comb: process(state, state_next, BTN0, BTN1, Empty_Stack, Full_Stack, Mode,ovf)
begin 
	case state is
				
		when state_0=> We<="0";
		               CounterEnable<='0';
							UpDown<='0';
							Ctrl<='0';
							reg1<='0';
							reg2<='0';
							reg3<='0';
							Ovf_Stack<='0';
							Output<="XX";
							If(BTN0='1' AND Full_Stack='0' AND Mode="00") then state_next<=state_Push;
							elsif(BTN1 ='1' AND Empty_Stack='0' AND Mode="00") then state_next<=state_Pop;
							elsif(BTN0='1' AND Full_Stack='1' AND Mode="00") then state_next<=state_Ovf;
							elsif(BTN0='1' AND Mode="01") then state_next<=state_Add;
							elsif(BTN1='1' AND Mode="01") then state_next<=state_Sub;
							elsif(BTN0='1' AND Mode="10") then state_next<=state_USub;
							elsif(BTN1='1' AND Mode="10") then state_next<=state_Change;
							else state_next<=state_0;
							end if;
							
		
		when state_Push1=> state_next<=state_0;
		                  CounterEnable<='1';
								UpDown<='1';
								Ctrl<='0';
							   reg1<='0';
							   reg2<='0';
							   reg3<='0';
								Ovf_Stack<='0';
								We<="0";
								Ctrl<='0';
								Output<="XX";
		
		when state_Push=> state_next<=state_Push1;
		                  CounterEnable<='0';
								UpDown<='1';
								Ctrl<='0';
							   reg1<='0';
							   reg2<='0';
							   reg3<='0';
								We<="1";
								Ctrl<='0';
								Ovf_Stack<='0';
								Output<="XX";
		
		when state_Pop=> state_next<=state_0;
		                 CounterEnable<='1';
							  UpDown<='0';
							  Ctrl<='0';
							  reg1<='0';
							  reg2<='0';
							  reg3<='0';
							  We<="0";
							  Ovf_Stack<='0';
							  Output<="XX";
		
		when state_Ovf=> Ovf_Stack<='1';
		                 We<="0";
		                 CounterEnable<='0';
							  UpDown<='0';
							  Ctrl<='0';
							  reg1<='0';
							  reg2<='0';
							  reg3<='0';
		                 state_next<=state_Ovf;
							  Output<="XX";
							  
		when state_Add=> We<="0";
		                 Ctrl<='0';
		                 CounterEnable<='0';
							  UpDown<='0';
							  reg2<='0';
							  reg3<='0';
							  reg1<='1';
							  Ovf_Stack<='0';
							  Output <= "00";
							  state_next<=state_Add_1;
		
		when state_Add_1=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='1';
							    UpDown<='0';
								 reg1<='0';
							    Ovf_Stack<='0';
							    reg2<='0';
							    reg3<='0';
							    Output <= "00";
							    state_next<=state_Add_2;
		
		when state_Add_2=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg2<='0';
							    Ovf_Stack<='0';
							    Output <= "00";
							    reg1<='0';
							    reg3<='0';
							    state_next<=state_Add_3;
		
		when state_Add_3=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg2<='1';
								 reg3<='0';
							    Ovf_Stack<='0';
							    Output <= "00";
								 reg1<='0';
							    state_next<=state_Add_4;
		
		when state_Add_4=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg2<='0';
								 reg3<='1';
							    Ovf_Stack<='0';
							    Output <= "00";
								 reg1<='0';
							    state_next<=state_Add_5;
								 
		when state_Add_5=> if(ovf='1') then 
		                   We<="0";
		                   CounterEnable<='0';
							    UpDown<='0';
							    Ctrl<='0';
							    reg1<='0';
							    reg2<='0';
							    reg3<='0';
							    Ovf_Stack<='0';
								 Output <= "XX";
		                   state_next<=state_0;
		                   else 
								 We<="1";
								 Ctrl<='1';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg1<='0';
								 reg2<='0';
								 reg3<='1';
							    Ovf_Stack<='0';
							    Output <= "00";
							    state_next<=state_Add_6;
								 end if;
		
		when state_Add_6=> We<="0";
								 Ctrl<='0';
		                   CounterEnable<='1';
							    UpDown<='1';
								 reg1<='0';
								 reg2<='0';
								 reg3<='0';
							    Ovf_Stack<='0';
							    Output <= "00";
								 state_next<=state_0;
		
		when state_Sub=> We<="0";
		                 CounterEnable<='0';
							  UpDown<='0';
							  Ctrl<='0';
							  reg1<='1'; 
							  Ovf_Stack<='0';
							  Output <= "01";
							  reg2<='0';
							  reg3<='0';
							  state_next<=state_Sub_1;
							  
		when state_Sub_1=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='1';
							    UpDown<='0';
								 reg1<='0';
							    Ovf_Stack<='0';
							    reg2<='0';
							    reg3<='0';
							    Output <= "01";
							    state_next<=state_Sub_2;
		
		when state_Sub_2=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg2<='0';
							    Ovf_Stack<='0';
							    Output <= "01";
							    reg1<='0';
							    reg3<='0';
							    state_next<=state_Sub_3;
		
		when state_Sub_3=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg2<='1';
								 reg3<='0';
							    Ovf_Stack<='0';
							    Output <= "01";
								 reg1<='0';
							    state_next<=state_Sub_4;
		
		when state_Sub_4=> We<="0";
		                   Ctrl<='0';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg2<='0';
								 reg3<='1';
							    Ovf_Stack<='0';
							    Output <= "01";
								 reg1<='0';
							    state_next<=state_Sub_5;
								 
		when state_Sub_5=> if(ovf='1') then 
		                   We<="0";
		                   CounterEnable<='0';
							    UpDown<='0';
							    Ctrl<='0';
							    reg1<='0';
							    reg2<='0';
							    reg3<='0';
							    Ovf_Stack<='0';
								 Output <= "XX";
		                   state_next<=state_0;
		                   else 
								 We<="1";
								 Ctrl<='1';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg1<='0';
								 reg2<='0';
								 reg3<='1';
							    Ovf_Stack<='0';
							    Output <= "01";
							    state_next<=state_Sub_6;
								 end if;
		
		when state_Sub_6=> We<="0";
								 Ctrl<='0';
		                   CounterEnable<='1';
							    UpDown<='1';
								 reg1<='0';
								 reg2<='0';
								 reg3<='0';
							    Ovf_Stack<='0';
							    Output <= "01";
								 state_next<=state_0;
		
		

		
		when state_Usub=> We<="0";
		                  CounterEnable<='0';
							   UpDown<='0';
								Ctrl<='0';
								reg1<='1';
							   reg2<='1';
							   Ovf_Stack<='0';
								Output <= "10";
								reg3<='0';
							   state_next<=state_Usub1;
		
		when state_Usub1=> We<="0";
		                   CounterEnable<='0';
							    UpDown<='0';
								 Ctrl<='0';
								 reg1<='1';
							    reg2<='1';
								 reg3<='1';
							    Ovf_Stack<='0';
								 Output <= "10";
							    state_next<=state_Usub2;
		
		when state_Usub2=> We<="1";
								 Ctrl<='1';
		                   CounterEnable<='0';
							    UpDown<='0';
								 reg1<='0';
								 reg2<='0';
								 reg3<='0';
							    Ovf_Stack<='0';
							    Output <= "10";
							    state_next<=state_Usub3;
		
		when state_Usub3=> We<="0";
								 Ctrl<='0';
		                   CounterEnable<='1';
							    UpDown<='1';
								 reg1<='0';
								 reg2<='0';
								 reg3<='0';
							    Ovf_Stack<='0';
							    Output <= "10";
								 state_next<=state_0;
								
		when state_Change=> We<="0";
		                    CounterEnable<='0';
							     UpDown<='0';
								  reg1<='1';
								  reg2<='1';
							     Ovf_Stack<='0';
								  Output <= "11";
								  reg3<='1';
								  Ctrl<='0';
							     state_next<=state_Change1;
		
		when state_Change1=>We<="0";
		                    CounterEnable<='1';
							     UpDown<='0';
								  reg1<='0';
								  reg2<='0';
								  reg3<='0';
							     Ovf_Stack<='0';
								  Output <= "11";
								  Ctrl<='0';
							     state_next<=state_Change2;
		
		when state_Change2=>We<="0";
		                    CounterEnable<='0';
							     UpDown<='0';
								  reg1<='0';
								  reg2<='0';
								  reg3<='1';
							     Ovf_Stack<='0';
								  Output <= "11";
								  Ctrl<='0';
							     state_next<=state_Change3;
		
		when state_Change3=>We<="0";
		                    Ctrl<='0';
		                    CounterEnable<='0';
							     UpDown<='0';
								  reg1<='0';
								  reg2<='1';
								  reg3<='0';
							     Ovf_Stack<='0';
								  Output <= "11";
							     state_next<=state_Change4;
		
		when state_Change4=>We<="1";
		                    Ctrl<='1';
		                    CounterEnable<='0';
							     UpDown<='0';
								  reg1<='0';
								  reg2<='0';
								  reg3<='1';
							     Ovf_Stack<='0';
								  Output <= "11";
							     state_next<=state_Change5;
		
		when state_Change5=>We<="0";
		                    Ctrl<='0';
		                    CounterEnable<='1';
							     UpDown<='1';
								  reg1<='0';
								  reg2<='0';
								  reg3<='0';
							     Ovf_Stack<='0';
								  Output <= "11";
							     state_next<=state_Change6;
		
		when state_Change6=>We<="1";
		                    Ctrl<='1';
		                    CounterEnable<='0';
							     UpDown<='0';
								  reg1<='0';
								  reg2<='0';
								  reg3<='1';
							     Ovf_Stack<='0';
								  Output <= "11";
							     state_next<=state_Change7;
								  
		when state_Change7=>We<="0";
		                    Ctrl<='0';
		                    CounterEnable<='1';
							     UpDown<='1';
								  reg1<='0';
								  reg2<='0';
								  reg3<='0';
							     Ovf_Stack<='0';
								  Output <= "11";
							     state_next<=state_0;
								  
		when others=> state_next<=state_0;
		              Ovf_Stack<='0';
		              We<="0";
		              CounterEnable<='0';
						  UpDown<='0';
						  Ctrl<='0';
						  reg1<='0';
						  reg2<='0';
						  reg3<='0';
						  Output<="XX";

end case;
end process fsm_comb;

fsm_synch: process(Reset, CLK) 
begin
   if (Reset='1') then state <= state_0;
                  CounterRst<='1';	
   elsif (rising_edge(CLK)) then state <= state_next;
	                              CounterRst<='0';
   end if;
end process fsm_synch;


end Behavioral;

