library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxselecfrcntnivel is
port (
		i0 : in std_logic;
      i1 : in std_logic;
     sel : in std_logic;
     frecout : out std_logic);
end muxselecfrcntnivel;

architecture behavior of muxselecfrcntnivel is
begin
	with sel select
		frecout <= i0 when '0',
					  i1 when others;
end behavior;