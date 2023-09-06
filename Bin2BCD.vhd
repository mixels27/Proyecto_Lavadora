library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Bin2BCD is
    port(prueba: in std_logic_vector(7 downto 0);
			F1: out std_logic_vector(3 downto 0);
			F2: out std_logic_vector(3 downto 0));
end Bin2BCD;

architecture solution of Bin2BCD is 

signal F:std_logic_vector(7 downto 0);

begin 
	 F<= prueba + 0 when prueba<10 else
	     prueba + 6 when  ((9<prueba) and (prueba<20)) else
		  prueba + 12 when ((19<prueba) and (prueba<30)) else
		  prueba + 18 when ((29<prueba) and (prueba<40)) else
		  prueba + 24 when ((39<prueba) and (prueba<50)) else
		  prueba + 30 when ((49<prueba) and (prueba<60)) else
		  prueba + 36 when ((59<prueba) and (prueba<70)) else
		  prueba + 42 when ((69<prueba) and (prueba<80)) else
		  prueba + 48;
	 F1<= F(3 downto 0);
	 F2<= F(7 downto 4);

end solution;