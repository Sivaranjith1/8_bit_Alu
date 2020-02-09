library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port(
        i_A, i_B : in std_logic_vector(7 downto 0);
        i_select : in std_logic_vector(3 downto 0);

        o_C : out std_logic_vector(7 downto 0);
    );
end;

architecture rtl of alu is
    signal w_Output : std_logic_vector(7 downto 0);
begin

    case i_select is

        --Add
        when "0000" =>
            w_Output <= i_A + i_B;
        
        --subtraction
        when "0001" =>
            w_Output <= i_A - i_B;

        --multiplication
        when "0010" =>
            w_Output <= std_logic_vector(unsigned(i_A) * unsigned(i_B));

        --division
        when "0011" =>
            w_Output <= std_logic_vector(unsigned(i_A) * unsigned(i_B));

        --mod
        when "0100" =>
            w_Output <= std_logic_vector(unsigned(i_A) mod unsigned(i_B));

        --rem
        when "0101" => 
            w_Output <= std_logic_vector(unsigned(i_A) rem unsigned(i_B));

        --left shift
        when "0110" =>
            w_Output <= i_A sll 1;
            

        --right shift
        when "0111" =>
            w_Output <= i_A srl 1;

        --left rotate
        when "1000" =>
            w_Output <= i_A rol 1;

        --right rotate
        when "1001" =>
            w_Output <= i_A ror 1;

        --and
        when "1010" =>
            w_Output <= i_A and i_B;

        --or
        when "1011" =>
            w_Output <= i_A or i_B;

        --xor
        when "1100" =>
            w_Output <= i_A xor i_B;

        --nor
        when "1101" =>
            w_Output <= i_A nor i_B;

        --nand
        when "1110" =>
            w_Output <= i_A nand i_B;

        --greater comparison
        when "1111" =>
            if(i_A > i_B) then
                w_Output <= x"01";
            else
                w_Output <= x"00";
            end if;

    end case;

    o_C <= w_Output;
end rtl;