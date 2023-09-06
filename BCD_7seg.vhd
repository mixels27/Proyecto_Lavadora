library ieee;
use ieee.std_logic_1164.all;

entity BCD_7seg is
port(BCD: in std_logic_vector(3 downto 0);
		anodo7: out std_logic_vector(6 downto 0));
end BCD_7seg;

architecture arq of BCD_7seg is
begin
process(BCD)
begin
	case BCD is
		
		
		when "0000" => anodo7<="0000001";
		when "0001" => anodo7<="1001111";
		when "0010" => anodo7<="0010010";
		when "0011" => anodo7<="0000110";
		when "0100" => anodo7<="1001100";
		when "0101" => anodo7<="0100100";
		when "0110" => anodo7<="1100000";
		when "0111" => anodo7<="0001111";
		when "1000" => anodo7<="0000000";
		when "1001" => anodo7<="0001100";
		when others => anodo7<="1111111";
		
		
	end case;
end process;
end arq;