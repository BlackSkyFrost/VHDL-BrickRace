library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxselecfnivel is
port (
		i0 : in std_logic;
      i1 : in std_logic;
		i2 : in std_logic;
		i3 : in std_logic;
		i4 : in std_logic;
      i5 : in std_logic;
		i6 : in std_logic;
		i7 : in std_logic;
		i8 : in std_logic;
      i9 : in std_logic;
		i10 : in std_logic;
		i11 : in std_logic;
		i12 : in std_logic;
      i13 : in std_logic;
		i14 : in std_logic;
		i15 : in std_logic;
     sel : in std_logic_vector(3 downto 0);
     frecout : out std_logic);
end muxselecfnivel;

architecture behavior of muxselecfnivel is
begin
	with sel select
		frecout <= i0 when "0000",
					  i1 when "0001",
				     i2 when "0010",
				     i3 when "0011",
					  i4 when "0100",
					  i5 when "0101",
				     i6 when "0110",
				     i7 when "0111",
					  i8 when "1000",
					  i9 when "1001",
				     i10 when "1010",
				     i11 when "1011",
					  i12 when "1100",
					  i13 when "1101",
				     i14 when "1110",
				     i15 when "1111";
				 
end behavior;