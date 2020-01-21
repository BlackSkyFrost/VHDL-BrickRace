LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador8af IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 ocho : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (2 downto 0));
END contador8af;

ARCHITECTURE behavoir OF contador8af IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='1' then Q<="000";ocho<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="111") then Q<="000";ocho<='1';
				else Q<=Q+1;ocho<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END behavoir;