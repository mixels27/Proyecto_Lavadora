library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Mux16a1 is
	generic ( n: integer:=4);--<-- nbits
	port(
		A : in std_logic_vector(n-1 downto 0);
		B : in std_logic_vector(n-1 downto 0);
		C : in std_logic_vector(n-1 downto 0);
		D : in std_logic_vector(n-1 downto 0);
		E : in std_logic_vector(n-1 downto 0);
		F : in std_logic_vector(n-1 downto 0);
		G : in std_logic_vector(n-1 downto 0);
		H : in std_logic_vector(n-1 downto 0);
		I : in std_logic_vector(n-1 downto 0);
		J : in std_logic_vector(n-1 downto 0);
		K : in std_logic_vector(n-1 downto 0);
		L : in std_logic_vector(n-1 downto 0);
		M : in std_logic_vector(n-1 downto 0);
		z : in std_logic_vector(n-1 downto 0);
		O : in std_logic_vector(n-1 downto 0);
		P : in std_logic_vector(n-1 downto 0);
		sel : in std_logic_vector(3 downto 0);
		en: in std_logic;
		Q : out std_logic_vector(n-1 downto 0));
end Mux16a1;

--Architecture
architecture solve of Mux16a1 is
	-- Signals,Constants,Variables,Components
	signal X: std_logic_vector(n-1 downto 0);
	begin
		with sel select 
		X<= A when "0000",
			 B when "0001",
			 C when "0010",
			 D when "0011",
			 E when "0100",
			 F when "0101",
			 G when "0110",
			 H when "0111",
			 I when "1000",
			 J when "1001",
			 K when "1010",
			 L when "1011",
			 M when "1100",
			 z when "1101",
			 O when "1110",
			 P when others;
		Q<= X when en='1' else (others=>'0');	 
end solve;