library ieee;
use ieee.std_logic_1164.all;
entity mss4 is
	port(clock,resetn,start,remojar,encender,C_1,C_2,C_3,C_4,C_5,C_6,C_7,C_8,C_9: in std_logic;
	led0,led1,led2,led3,led4,led7,led8: out std_logic;
	enable:out std_logic_vector(8 downto 0));
end mss4;
architecture solution of mss4 is
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Tp,Tq,A,B,C);
signal y:estado;
signal formato_entradas: std_logic_vector(8 downto 0);
signal formato_salidas: std_logic_vector(15 downto 0);
begin
	formato_entradas<=C_1&C_2&C_3&C_4&C_5&C_6&C_7&C_8&C_9;
	
	enable(8)<=formato_salidas(15);enable(7)<=formato_salidas(14);enable(6)<=formato_salidas(13);
	enable(5)<=formato_salidas(12);enable(4)<=formato_salidas(11);enable(3)<=formato_salidas(10);enable(2)<=formato_salidas(9);
	enable(1)<=formato_salidas(8);enable(0)<=formato_salidas(7);led8<=formato_salidas(6);led7<=formato_salidas(5);
	led4<=formato_salidas(4);led3<=formato_salidas(3);led2<=formato_salidas(2);led1<=formato_salidas(1);led0<=formato_salidas(0);
	process(clock,resetn)
	begin 
		if resetn='0' then y<=Ta;
		elsif(clock'event and clock='1')then
				case y is
					when Ta=> if encender = '1' then y<=Tb; else y<=Ta; end if;
					when Tb=> if encender = '0' then y<=Tc; else y<=Tb; end if;
					when Tc=> if remojar = '1' then y<=Td; else y<=A; end if;
					when Td=> if remojar = '0' then y<=Te; else y<=Td; end if;
					when Te=> if start = '1' then y<=Tf; else y<=Te; end if;
					when Tf=> if start = '0' then y<=Tg; else y<=Tf; end if;
					when Tg=> if formato_entradas="100000000" then y<=Th; else y<=Tg; end if;
					when Th=> if formato_entradas="010000000" then y<=Ti; else y<=Th; end if;
					when Ti=> if formato_entradas="001000000" then y<=Tj; else y<=Ti; end if;
					when Tj=> if formato_entradas="000100000" then y<=Tk; else y<=Tj; end if;
				   when Tk=> if formato_entradas="000010000" then y<=Tl; else y<=Tk; end if;
		         when Tl=> if formato_entradas="000001000" then y<=Tm; else y<=Tl; end if;			
					when Tm=> if formato_entradas="000000100" then y<=Tn; else y<=Tm; end if;
					when Tn=> if formato_entradas="000000010" then y<=Tp; else y<=Tn; end if;
					when Tp=> if formato_entradas="000000001" then y<=Tq; else y<=Tp; end if;
					when Tq=>y<=Tc;
					when A=> if start = '1' then y<=B; else y<=A; end if;
					when B=> if start = '0' then y<=C; else y<=B; end if;
					when C=> if formato_entradas="110000000" then y<=Ti; else y<=C; end if;
				end case;
		end if;
	end process;
	process(y)
	begin
	      formato_salidas<="0000000000000000";
		case y is
			when Ta=> formato_salidas<="0000000000000000";
			when Tb=> formato_salidas<="0000000000000000";
			when Tc=> formato_salidas<="0000000000000000";
			when Td=> formato_salidas<="0000000000000000";
			when Te=> formato_salidas<="0000000000000000";
			when Tf=> formato_salidas<="0000000000000000";
			when Tg=> formato_salidas<="0000000010000001";
			when Th=> formato_salidas<="0000000100000010";
			when Ti=> formato_salidas<="0000001000000100";
			when Tj=> formato_salidas<="0000010000001000";
			when Tk=> formato_salidas<="0000100000010000";
			when Tl=> formato_salidas<="0001000000001000";
			when Tm=> formato_salidas<="0010000000010000";
			when Tn=> formato_salidas<="0100000000100000";
			when Tp=> formato_salidas<="1000000000001000";
			when Tq=> formato_salidas<="0000000001000000";
			when A=> formato_salidas<="0000000000000000";
			when B=> formato_salidas<="0000000000000000";
			when C=> formato_salidas<="0000000010000001";
		end case;
	end process;
end solution;