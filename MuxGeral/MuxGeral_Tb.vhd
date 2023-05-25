library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MuxGeral_Tb is
end MuxGeral_Tb;

architecture Behavioral of MuxGeral_Tb is

signal s_s: std_logic_vector(1 downto 0);
signal s_i0,s_i1,s_i2,s_i3:std_logic;
signal s_yout: std_logic;

begin 

uut: entity work.MuxGeral(Behavioral)
	port map(s=>s_s,
				i0=>s_i0,
				i1=>s_i1,
				i2=>s_i2,
				i3=>s_i3,
				yout=>s_yout);
				
				
stim_proc:process
begin
	s_i0<='0';
	s_i1<='0';
	s_i2<='1';
	s_i3<='1';
	s_s<="00";
	
	
	wait for 20 ns;
	s_s<="01";
	wait for 20 ns;
	s_s<="10";
	wait for 20 ns;
	s_s<="11";
	wait for 20 ns;
	s_s<="00";
	wait for 20 ns;
	s_s<="10";
	wait for 20 ns;
	s_s<="01";
	wait for 20 ns;
	wait;
end process;
end Behavioral;
				
