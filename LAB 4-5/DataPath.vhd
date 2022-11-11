----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:28 03/30/2017 
-- Design Name: 
-- Module Name:    DataPath - Behavioral 
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

entity DataPath is
    Port ( Empty : in  STD_LOGIC;
           Full : in  STD_LOGIC;
           Ovf : in  STD_LOGIC;
			  Mode_status : in  STD_LOGIC_VECTOR (1 downto 0);
			  Action: in  STD_LOGIC_VECTOR (1 downto 0);
           CodeSel : in  STD_LOGIC_VECTOR (3 downto 0);
           Ledss : out  STD_LOGIC_VECTOR (7 downto 0));
end DataPath;

architecture Behavioral of DataPath is

Component ssdEncoder is
    Port ( Code : in  STD_LOGIC_VECTOR (3 downto 0);
           Sel : out  STD_LOGIC_VECTOR (1 downto 0)
			 );
end component;

Component ssdDecoder is
    Port ( Code : in  STD_LOGIC_VECTOR (2 downto 0);
	        Mode : in  STD_LOGIC_VECTOR (1 downto 0);
			  Act : in  STD_LOGIC_VECTOR (1 downto 0);
           Sel : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

Component ssD32x8MUX is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
			  S : in STD_LOGIC_VECTOR (1 downto 0);
           SegLed : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal x : STD_LOGIC_VECTOR (1 downto 0);
signal y : STD_LOGIC_VECTOR (31 downto 0);
begin

encoder : ssdEncoder
          Port map(Code=>CodeSel,
			          Sel=>x);

decoder : ssdDecoder
          Port map(Code(0)=>Empty,
			          Code(1)=>Full,
						 Code(2)=>Ovf,
						 Mode=> Mode_status,
						 Act=> Action,
						 Sel=>y);
					
mux : ssD32x8MUX
          Port map(A=>y,
			          S=>x,
						 SegLed=>Ledss);

end Behavioral;

