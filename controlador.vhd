library ieee;
use ieee.std_logic_1164.all;
entity controlador is
	port(start,reset,clock,izq,der,jugar,mejoresp,s5,s180,suma_puntos,vida_menos,mayor: in std_logic;
			num_nivel: in std_logic_vector(3 downto 0);
			pos_jugador: in std_logic_vector(2 downto 0);
			reset_address, enable_address, pos_inicial, enable_pos, enable_der, enable_izq: out std_logic;
			enable_puntos, reset_puntos, reset_cnt_s5, reset_cnt_180_seg, resetivel, enable_nivel, enable_mejor_puntuacion,enable_guardar_puntuacion, reset_cnt_mejoresp: out std_logic;
			estados: out std_logic_vector (5 downto 0);
			sel_displays, resetaf: out std_logic);
end controlador;

architecture mss of controlador is
	type estado is (Ta, Tb, T1, T2, Tc, Te, Tee, Tf, Tff, Tg, Tgg, Th, Ti, Tj, Tkk, Tl, Tll, Tm, Tmm, Tn, Tnn, Tp, Tpp, Tr, Trr, Ts, Tss, Tt, Ttt, Tu, Tuu, Tv, Tvv, Tw, Tww, Tx,
	Txx, Ty, Tyy, Tz);
	signal y: estado;
