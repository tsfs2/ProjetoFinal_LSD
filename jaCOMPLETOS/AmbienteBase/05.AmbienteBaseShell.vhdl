library ieee;
use ieee.std_logic_1164.all;

entity AmbienteBase is
	port (clk					: in std_logic;
			tRef					: in std_logic_vector(8 downto 0);
			radiador				: out std_logic;
			gDez, gUni, gDci	: out std_logic_vector(6 downto 0));
			
end AmbienteBase;


architecture ShellAmbienteBase of AmbienteBase is

--sinais do Contador
signal s_contagem : std_logic_vector(8 downto 0);
signal s_control  : std_logic;
 			
--sinais do conversor de 3 digitos
signal s_gDez, s_gUni, s_gDci : std_logic_vector(3 downto 0);

begin

	contador9: entity work.Counter9(compCounter9) 
				  port map (clk 		=> clk,
								up_down	=> s_control,
								counter	=> s_contagem);
	
	control: entity work.Controlador9(compControlador9)
				port map (clk			=> clk,
							 tRef 		=> tRef,
							 tCount		=> s_contagem,
							 controlOut	=> s_control);
							 			 
				radiador <= s_control; -- saida para LEDr simulando o ON/OFF
	
	conv3Dig: entity work.ConversorTemperatura(compConversorTemperatura)
				 port map (tempIn => s_contagem,
							  tDec	=> s_gDci,
							  tGuni	=> s_gUni,
							  tGdez	=> s_gDez);
							  
	conv7seg: entity work.Conv7Amb(compConv7Amb)
				 port map (inPort0	=> s_gDci,
							  inPort1	=> s_gUni,
							  inPort2 	=> s_gDez,
							  outPort0	=> gDez,
							  outPort1	=> gUni,
							  outPort2	=> gDci);

end ShellAmbienteBase;					  
