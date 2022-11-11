----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:27 04/26/2017 
-- Design Name: 
-- Module Name:    TOP_LEVEL - Behavioral 
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

entity TOP_LEVEL is
    Port ( BTN_0 : in  STD_LOGIC;
           BTN_1 : in  STD_LOGIC;
           BTN_2 : in  STD_LOGIC;
           BTN_3 : in  STD_LOGIC;
           CLOCK : in  STD_LOGIC;
           NUM_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           NUM_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           SSD_LED : out  STD_LOGIC_VECTOR (7 downto 0);
           AN_LED : out  STD_LOGIC_VECTOR (3 downto 0));
end TOP_LEVEL;

architecture Structural of TOP_LEVEL is

signal updownsignal, CounterRstsignal: std_logic;
signal en1, en2, ctrl_signal, ovf_sign, cc: std_logic;
signal wesignal: std_logic_vector(0 downto 0);
signal spg1, spg2, spg3 : std_logic;
signal regen1, regen2, regen3 : std_logic;
signal sp1, sp2: std_logic_vector(4 downto 0);
signal emptysignal, fullsignal, ovfsignal : std_logic;
signal modesignal,actsignal : std_logic_vector(1 downto 0);
signal data_out_reg1,data_out_reg2,data_out_reg3,data_in,data_out,dt3,data_reg1 : std_logic_vector(7 downto 0);

Component singlepulsegen is
Port (clk : in STD_LOGIC;		
      rst : in STD_LOGIC;					
      input : in STD_LOGIC;		
      output: out STD_LOGIC
      );
end component;

Component Registry is     
Port ( D : in  STD_LOGIC_VECTOR (7 downto 0); 
		 Enable : in  STD_LOGIC;           
		 Clk : in  STD_LOGIC;            
		 Q : out  STD_LOGIC_VECTOR (7 downto 0)); 
end component;

Component Comparator is
Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
       B : in  STD_LOGIC_VECTOR (4 downto 0);
       C : out  STD_LOGIC
		 );
end component;

Component Counter_5bit is
Port ( CLK : in  STD_LOGIC;
       RST : in  STD_LOGIC;
       EN : in  STD_LOGIC;
       UpDown : in  STD_LOGIC;
       Output : out  STD_LOGIC_VECTOR (4 downto 0)
		 );
end component;

Component my_mem is
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clkb : IN STD_LOGIC;
	 rstb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
 end component;

Component MULTI_2x1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           X : out  STD_LOGIC);
end component;

Component Multi_data is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

Component SSD_FINAL is
    Port ( reset : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           E : in  STD_LOGIC;
           F : in  STD_LOGIC;
           OVF : in  STD_LOGIC;
			  Mode : in STD_LOGIC_VECTOR(1 downto 0);
			  Act : in STD_LOGIC_VECTOR(1 downto 0);
           LEDSSD : out  STD_LOGIC_VECTOR (7 downto 0);
           LEDAN : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

Component FSM_1 is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           Full_Stack : in  STD_LOGIC;
			  ovf : in STD_LOGIC;
           Empty_Stack : in  STD_LOGIC;
			  Mode : in STD_LOGIC_VECTOR(1 downto 0);
			  CounterEnable : out  STD_LOGIC;
           UpDown : out  STD_LOGIC;
			  Output : out  STD_LOGIC_VECTOR(1 downto 0); 
			  CounterRst : out  STD_LOGIC;
           We : out  STD_LOGIC_VECTOR(0 downto 0);
           Ovf_Stack : out  STD_LOGIC;
			  Ctrl : out  STD_LOGIC;
			  reg1 : out std_logic;
		     reg2 : out std_logic;
		     reg3 : out std_logic);
end component;

Component FSM_2 is
    Port ( BTN2 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           MODE : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

Component OVF_CLA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           OVF_out : out  STD_LOGIC);
end component;

