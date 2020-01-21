LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador32 IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 treintados : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (4 downto 0));
END contador32;

ARCHITECTURE behavoir OF contador32 IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='1' then Q<="00000";treintados<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="11111") then Q<="00000";treintados<='1';
				else Q<=Q+1;treintados<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END behavoir;