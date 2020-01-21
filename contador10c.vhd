LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador10c IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 diez : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (3 downto 0));
END contador10c;

ARCHITECTURE behavoir OF contador10c IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='1' then Q<="0000";diez<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="1010") then Q<="0000";diez<='1';
				else Q<=Q+1;diez<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END behavoir;