begin
	process(clock, reset, vida_menos)
	begin
		if reset = '0' then y <= Ta;
		elsif (clock'event and clock = '1') then
			case y is
				when Ta => if start = '0' then y <= Tb; else y <= Ta; end if;
				when Tb => if start = '1' then y <= Tc; else y <= Tb; end if;
				when Tc => if jugar = '0' and mejoresp = '0' then y <= Tc;
				           elsif jugar = '0' and mejoresp = '1' then y <= T2;
							  elsif jugar = '1' and mejoresp = '0' then y <= T1;
							  else y <= Tc; end if;
				when T1 => if jugar = '0' then y <= Te; else y <= T1; end if;
				when T2 => if mejoresp = '0' then y <= Tkk; else y <= T2; end if;
				when Te => y <= Tee;
				when Tee => if mayor = '1' then y <= Tx;
								else y <= Tff; end if;
				when Tf => if vida_menos = '1' then y <= Tx;
							  elsif izq = '0' and der = '0' then y <= Ty;
							  elsif izq = '0' and der = '1' then y <= Txx;
							  elsif izq = '1' and der = '0' then y <= Tyy;
							  else y <= Ty; end if;
				when Tff => y <= Tf;
				when Tg => if vida_menos = '1' then y <= Tx;
							  elsif vida_menos = '0' and s180 = '0' and suma_puntos = '0' then y <= Tf;
							  elsif vida_menos = '0' and s180 = '0' and suma_puntos = '1' then y <= Tf;
							  elsif vida_menos = '0' and s180 = '1' and suma_puntos = '0' then y <= Ti;
							  elsif vida_menos = '0' and s180 = '1' and suma_puntos = '1' then y <= Ti;
							  else y <= Tx; end if;
				when Tgg => y <= Tf;
				when Th => if vida_menos = '1' then y <= Tx;
							  elsif vida_menos = '0' and s180 = '0' and suma_puntos = '0' then y <= Tf;
							  elsif vida_menos = '0' and s180 = '0' and suma_puntos = '1' then y <= Tf;
							  elsif vida_menos = '0' and s180 = '1' and suma_puntos = '0' then y <= Ti;
							  elsif vida_menos = '0' and s180 = '1' and suma_puntos = '1' then y <= Ti;
							  else y <= Tx; end if;
				when Ti => if vida_menos = '1' then y <= Tx;
							  else y <= Tz; end if;
				when Tj => y <= Tf;
				when Tkk => y <= Tl;
				when Tl => if s5 = '1' then y <= Tll; else y <= Tl; end if;
				when Tll => y <= Tm;
				when Tm => if s5 = '1' then y <= Tmm; else y <= Tm; end if;
				when Tmm => y <= Tn; 
			   when Tn => if s5 = '1' then y <= Tnn; else y <= Tn; end if;
				when Tnn=> y <= Tp;
				when Tp => if s5 = '1' then y <= Tpp; else y <= Tp; end if;
				when Tpp => y <= Tr;
				when Tr => if s5 = '1' then y <= Trr; else y <= Tr; end if;
				when Trr => y <= Ts;
				when Ts => if s5 = '1' then y <= Tss; else y <= Ts; end if;
				when Tss => y <= Tt;
				when Tt => if s5 = '1' then y <= Ttt; else y <= Tt; end if;
				when Ttt => y <= Tu;
				when Tu => if s5 = '1' then y <= Tuu; else y <= Tu; end if;
				when Tuu => y <= Tv;
				when Tv => if s5 = '1' then y <= Tvv; else y <= Tv; end if;
				when Tvv => y <= Tw;
				when Tw => if s5 = '1' then y <= Tww; else y <= Tw; end if;
				when Tww => y <= Ta;
				when Tx =>  y <= Ta;
				when Ty => if vida_menos = '1' then y <= Tx;
							  elsif vida_menos = '0' and s180 = '0' and suma_puntos = '0' then y <= Tf;
							  elsif vida_menos = '0' and s180 = '0' and suma_puntos = '1' then y <= Tf;
							  elsif vida_menos = '0' and s180 = '1' and suma_puntos = '0' then y <= Ti;
							  elsif vida_menos = '0' and s180 = '1' and suma_puntos = '1' then y <= Ti;
							  else y <= Tx; end if;
				when Txx => if vida_menos = '1' then y <= Tx;
								elsif pos_jugador /= "111" then y <= Tg;
								else y <= Tf; end if;
				when Tyy => if vida_menos = '1' then y <= Tx;
								elsif pos_jugador /= "000" then y <= Th;
								else y <= Tf; end if;
				when Tz =>  if mayor = '1' then y <= Tx;
								else y <= Tgg; end if;
			end case;
		end if;
	end process;
	process(y, pos_jugador,suma_puntos, s180, num_nivel)
	begin
		reset_address <= '0'; reset_puntos <= '0'; pos_inicial <= '0'; reset_cnt_180_seg <= '0'; resetivel <= '0'; enable_address <= '0'; enable_pos <= '0'; enable_der <= '0'; 
		enable_izq <= '0'; enable_nivel <= '0'; enable_puntos <= '0'; reset_cnt_s5 <= '0'; enable_mejor_puntuacion <= '0'; enable_guardar_puntuacion <= '0'; reset_cnt_mejoresp <= '0';
		sel_displays <= '0'; resetaf <= '0'; estados <= "000000";
		case y is
			when Ta => estados <= "000001"; reset_address <= '1'; resetivel <= '1'; reset_puntos <= '1'; reset_cnt_s5 <= '1';
			when Tb => estados <= "000000";
			when Tc => estados <= "000010";
			when T1 => estados <= "000000";
			when T2 => estados <= "000000";
			when Te => estados <= "000100"; 
						  reset_address <= '1';
						  reset_puntos <= '1';
						  pos_inicial <= '1';
						  reset_cnt_180_seg <= '1';
						  resetivel <= '1';
			when Tee => estados <= "000000"; 
			when Tf => estados <= "000101"; enable_address <= '1';
			when Tff => enable_nivel <= '1'; resetaf <= '1'; reset_address <= '1';
		   when Tg => estados <= "000110"; enable_pos <= '1'; enable_der <= '1'; 
                    if suma_puntos = '1' then enable_puntos <= '1'; end if;
			when Tgg => enable_nivel <= '1'; resetaf <= '1'; reset_address <= '1'; reset_cnt_180_seg <= '1';
			when Th => estados <= "000111"; enable_pos <= '1'; enable_izq <= '1';
						  if suma_puntos = '1' then enable_puntos <= '1'; end if;
			when Ti => estados <= "001000";
			when Tj => estados <= "001001"; enable_puntos <= '1'; enable_address <= '1';
			when Tkk => estados <= "001011"; reset_cnt_mejoresp <= '1';
			when Tl => estados <= "001100"; sel_displays <= '1';
			when Tll => estados <= "001101"; reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tm => estados <= "001110"; sel_displays <= '1';
			when Tmm => estados <= "001111"; reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
		   when Tn => estados <= "010000"; sel_displays <= '1';
			when Tnn=> estados <= "010001";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tp => estados <= "010010"; sel_displays <= '1';
			when Tpp => estados <= "010011";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tr => estados <= "010100"; sel_displays <= '1';
			when Trr => estados <= "010101";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Ts => estados<= "010110"; sel_displays <= '1';
			when Tss => estados <= "010111";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tt => estados <= "011000"; sel_displays <= '1';
			when Ttt => estados <= "011001";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tu => estados <= "011010"; sel_displays <= '1';
			when Tuu => estados <= "011011";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tv => estados <= "011100"; sel_displays <= '1';
			when Tvv => estados <= "011101";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tw => estados <= "011110"; sel_displays <= '1';
			when Tww => estados <= "011111";  reset_cnt_s5 <= '1'; enable_mejor_puntuacion <= '1'; sel_displays <= '1';
			when Tx => estados <= "100000"; enable_guardar_puntuacion <= '1';
			when Txx => estados <= "000000"; enable_address <= '1';
			when Ty => estados <= "100001"; enable_address <= '1';
						  if suma_puntos = '1' then enable_puntos <= '1'; end if;
			when Tyy => estados <= "000000"; enable_address <= '1';
			when Tz => estados <= "000000";
		end case;
	end process;
end mss;