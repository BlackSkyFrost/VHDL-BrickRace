Library ieee;
Use ieee.std_logic_1164.all;

Entity not8bits is
	Port (A : in std_logic_vector (7 downto 0);
			Q : out std_logic_vector (7 downto 0));
End not8bits;

Architecture behavoir of not8bits is
Begin	
	Q<=NOT(A);	
End behavoir;
