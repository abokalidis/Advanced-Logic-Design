----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:49 05/16/2017 
-- Design Name: 
-- Module Name:    ADD_SUB_TOP - Behavioral 
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

entity ADD_SUB_TOP is
    Port ( Prax : in  STD_LOGIC_VECTOR (1 downto 0);
           NUM1 : in  STD_LOGIC_VECTOR (7 downto 0);
           NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Carry : out  STD_LOGIC;
           Outcome1 : out  STD_LOGIC_VECTOR (7 downto 0));
end ADD_SUB_TOP;

architecture Behavioral of ADD_SUB_TOP is

component Final_CLA is
    Port ( A_in : in  STD_LOGIC_VECTOR (7 downto 0);
           B_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  C_in : in  STD_LOGIC;
           Outcome : out  STD_LOGIC_VECTOR (7 downto 0);
           C_out : out  STD_LOGIC);
end component;

component ADD_SUB is
    Port ( Praxis : in  STD_LOGIC_VECTOR (1 downto 0);
           Num : in  STD_LOGIC_VECTOR (7 downto 0);
           F_num : out  STD_LOGIC_VECTOR (7 downto 0);
			  Mode : out STD_LOGIC);
end component;

signal data : std_logic_vector(7 downto 0);
signal c : std_logic;
begin

CLA : Final_CLA
       Port map(A_in=>NUM1,
		          B_in=>data,
					 C_in=>c,
					 C_out=>Carry,
					 Outcome=>Outcome1
					 );
A_S : ADD_SUB
       Port map(Praxis=>Prax,
		          Num=>NUM2,
					 F_Num=>data,
					 Mode=>c
					 );
end Behavioral;

