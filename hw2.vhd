library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity hw2 is
	port(
		CLK					: in std_logic;
		RSTN					: in std_logic;
		x1 					: in std_logic;
		x5						: in std_logic;
		welcome				: out std_logic;
		money_not_enough	: out std_logic;
		choose20or50		: out std_logic;
		choose20				: out std_logic
);
end hw2;

architecture arch of hw2 is
	signal s0,s1,s2,s3 	: std_logic;
begin
GRAFCET:process(CLK,RSTN)
	begin
	if RSTN='1' then
		s0<='1'; s1<='0'; s2<='0'; s3<='0';
	elsif CLK 'event and CLK='1' then
		if s0='1' then
			if x1='1' then 
				s0<='0'; s1<='1'; 
			elsif x5='1' then 
				s0<='0'; s2<='1'; 
			else NULL;
			end if;
		elsif s1='1' then
			if x1='1' then 
				s1<='0'; s3<='1'; 
			elsif x5='1' then 
				s1<='0'; s2<='1'; 
			else NULL;
			end if;
		elsif s2='1' then
			s2<='0'; s0<='1'; 
		elsif s3='1' then 
			s3<='0'; s0<='1'; 
		end if;
	end if;
end process;

datapath:process(CLK,RSTN)
   begin
		if s0='1' then 
			welcome<='1';money_not_enough<='0';choose20or50<='0';choose20<='0';
		elsif s1='1' then 
			welcome<='0';money_not_enough<='1';choose20or50<='0';choose20<='0';
		elsif s2='1' then 
			welcome<='0';money_not_enough<='0';choose20or50<='1';choose20<='0';
		elsif s3='1' then 
			welcome<='0';money_not_enough<='0';choose20or50<='0';choose20<='1';
		end if;
	end process;

end arch;


