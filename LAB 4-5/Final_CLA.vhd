----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:36 05/15/2017 
-- Design Name: 
-- Module Name:    Final_CLA - Behavioral 
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

entity Final_CLA is
    Port ( A_in : in  STD_LOGIC_VECTOR (7 downto 0);
           B_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  C_in : in  STD_LOGIC;
           Outcome : out  STD_LOGIC_VECTOR (7 downto 0);
           C_out : out  STD_LOGIC);
end Final_CLA;

architecture Behavioral of Final_CLA is

component CLA_4bit_ADDER is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C3 : out  STD_LOGIC);
end component;

signal carrysignal : std_logic;
begin

CLA_1 : CLA_4bit_ADDER
        Port map( A=>A_in(3 downto 0),
		            B=>B_in(3 downto 0),
						Cin=>C_in,
						S=>Outcome(3 downto 0),
						C3=>carrysignal
						);
CLA_2 : CLA_4bit_ADDER
        Port map( A=>A_in(7 downto 4),
		            B=>B_in(7 downto 4),
						Cin=>carrysignal,
						S=>Outcome(7 downto 4),
						C3=>C_out
						);
						
end Behavioral;

