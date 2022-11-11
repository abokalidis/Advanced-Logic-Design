----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:20 03/30/2017 
-- Design Name: 
-- Module Name:    SSD_FINAL - Behavioral 
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

entity SSD_FINAL is
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
end SSD_FINAL;

architecture Structural of SSD_FINAL is

Component DataPath is
    Port ( Empty : in  STD_LOGIC;
           Full : in  STD_LOGIC;
           Ovf : in  STD_LOGIC;
			  Mode_status : in  STD_LOGIC_VECTOR (1 downto 0);
			  Action: in  STD_LOGIC_VECTOR (1 downto 0);
           CodeSel : in  STD_LOGIC_VECTOR (3 downto 0);
           Ledss : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

Component Final_SSD_Counter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           ANLed : out  STD_LOGIC_VECTOR (3 downto 0);
           CodeSSD : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal x : STD_LOGIC_VECTOR (3 downto 0);
begin

data : DataPath
       Port map(Empty=>E,
		          Full=>F,
					 Ovf=>OVF,
					 Mode_status=>Mode,
					 Action=>Act,
					 CodeSel=>x,
					 Ledss=>LEDSSD);

counterf : Final_SSD_Counter
           Port map(CLK=>clock,
			           RST=>reset,
						  EN=>en,
						  ANLed=>LEDAN,
						  CodeSSD=>x);

end Structural;

