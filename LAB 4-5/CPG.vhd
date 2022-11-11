----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:10 03/11/2017 
-- Design Name: 
-- Module Name:    CPG - Behavioral 
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

entity CPG is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0));
end CPG;

architecture Behavioral of CPG is

begin

P(0) <= A(0) XOR B(0);
P(1) <= A(1) XOR B(1);
P(2) <= A(2) XOR B(2);
P(3) <= A(3) XOR B(3);

G(0) <= A(0) AND B(0);
G(1) <= A(1) AND B(1);
G(2) <= A(2) AND B(2);
G(3) <= A(3) AND B(3);

end Behavioral;

