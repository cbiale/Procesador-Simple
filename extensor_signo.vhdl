library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extensor_signo is
    Port (
        inmediato : in std_logic_vector(6 downto 0);
        resultado_extensor : out std_logic_vector(15 downto 0)
    );
end extensor_signo;

architecture extensor_signo_arq of extensor_signo is
begin
    process(inmediato)
    begin
        if inmediato(6) = '1' then
            resultado_extensor <= "111111111" & inmediato;
        else
            resultado_extensor <= "000000000" & inmediato;
        end if;
    end process;
end architecture;