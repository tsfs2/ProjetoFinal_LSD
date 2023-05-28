library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Hora is

	generic (contMax: integer :=23);
	port (enable 		: in std_logic;
			clk    		: in std_logic;
			stop, enL	: in std_logic;
			up,down		: in std_logic;
			horaOut		: out std_logic_vector (4 downto 0));
end Hora;

architecture compHora of Hora is
signal s_cont : integer range 0 to 23;
begin

	process (clk)
	begin
		
		if (rising_edge(clk)) then
			if (stop = '1') then
				if (enL = '1') then
					if (up = '1') then
						s_cont <= s_cont +1;
					elsif (down = '1') then
						s_cont <= s_cont -1;
--					else
--						s_cont <= s_cont;
					end if;	
				else
					s_cont <= s_cont;
				end if;
			elsif (enable = '1') then
				if (s_cont = contMax) then
					s_cont <= 0;
				else
					s_cont <= s_cont + 1;
				end if;
			end if;
		end if;	
		
	end process;
	
	horaOut <= std_logic_vector(to_unsigned((s_cont),5));
	
end compHora;	
