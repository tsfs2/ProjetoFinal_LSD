library IEEE;
use IEEE.STD_LOGIC_1164.all;


--estando no estado inicial, se clicar no P vou para o primeiro estado , dentro desse estado se clicar no +
--up fica a 1 e volto para o mesmo estado, se clicar no - ativo o down, apenas quando clicar no p avanco para o 
--proximo estado

entity FSMTemp is
		port( p:in std_logic;
				clk:in std_logic;
				positivo,negativo:in std_logic; --botoes + e -
				up,down,modo: out std_logic;
				esol,elua,egel: out std_logic);

end FSMTemp;

architecture Behavioral of FSMTemp is
	type TState is(INICIAL,TSOL,TLUA,TGEL);
signal s_currentState,s_nextState:TState;
begin

	sync_proc:process(clk)
	begin
		if(rising_edge(clk))then
			s_currentState<=s_nextState;
		end if;
	end process;

	proc_combin:process(s_currentState,positivo,negativo)
	begin
		case(s_currentState)is
		when INICIAL =>
			esol<='0';
			elua<='0';
			egel<='0';
			modo<='0';
		
		
			if(p='1')then
				s_nextState<=TSOL;
			else
				s_nextState<=INICIAL;
			end if;
			if(positivo='1')then
				up<='1';
			else
				up<='0';
			end if;
			if(negativo='1')then
				down<='1';
			else
				down<='0';
			end if;
		
		
		when TSOL =>
			esol<='1';
			elua<='0';
			egel<='0';
			modo<='1';
		
			if(p='1')then
				s_nextState<=TLUA;
			else
				s_nextState<=TSOL;
			end if;
			if(positivo='1')then
				up<='1';
			else
				up<='0';
			end if;
			if(negativo='1')then
				down<='1';
			else
				down<='0';
			end if;
		
		
		
		when TLUA =>
			esol<='0';
			elua<='1';
			egel<='0';
			modo<='1';
		
		
			if(p='1')then
				s_nextState<=TGEL;
			else
				s_nextState<=TLUA;
			end if;
			if(positivo='1')then
				up<='1';
			else
				up<='0';
			end if;
			if(negativo='1')then
				down<='1';
			else
				down<='0';
			end if;
		
		
		
		when TGEL =>
			esol<='0';
			elua<='0';
			egel<='1';
			modo<='1';
		
			if(p='1')then
				s_nextState<=INICIAL;
			else
				s_nextState<=TGEL;
			end if;
			if(positivo='1')then
				up<='1';
			else
				up<='0';
			end if;
			if(negativo='1')then
				down<='1';
			else
				down<='0';
			end if;
		
		end case;
	end process;
end Behavioral;
