library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Add1 is
	--<------- nbits
	port(
		A,B,C,D,E,F,G,H,I: in std_logic_vector(4 downto 0);
		S: out std_logic_vector(7 downto 0));
end Add1;

--Architecture
architecture solve of Add1 is
	-- Signals,Constants,Variables,Components
	begin
		S<=("000"&A)+("000"&B)+("000"&C)+("000"&D)+("000"&E)+("000"&F)+("000"&G)+("000"&H)+("000"&I);--with sign bit
end solve;