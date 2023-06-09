library IEEE;
use IEEE.std_logic_1164.all;

entity Conv7Rel is

	port (inPort0  	: in std_logic_vector(3 downto 0);
			inPort1  	: in std_logic_vector(3 downto 0);
			inPort2  	: in std_logic_vector(3 downto 0);
			inPort3  	: in std_logic_vector(3 downto 0);
	
			outPort0	: out std_logic_vector(6 downto 0);
			outPort1	: out std_logic_vector(6 downto 0);
			outPort2	: out std_logic_vector(6 downto 0);
			outPort3	: out std_logic_vector(6 downto 0));
			
end Conv7Rel;

architecture compConv7Rel of Conv7Rel is
begin

		outPort0 <= "1111001" when (inPort0 = "0001") else --1
					  "0100100" when (inPort0 	= "0010") else --2
					  "0110000" when (inPort0 	= "0011") else --3
					  "0011001" when (inPort0 	= "0100") else --4
					  "0010010" when (inPort0 	= "0101") else --5
					  "0000010" when (inPort0 	= "0110") else --6
					  "1111000" when (inPort0 	= "0111") else --7
					  "0000000" when (inPort0 	= "1000") else --8
					  "0010000" when (inPort0 	= "1001") else --9
					  "1000000";
					  
		outPort1 <= "1111001" when (inPort1 = "0001") else --1
					  "0100100" when (inPort1 	= "0010") else --2
					  "0110000" when (inPort1 	= "0011") else --3
					  "0011001" when (inPort1 	= "0100") else --4
					  "0010010" when (inPort1 	= "0101") else --5
					  "0000010" when (inPort1 	= "0110") else --6
					  "1111000" when (inPort1 	= "0111") else --7
					  "0000000" when (inPort1 	= "1000") else --8
					  "0010000" when (inPort1 	= "1001") else --9
					  "1000000";
					  
		outPort2 <= "1111001" when (inPort2 = "0001") else --1
					  "0100100" when (inPort2 	= "0010") else --2
					  "0110000" when (inPort2	= "0011") else --3
					  "0011001" when (inPort2 	= "0100") else --4
					  "0010010" when (inPort2 	= "0101") else --5
					  "0000010" when (inPort2 	= "0110") else --6
					  "1111000" when (inPort2 	= "0111") else --7
					  "0000000" when (inPort2 	= "1000") else --8
					  "0010000" when (inPort2 	= "1001") else --9
					  "1000000";
					  
		outPort3 <= "1111001" when (inPort3 = "0001") else --1
					  "0100100" when (inPort3 	= "0010") else --2
					  "0110000" when (inPort3 	= "0011") else --3
					  "0011001" when (inPort3 	= "0100") else --4
					  "0010010" when (inPort3 	= "0101") else --5
					  "0000010" when (inPort3 	= "0110") else --6
					  "1111000" when (inPort3 	= "0111") else --7
					  "0000000" when (inPort3 	= "1000") else --8
					  "0010000" when (inPort3 	= "1001") else --9
					  "1000000";			  
			
end compConv7Rel;			
