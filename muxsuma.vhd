library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxsuma is
port (
		 a: in std_logic_vector(10 DOWNTO 0);
       b: in std_logic_vector(10 DOWNTO 0);
		 c: in std_logic_vector(10 DOWNTO 0);
		 d: in std_logic_vector(10 DOWNTO 0);
		 e: in std_logic_vector(10 DOWNTO 0);
       f: in std_logic_vector(10 DOWNTO 0);
		 g: in std_logic_vector(10 DOWNTO 0);
		 h: in std_logic_vector(10 DOWNTO 0);
		 i: in std_logic_vector(10 DOWNTO 0);
       j: in std_logic_vector(10 DOWNTO 0);
		 k: in std_logic_vector(10 DOWNTO 0);
		 l: in std_logic_vector(10 DOWNTO 0);
		 m: in std_logic_vector(10 DOWNTO 0);
       n: in std_logic_vector(10 DOWNTO 0);
		 o: in std_logic_vector(10 DOWNTO 0);
		 p: in std_logic_vector(10 DOWNTO 0);
      sel : in std_logic_vector(3 downto 0);
      sumaout : out std_logic_vector(10 downto 0));
end muxsuma;

architecture behavior of muxsuma is
begin
	with sel select
		sumaout <= a when "0000",
					  b when "0001",
				     c when "0010",
				     d when "0011",
					  e when "0100",
					  f when "0101",
				     g when "0110",
				     h when "0111",
					  i when "1000",
					  j when "1001",
				     k when "1010",
				     l when "1011",
					  m when "1100",
					  n when "1101",
				     o when "1110",
				     p when "1111";
end behavior;