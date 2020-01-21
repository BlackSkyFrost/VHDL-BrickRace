library ieee;
use ieee.std_logic_1164.all;

entity detectcoli is
	port ( patron_anodo, patron_catodo, pos_carro: in std_logic_vector(7 downto 0);
		    suma_puntos, vida_menos: out std_logic);
end detectcoli;

architecture behavoir of detectcoli is
begin
	vida_menos <= '1' when ((patron_anodo = "00000001") and (pos_carro = patron_catodo)) else '0';
	suma_puntos <= '1' when ((patron_anodo = "00000001") and (pos_carro /= patron_catodo) and 
	(patron_catodo = "10000000" or patron_catodo = "01000000" or patron_catodo = "00100000" or
	patron_catodo = "00010000" or patron_catodo = "00001000" or patron_catodo = "00000100" or
	patron_catodo = "00000010" or patron_catodo = "00000001")) else '0';
end behavoir;