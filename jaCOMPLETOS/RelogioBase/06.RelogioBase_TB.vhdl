library IEEE;
use IEEE.std_logic_1164.all;

entity RelogioBase_tb is
end RelogioBase_tb;

architecture compRelogioBase_tb of RelogioBase_tb is
signal s_clk, s_mmEN, s_hhEN			: std_logic;
signal s_stR, s_upR, s_dwR				: std_logic;
signal s_hhROM								: std_logic_vector(4 downto 0);
signal s_mmU, s_mmD, s_hhU, s_hhD	: std_logic_vector(6 downto 0);

begin

	inst: entity work.RelogioBase(shellRelogioBase)
			port map (clk 		=> s_clk,
			
						 stR		=> s_stR,
						 mmEN		=> s_mmEn,
						 hhEN		=> s_hhEN,
						 upR		=> s_upR,
						 dwR		=> s_dwR,
						 
						 hhROM	=> s_hhROM,
						 mmU		=> s_mmU,
						 mmD		=> s_mmD,
						 hhU		=> s_hhU,
						 hhD		=> s_hhD);
						 
	sync:	process
			begin
				
				s_clk <= '0'; wait for 5 ps;
				s_clk <= '1'; wait for 5 ps;
				
			end process;
		
	comb: process
			begin 
				
				s_stR 	<= '0'; 
				s_mmEN	<= '0';
				s_hhEN 	<= '0';
				s_upR		<= '0';
				s_dwR		<= '0';
				
				wait for 200 ps;
				
				s_mmEN	<= '1';
				s_upR		<= '1';
				
				wait for 200 ps;
				
				s_stR		<= '1';
				
				wait for 100 ps;
				
				s_mmEN 	<= '0';
				s_hhEn	<= '1';
				
				wait for 100 ps;
				
				s_stR 	<= '0';
				
				wait;
				
			end process;
end compRelogioBase_tb;			
				
				
