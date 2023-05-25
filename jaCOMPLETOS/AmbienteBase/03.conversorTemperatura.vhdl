library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ConversorTemperatura is

	port (tempIn					: in std_logic_vector(8 downto 0);
			tDec, tGuni, tGdez	: out std_logic_vector(3 downto 0));

end ConversorTemperatura;

architecture compConversorTemperatura of ConversorTemperatura is
signal s_temp : integer;
begin
	
	s_temp <= to_integer(unsigned(tempIn));
	
	tDec  <= std_logic_vector(to_unsigned((s_temp rem 10), 4));
	tGuni <= std_logic_vector(to_unsigned(((s_temp / 10) rem 10), 4));
	tGDez <= std_logic_vector(to_unsigned((s_temp / 100), 4));
	
end compConversorTemperatura;
