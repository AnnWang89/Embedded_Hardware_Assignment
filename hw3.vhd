library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity hw3 is
	port(
		CLK					: in std_logic;
		RSTN					: in std_logic;
		o_button 			: in std_logic;
		c_button				: in std_logic;
		Open_door			: out std_logic;
		down					: out std_logic;
		Close_door			: out std_logic;
		up						: out std_logic
);
end hw3;

architecture arch of hw3 is
	signal s0,s1,s2,s3 	: std_logic;
begin
GRAFCET:process(CLK,RSTN)
	begin
	if RSTN='1' then
		s0<='1'; s1<='0'; s2<='0'; s3<='0';
	elsif CLK 'event and CLK='1' then
		if s0='1' and c_button='1'	then
			s0<='0'; s1<='1';
		elsif s1='1' then
			if c_button='1' then 
				s1<='0'; s2<='1'; 
			elsif o_button='1' then 
				s1<='0'; s3<='1'; 
			else NULL;
			end if;
		elsif s2='1' and o_button='1' then
			s2<='0'; s3<='1'; 
		elsif s3='1' then 
			if c_button='1' then 
				s3<='0'; s1<='1'; 
			elsif o_button='1' then 
				s3<='0'; s0<='1'; 
			else NULL;
			end if;
		end if;
	end if;
end process;

datapath:process(CLK,RSTN)
   begin
		if s0='1' then 
			Open_door<='1';down<='0';Close_door<='0';up<='0';
		elsif s1='1' then 
			Open_door<='0';down<='1';Close_door<='0';up<='0';
		elsif s2='1' then 
			Open_door<='0';down<='0';Close_door<='1';up<='0';
		elsif s3='1' then 
			Open_door<='0';down<='0';Close_door<='0';up<='1';
		end if;
	end process;

end arch;


