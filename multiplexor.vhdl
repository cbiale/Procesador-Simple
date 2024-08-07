library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- multiplexor 
-- se usa al seleccionar un dato de la memoria de datos o de la alu o
-- entre contador de programa sumado en 1 o contador de programa sumado con el inmediato
entity multiplexor is
    Port (
        selector : in std_logic;
        valor_1 : in std_logic_vector(15 downto 0);
        valor_2 : in std_logic_vector(15 downto 0);
        valor : out std_logic_vector(15 downto 0)
    );
end multiplexor;

architecture multiplexor_arq of multiplexor is
begin
    process(selector, valor_1, valor_2)
    begin
        if selector = '0' then
            valor <= valor_1;
        else
            valor <= valor_2;            
        end if;
    end process;
end multiplexor_arq;