library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
  
entity Counter9 is
    port ( clk: 	  in std_logic;
           up_down: in std_logic;
           counter: out std_logic_vector(8 downto 0));
end Counter9;

architecture compCounter9 of Counter9 is
signal s_counter: integer range 0 to 511;
begin

	process(clk)
	begin

		if (rising_edge(clk))then
			if(up_down = '0')then
				s_counter<=s_counter-1;
			else 
				s_counter<=s_counter+1;
			end if;
		end if;
	end process;

 counter <= std_logic_vector(to_unsigned (s_counter,9));

end compCounter9;
