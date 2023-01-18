library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab2 is
	port(
			clk : in std_logic := '0';
			reset_n : in std_logic :='0';
			segment1 : out std_logic_vector(7 downto 0);
			segment2 : out std_logic_vector(7 downto 0);
			segment3 : out std_logic_vector(7 downto 0));
	

end entity;

architecture rtl of lab2 is

    component lab2_sys is
        port (
            clk_clk                         : in  std_logic                    := 'X'; -- clk
            reset_reset_n                   : in  std_logic                    := 'X'; -- reset_n
            seg1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            seg2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            seg3_external_connection_export : out std_logic_vector(3 downto 0)         -- export
        );
    end component lab2_sys;

	component bin_to_7seg is
			port(
				B : in std_logic_vector(3 downto 0);
				S : out std_logic_vector(7 downto 0));
			
	end component bin_to_7seg;

signal tmp1 : std_logic_vector(3 downto 0);
signal tmp2 : std_logic_vector(3 downto 0);
signal tmp3 : std_logic_vector(3 downto 0);	 
	 
begin	 
	 
	 
    u0 : component lab2_sys
        port map (
            clk_clk                         => clk,                         --                      clk.clk
            reset_reset_n                   => reset_n,                   --                    reset.reset_n
            seg1_external_connection_export => tmp1, -- seg1_external_connection.export
            seg2_external_connection_export => tmp2, -- seg2_external_connection.export
            seg3_external_connection_export => tmp3  -- seg3_external_connection.export
        );
		  
	convert1 : component bin_to_7seg
			port map (
				B => tmp1,
				S => segment1);
				
				
	convert2 : component bin_to_7seg
			port map (
				B => tmp2,
				S => segment2);

	convert3 : component bin_to_7seg
			port map (
				B => tmp3,
				S => segment3);
		  
end architecture;		  
		  
		  
		  
