library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity cntupdown is
    PORT (
        clk    : IN  STD_LOGIC;
        areset : IN  STD_LOGIC;
		  enable_cnt: IN STD_LOGIC;
		  modo_up: IN STD_LOGIC;
		  modo_down: IN STD_LOGIC;
        cnt_out: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
end cntupdown;
 
architecture behavoir of cntupdown is
    -- Señal temporal para el contador.
    signal cnt_tmp: STD_LOGIC_VECTOR(2 DOWNTO 0) := "011";
begin
    proceso_contador: process (areset, clk, enable_cnt, modo_up, modo_down) begin
        if areset = '1' then
            cnt_tmp <= "011";
        elsif rising_edge(clk) and enable_cnt = '1' and modo_up = '1' then
            cnt_tmp <= cnt_tmp + 1;
		  elsif rising_edge(clk) and enable_cnt = '1' and modo_down = '1' then
            cnt_tmp <= cnt_tmp - 1;
        end if;
    end process;
 
    cnt_out <= cnt_tmp;
end behavoir;