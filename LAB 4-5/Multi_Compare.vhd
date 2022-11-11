----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:11:19 04/28/2017 
-- Design Name: 
-- Module Name:    Multi_Compare - Behavioral 
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

entity Multi_Compare is
    Port ( X_in : in  STD_LOGIC_VECTOR (4 downto 0);
           Y_in : in  STD_LOGIC_VECTOR (4 downto 0);
           C_in : in  STD_LOGIC_VECTOR (1 downto 0);
           A_out : out  STD_LOGIC_VECTOR (4 downto 0));
end Multi_Compare;

architecture Behavioral of Multi_Compare is

begin

A_out <= X_in when (C_in(0)='1' and C_in(1)='0') else Y_in;

end Behavioral;

