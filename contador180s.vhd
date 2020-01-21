LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador180s IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 s180 : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (7 downto 0));
END contador180s;

ARCHITECTURE behavoir OF contador180s IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='1' then Q<="00000000";s180<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="10110100") then Q<="00000000";s180<='1';
				else Q<=Q+1;s180<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END behavoir;
