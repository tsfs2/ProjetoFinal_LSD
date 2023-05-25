library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UpDown_Tb is
end UpDown_Tb;

architecture Behavioral of UpDown_Tb is


signal s_clk,s_up_down: std_logic;

signal s_counter:std_logic_vector(8 downto 0);

begin
uut: entity work.UpDown(Behavioral)

										port map (clk => s_clk,
													up_down =>s_up_down,
													counter=>s_counter);
--clk stim
clock_process :process
begin
     s_clk <= '0';
     wait for 10 ns;
     s_clk <= '1';
     wait for 10 ns;
end process;


-- process stim
stim_proc: process
begin        

    s_up_down <= '1';
	 wait for 300 ns;
    s_up_down <= '0';
	 wait for 500 ns;
	 s_up_down<='1';
    wait;
	 
end process;
end Behavioral;
