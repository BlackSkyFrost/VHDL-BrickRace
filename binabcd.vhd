library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity binabcd is
Port(ent : in std_logic_vector(10 downto 0);
	  M, C, D, U: out std_logic_vector(3 downto 0));
end binabcd;

Architecture behavoir of binabcd is
begin
process(ent)
        variable z: STD_LOGIC_VECTOR(26 downto 0);
    begin
        -- Inicialización de datos en cero.
        z := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z(13 downto 3) := ent;
        for i in 0 to 7 loop
            -- Unidades (4 bits).
            if z(14 downto 11) > 4 then
                z(14 downto 11) := z(14 downto 11) + 3;
            end if;
            -- Decenas (4 bits).
            if z(18 downto 15) > 4 then
                z(18 downto 15) := z(18 downto 15) + 3;
            end if;
            -- Centenas (3 bits).
            if z(22 downto 19) > 4 then
                z(22 downto 19) := z(22 downto 19) + 3;
            end if;
				if z(26 downto 23) > 4 then
                z(26 downto 23) := z(26 downto 23) + 3;
            end if;
            -- Corrimiento a la izquierda.
            z(26 downto 1) := z(25 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        U <= z(14 downto 11);
		  D <= z(18 downto 15);
		  C <= z(22 downto 19);
		  M <= z(26 downto 23);
    end process;
end behavoir;
