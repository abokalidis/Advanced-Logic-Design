library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
   
entity Registry is     
Port ( D : in  STD_LOGIC_VECTOR (7 downto 0); 
		 Enable : in  STD_LOGIC;           
		 Clk : in  STD_LOGIC;            
		 Q : out  STD_LOGIC_VECTOR (7 downto 0)); 
end Registry;  

architecture Behavioral of Registry is 
 
Begin  

Process
  
Begin 
 
Wait until( Clk'EVENT and Clk = '1' );     
If (Enable = '1') then       
Q <= D ;     
End if;   

End process ;
  
End Behavioral; 