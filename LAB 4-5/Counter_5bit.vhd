----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:52:10 03/26/2017 
-- Design Name: 
-- Module Name:    Counter_5bit - Behavioral 
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

entity Counter_5bit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           UpDown : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (4 downto 0));
end Counter_5bit;

architecture Structural of Counter_5bit is

signal s: std_logic_vector(4 downto 0);
signal a: std_logic_vector(4 downto 0);
signal b: std_logic_vector(4 downto 0);
signal W: std_logic_vector(4 downto 0);
signal k: std_logic_vector(4 downto 0);
signal v: std_logic; 

Component MUX_4x2 is
Port ( IN0 : in  STD_LOGIC;
	    IN1 : in  STD_LOGIC;
		 IN2 : in  STD_LOGIC;
	    IN3 : in  STD_LOGIC;
       C : in  STD_LOGIC_VECTOR(1 downto 0);
       Output : out  STD_LOGIC	
      );
end Component;

Component D_FF is
Port ( CLK : in  STD_LOGIC;
	    RST : in  STD_LOGIC;
		 D : in  STD_LOGIC;
       Q : out  STD_LOGIC
      );
end Component;

begin

process 

begin

if RST='1' then
	W<="00000";
end if;

wait until(CLK' EVENT AND CLK = '1');  

end process;

v<='0';
Output<=b;
k<=NOT b;
s(0)<= ((NOT UpDown) AND EN) OR (EN AND UpDown);
s(1)<= ((NOT UpDown) AND EN AND (NOT b(0)) ) OR (UpDown AND EN AND b(0) );
s(2)<= ((NOT UpDown) AND EN AND (NOT b(1)) AND (NOT b(0)) ) OR (UpDown AND EN AND b(0) AND b(1));
s(3)<= ((NOT UpDown) AND EN AND (NOT b(0)) AND (NOT b(1)) AND (NOT b(2)) ) OR (UpDown AND EN AND b(0) AND b(1) AND b(2));
s(4)<= ((NOT UpDown) AND EN AND (NOT b(0)) AND (NOT b(1)) AND (NOT b(2)) AND (NOT b(3)) ) OR (UpDown AND EN AND b(0) AND b(1) AND b(2) AND b(3));

D0:   D_FF 
		port map ( CLK=>CLK,
					  RST=>RST,
					  D=>a(0),
					  Q=>b(0)
					);
					
D1:   D_FF

		port map ( CLK=>CLK,
					  RST=>RST,
					  D=>a(1),
					  Q=>b(1)
					);
					
D2:   D_FF
		port map ( CLK=>CLK, 
					  RST=>RST,
					  D=>a(2),
					  Q=>b(2)
					);
					
D3:   D_FF
		port map ( CLK=>CLK,
					  RST=>RST,
					  D=>a(3),
					  Q=>b(3)
					);
					
D4:   D_FF
		port map ( CLK=>CLK,
					  RST=>RST,
					  D=>a(4),
					  Q=>b(4)
					);
					
MUX0: MUX_4x2
		port map ( IN0=>b(0),
					  IN1=>k(0),
					  IN2=>W(0),
					  IN3=>W(0),
					  C(1)=>v,
					  C(0)=>s(0),
					  Output=>a(0)
					 );
					 
MUX1: MUX_4x2
		port map ( IN0=>b(1),
					  IN1=>k(1),
					  IN2=>W(1),
					  IN3=>W(1),
					  C(1)=>v,
					  C(0)=>s(1),
					  Output=>a(1)
					 );
					 
MUX2: MUX_4x2
		port map ( IN0=>b(2),
					  IN1=>k(2),
					  IN2=>W(2),
					  IN3=>W(2),
					  C(1)=>v,
					  C(0)=>s(2),
					  Output=>a(2)
					 );	
					 
MUX3: MUX_4x2
		port map ( IN0=>b(3),
					  IN1=>k(3),
					  IN2=>W(3),
					  IN3=>W(3),
					  C(1)=>v,
					  C(0)=>s(3),
					  Output=>a(3)
					 );	

MUX4: MUX_4x2
		port map ( IN0=>b(4),
					  IN1=>k(4),
					  IN2=>W(4),
					  IN3=>W(4),
					  C(1)=>v,
					  C(0)=>s(4),
					  Output=>a(4)
					 );					 

end Structural;

