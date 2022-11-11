----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:33:56 03/30/2017 
-- Design Name: 
-- Module Name:    Final_SSD_Counter - Behavioral 
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

entity Final_SSD_Counter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           ANLed : out  STD_LOGIC_VECTOR (3 downto 0);
           CodeSSD : out  STD_LOGIC_VECTOR (3 downto 0));
end Final_SSD_Counter;

architecture Behavioral of Final_SSD_Counter is

Component ssdCounter is
    Port ( Load : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Control : out  STD_LOGIC;
           Outr : out  STD_LOGIC_VECTOR (16 downto 0);
           CLK : in  STD_LOGIC);
end component;

Component SSD_TotalFSM is
    Port ( ControlFsm : in  STD_LOGIC;
	        Clk : in STD_LOGIC;
           Code : out  STD_LOGIC_VECTOR (3 downto 0);
           AN : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal x : STD_LOGIC;
signal y : STD_LOGIC_VECTOR (16 downto 0);

begin

counter1 : ssdCounter
           Port map(Load=>RST,
			           En=>EN,
						  CLK=>CLK,
						  Control=>x,
						  Outr=>y);
fsm : SSD_TotalFSM 
           Port map(ControlFsm=>x,
			           Clk=>CLK,
                    Code=>CodeSSD,
                    AN=>ANLed);					  

end Behavioral;

