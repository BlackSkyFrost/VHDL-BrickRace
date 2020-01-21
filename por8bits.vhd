LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY por8bits IS
	PORT (x : IN STD_LOGIC_VECTOR(7 downto 0);
			y : IN STD_LOGIC_VECTOR(7 downto 0);
			f : OUT STD_LOGIC_VECTOR(7 downto 0));
END por8bits;

ARCHITECTURE behavoir OF por8bits IS
SIGNAL tmp : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	tmp <= ((x(7) or y(7)) & (x(6) or y(6)) & (x(5) or y(5)) & (x(4) or y(4)) & (x(3) or y(3)) & (x(2) or y(2)) & (x(1) or y(1)) & (x(0) or y(0))); 
	f <= tmp;
END behavoir;
