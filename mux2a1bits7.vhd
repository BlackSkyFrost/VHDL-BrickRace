library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2a1bits7 is
port (
      i1 : in std_logic_vector(6 downto 0);
		i2 : in std_logic_vector(6 downto 0);
     sel : in std_logic;
     arrayout : out std_logic_vector(6 downto 0));
end mux2a1bits7;

architecture behavior of mux2a1bits7 is
begin
	with sel select
		arrayout <= i1 when '0',
						i2 when others;
end behavior;