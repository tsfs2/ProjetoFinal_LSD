library IEEE;
use IEEE.std_logic_1164.all;

entity RelogioBase is
	
	port (clk, mmEN, hhEN		: in std_logic;
			stR, upR, dwR			: in std_logic;
			hhROM						: out std_logic_vector(4 downto 0);
			mmU, mmD, hhU, hhD	: out std_logic_vector(6 downto 0));
end RelogioBase;

architecture ShellRelogioBase of RelogioBase is
--sinal entre contadores de minuto e hora
signal s_enHora		: std_logic;

--sinais entre relogio e conversor 2 digitos
signal s_mm 			: std_logic_vector (5 downto 0);
signal s_hh 			: std_logic_vector (4 downto 0);

--sinais entre conversor 2 digitos e conversor7Seg
signal s_mmU, s_mmD  : std_logic_vector (3 downto 0);
signal s_hhU, s_hhD  : std_logic_vector (3 downto 0);

begin

	minutos: entity work.Minuto(compMinuto)
				port map (clk 	   => clk,
							 enL	   => mmEN,
							 stop		=> stR,
							 up		=> upR,
							 down		=> dwR,
							 minOut  => s_mm,
							 contFim => s_enHora);
							 
	horas: 	entity work.Hora(compHora)
				port map (clk 	   => clk,
							 enable	=> s_enHora,
							 enL		=> hhEN,
							 stop		=> stR,
							 up		=> upR,
							 down		=> dwR,
							 horaOut => s_hh);
				
				hhROM <= s_hh;
							 
	conv2D:	entity work.ConversorRelogio(compConversorRelogio)
				port map (minIn	=> s_mm, 
							 horaIn 	=> s_hh,
							 minDez	=> s_mmD,
							 minUnd	=> s_mmU,
							 horaDez	=> s_hhD,
							 horaUnd	=> s_hhU);
							 
	conv7S:	entity work.Conv7Rel(compConv7Rel)
				port map (inPort0		=> s_mmU,
							 inPort1		=> s_mmD,
							 inPort2		=> s_hhU,
							 inPort3		=> s_hhD,
							 outPort0	=> mmU,
							 outPort1	=> mmD,
							 outPort2	=> hhU,
							 outPort3	=> hhD);
end ShellRelogioBase;							 
							 
							 
