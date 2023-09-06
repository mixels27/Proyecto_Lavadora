library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity suma_tiempo is
	--<------- nbits
	port(
		A,B,C: in std_logic_vector(4 downto 0);
		D:     in std_logic_vector(2 downto 0);
		E:     in std_logic_vector(3 downto 0);
		F:     in std_logic_vector(2 downto 0);
		G:     in std_logic_vector(3 downto 0);
		H:     in std_logic_vector(4 downto 0);
		I:     in std_logic_vector(2 downto 0);
		S: out std_logic_vector(7 downto 0));
end suma_tiempo;

--Architecture
architecture solve of suma_tiempo is
	-- Signals,Constants,Variables,Components
	begin
		S<=("000"&A)+("000"&B)+("000"&C)+("00000"&D)+("0000"&E)+("00000"&F)+("0000"&G)+("000"&H)+("00000"&I);--with sign bit
end solve;