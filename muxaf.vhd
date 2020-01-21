library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxaf is
port (
		i0 : in std_logic_vector(7 downto 0);
      i1 : in std_logic_vector(7 downto 0);
		i2 : in std_logic_vector(7 downto 0);
		i3 : in std_logic_vector(7 downto 0);
		i4 : in std_logic_vector(7 downto 0);
      i5 : in std_logic_vector(7 downto 0);
		i6 : in std_logic_vector(7 downto 0);
		i7 : in std_logic_vector(7 downto 0);
     sel : in std_logic_vector(2 downto 0);
     patron : out std_logic_vector(7 downto 0));
end muxaf;

architecture behavior of muxaf is
begin
	with sel select
		patron <=  i0 when "000",
					  i1 when "001",
				     i2 when "010",
				     i3 when "011",
					  i4 when "100",
					  i5 when "101",
				     i6 when "110",
				     i7 when "111";

end behavior;