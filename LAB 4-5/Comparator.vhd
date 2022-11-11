----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:55 03/26/2017 
-- Design Name: 
-- Module Name:    Comparator - Behavioral 
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

entity Comparator is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           C : out  STD_LOGIC);
end Comparator;

architecture Structural of Comparator is

Component AND_gate is
Port ( A : in  STD_LOGIC;    
       B : in  STD_LOGIC;   
	    C : in  STD_LOGIC;    
	    D : in  STD_LOGIC;  
		 E : in  STD_LOGIC;
       F : out STD_LOGIC    
	   );
end Component;

Component XNOR_gate is
Port( A : in std_logic;
		B : in std_logic;
		C : out std_logic
	  );
end Component;

signal s: std_logic_vector(4 downto 0);

begin

XNOR_1: XNOR_gate
		 port map( A=>A(0),
					  B=>B(0),
					  C=>s(0)
		 );
XNOR_2: XNOR_gate
		 port map( A=>A(1),
					  B=>B(1),
					  C=>s(1)
		 );
		 
XNOR_3: XNOR_gate
		 port map( A=>A(2),
					  B=>B(2),
					  C=>s(2)
		 );
		 
XNOR_4: XNOR_gate
		 port map( A=>A(3),
					  B=>B(3),
					  C=>s(3)
		 );

XNOR_5: XNOR_gate
		 port map( A=>A(4),
					  B=>B(4),
					  C=>s(4)
		 );
		 
AND_EQUAL: AND_gate
			  port map( A=>s(0),
							B=>s(1),
							C=>s(2),
							D=>s(3),
							E=>s(4),
							F=>C
				);

end Structural;

