library ieee;
use ieee.std_logic_1164.all;

entity comp2ent4bits is
	port ( A,B: in std_logic_vector(3 downto 0);
		 C,D,E: out std_logic);
end comp2ent4bits;

architecture behavoir of comp2ent4bits is
begin
	C <= '1' when (A>B) else '0';
	D <= '1' when (A=B) else '0';
	E <= '1' when (A<B) else '0';
end behavoir;