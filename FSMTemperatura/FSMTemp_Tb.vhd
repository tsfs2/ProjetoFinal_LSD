library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSMTemp_Tb is
end FSMTemp_Tb;

architecture Behavioral of FSMTemp_Tb is

signal s_p,s_clk,s_positivo,s_negativo: std_logic;
signal s_up,s_down,s_esol,s_elua,s_egel: std_logic;


begin 

uut: entity work.FSMTemp(Behavioral)
	port map(clk=>s_clk,
				p=>s_p,
				positivo=>s_positivo,
				negativo=>s_negativo,
				up=>s_up,
				down=>s_down,
				elua=>s_elua,
				esol=>s_esol,
				egel=>s_egel);
				
				
				
clock_process:process
begin
    s_clk<='0';
	 wait for 10 ns;
	 s_clk<='1';
	 wait for 10 ns;
end process;
				
				
stim_proc:process
begin
--inicial
	s_p<='0';
	s_positivo<='1';
	wait for 20 ns;
--esol
	s_p<='1';
	s_positivo<='0';
	wait for 10 ns;
	s_p<='0';
	wait for 40 ns;
	--elua
	s_p<='1';
	s_negativo<='1';
	
	wait for 40 ns;
	s_p<='0';
	s_negativo<='0';
	s_positivo<='1';
	wait for 40 ns;
	s_p<='1';
	--egel
	s_positivo<='0';
	s_negativo<='0';
	wait for 40 ns;
	s_p<='0';
	wait;

end process;
end Behavioral;
