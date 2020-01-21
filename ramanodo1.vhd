library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ramanodo1 is
	port(data: in std_logic_vector(7 downto 0);
	add: in std_logic_vector(4 downto 0);
	modo: in std_logic;
	q: out std_logic_vector(7 downto 0));
end ramanodo1;
architecture behavoir of ramanodo1 is
begin
		process(modo,add)
		begin
				if modo = '1' then
					case add is
					   when "00000" => q<="00000000";
						when "00001" => q<="00010000";----cuadro1
						when "00010" => q<="00001000";----cuadro2
						when "00011" => q<="00000100";----cuadro3
						when "00100" => q<="00000010";----cuadro4
						when "00101" => q<="00000001";----cuadro5
						when "00110" => q<="10000000";----cuadro6
						when "00111" => q<="01000000";----cuadro7
						when "01000" => q<="00100000";----cuadro8
						when "01001" => q<="00010000";----cuadro9
						when "01010" => q<="00001000";----cuadro10
						when "01011" => q<="00000100";----cuadro11
						when "01100" => q<="00000010";----cuadro12
						when "01101" => q<="00000001";----cuadro13
						when "01110" => q<="10000000";----cuadro14
						when "01111" => q<="01000000";----cuadro15
						when "10000" => q<="00100000";----cuadro16
						when "10001" => q<="00010000";----cuadro17
						when "10010" => q<="00001000";----cuadro18
						when "10011" => q<="00000100";----cuadro19
						when "10100" => q<="00000010";----cuadro20
						when "10101" => q<="00000001";----cuadro21
						when "10110" => q<="10000000";----cuadro22
						when "10111" => q<="01000000";----cuadro23
						when "11000" => q<="00100000";----cuadro24
						when "11001" => q<="00010000";----cuadro25
						when "11010" => q<="00001000";----cuadro26
						when "11011" => q<="00000100";----cuadro27
						when "11100" => q<="00000010";----cuadro28
						when "11101" => q<="00000001";----cuadro29
						when "11110" => q<="10000000";----cuadro30
						when "11111" => q<="01000000";----cuadro31
					end case;
				else
					q <= "00000000";
				end if;
		end process;
end behavoir;
