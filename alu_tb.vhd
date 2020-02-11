library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity alu_tb is
end;

architecture behave of alu_tb is
    signal r_A      : std_logic_vector(7 downto 0);
    signal r_B      : std_logic_vector(7 downto 0);
    signal r_Sel    : std_logic_vector(3 downto 0) := (others => '0');

    signal w_Output : std_logic_vector(7 downto 0);

begin
    UUT : entity work.alu
        port map(
            i_A         => r_A,
            i_B         => r_B,
            i_select    => r_Sel,

            o_Output    => w_Output
        );

    process is
    begin
        r_A <=  x"05";
        r_B <=  x"08";

        for ii in 0 to 15 loop
           r_Sel <= r_Sel + x"1";
            
           wait for 10ns;
        end loop;
        wait for 10ns;
    end process;
end behave;