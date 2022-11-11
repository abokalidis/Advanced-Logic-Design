----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:31 03/11/2017 
-- Design Name: 
-- Module Name:    CLA_4bit_ADDER - Behavioral 
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

entity CLA_4bit_ADDER is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C3 : out  STD_LOGIC);
end CLA_4bit_ADDER;

architecture Behavioral of CLA_4bit_ADDER is

component CPG
Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component CLA
Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
           G : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (2 downto 0);
           Cout : out  STD_LOGIC);
end component;

component SUM
Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (2 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal G_signal:std_logic_vector(3 downto 0);
signal P_signal:std_logic_vector(3 downto 0);
signal C_signal:std_logic_vector(2 downto 0);

begin
CPG_unit: CPG
port map( A=>A,
          B=>B,
			 P=>P_signal,
			 G=>G_signal);

CLA_unit: CLA
port map( P=>P_signal,
          G=>G_signal,
			 Cin=>Cin,
			 C=>C_signal,
			 Cout=>C3);
			 
SUM_unit: SUM
port map( P=>P_signal,
          C=>C_signal,
			 Cin=>Cin,
			 S=>S);

end Behavioral;