Component ADD_SUB_TOP is
    Port ( Prax : in  STD_LOGIC_VECTOR (1 downto 0);
           NUM1 : in  STD_LOGIC_VECTOR (7 downto 0);
           NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Carry : out  STD_LOGIC;
           Outcome1 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

Component MUX_Usub is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

begin 
Mux_1 : MUX_Usub
            Port map(A=>"00000000",
				         B=>data_out,
							Sel=>actsignal,
							O=>data_reg1
							);
A_S_top : ADD_SUB_TOP
            Port map(Prax=>actsignal,
				         NUM1=>data_out_reg1,
							NUM2=>data_out_reg2,
							Carry=>cc,
							Outcome1=>dt3
							);
ovf_mode : OVF_CLA 
            Port map( A=>data_out_reg1(7),
                      B=>data_out_reg2(7),
                      S=>data_out_reg3(7),
                      OVF_out=>ovf_sign
			            );

spg_1 : singlepulsegen
                  Port map(clk=>CLOCK,		
                           rst=>BTN_3,					
                           input=>BTN_0,		
                           output=>spg1	
                           );
spg_2 : singlepulsegen
                  Port map(clk=>CLOCK,		
                           rst=>BTN_3,					
                           input=>BTN_1,		
                           output=>spg2	
                           );
spg_3 : singlepulsegen
                  Port map(clk=>CLOCK,		
                           rst=>BTN_3,					
                           input=>BTN_2,		
                           output=>spg3	
                           );
reg_1 : Registry      
                Port map( D=>data_reg1, 
		                    Enable=>regen1,            
		                    Clk=>CLOCK,            
		                    Q=>data_out_reg1
								  );
reg_2 : Registry      
                Port map( D=>data_out, 
		                    Enable=>regen2,            
		                    Clk=>CLOCK,            
		                    Q=>data_out_reg2
								  );
reg_3 : Registry      
                Port map( D=>dt3, 
		                    Enable=>regen3,            
		                    Clk=>CLOCK,            
		                    Q=>data_out_reg3
								  );
full_comparator : Comparator
                  Port map ( A=>sp1,
						           B=>"11111",
									  C=>fullsignal
									 );
empty_comparator : Comparator
                   Port map ( A=>sp1,
						            B=>"00000",
									   C=>emptysignal
									 );
Counter_1 : Counter_5bit
            Port map( CLK=>CLOCK,
                      RST=>CounterRstsignal,
                      EN=>en1,
                      UpDown=>updownsignal,
                      Output=>sp1
                    );
Counter_2 : Counter_5bit
            Port map( CLK=>CLOCK,
                      RST=>CounterRstsignal,
                      EN=>en2,
                      UpDown=>updownsignal,
                      Output=>sp2
                    );	
memory : my_mem
            Port map (clka=>CLOCK,
                      wea=>wesignal,
                      addra=>sp1,
                      dina=>data_in,
                      clkb=>CLOCK,
                      addrb=>sp2,
                      doutb=>data_out,
							 rstb=>CounterRstsignal
                      );
multiplexer1 : MULTI_2x1
              Port map( A=>en1,
                        B=>'0',
                        Sel=>emptysignal,
                        X=>en2
							  );
mult_data : Multi_data 
            Port map( A=>NUM_IN,
         			    B=>data_out_reg3,
                      C=>ctrl_signal,
                      Y=>data_in
						   );
FMS1 : FSM_1
        Port map ( CLK=>CLOCK,
                   Reset=>BTN_3,
                   BTN0=>spg1,
                   BTN1=>spg2,
                   Full_Stack=>fullsignal,
                   Empty_Stack=>emptysignal,
			          Mode=>modesignal,
			          CounterEnable=>en1,
                   UpDown=>updownsignal,
			          Output=>actsignal, 
			          CounterRst=>CounterRstsignal,
                   We=>wesignal,
                   Ovf_Stack=>ovfsignal,
						 ovf=>ovf_sign,
						 reg1=>regen1,
						 reg2=>regen2,
						 reg3=>regen3,
						 Ctrl=>ctrl_signal
						 );
FSM2 : FSM_2
       Port map( BTN2=>spg3,
                 CLK=>CLOCK,
                 MODE=>modesignal );	

ssd : SSD_FINAL
      Port map(reset=>BTN_3,
               en=>'1',
               clock=>CLOCK,
               E=>emptysignal,
               F=>fullsignal,
               OVF=>ovfsignal,
					Mode=>modesignal,
					Act=>actsignal,
               LEDSSD=>SSD_LED,
               LEDAN=>AN_LED
					);	

NUM_OUT<=data_out;					
end Structural;

