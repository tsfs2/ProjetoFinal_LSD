library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Latch9 is
	port (clk, en, up, dw 	: in std_logic;
			tempValor   		: out std_logic_vector(8 downto 0));
			
end Latch9;

architecture compLatch9 of latch9 is
signal s_valor : integer range 0 to 511 := 200;
begin

	process (clk)
	begin

		if (rising_edge(clk)) then
			if (en = '1') then
				if (up = '1') then
					s_valor <= s_valor +1;
				elsif (dw = '1')	then
					s_valor <= s_valor -1;
				end if;
			end if;
		end if;
		
	end process;
	
	tempValor <= std_logic_vector(to_unsigned(s_valor, 9));
	
end compLatch9;	
