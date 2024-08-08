library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- controla si se debe hacer un salto 
entity control_salto is
    Port (
        salto : in std_logic;
        condicion_salto : in std_logic;
        salta : out std_logic
    );
end control_salto;

architecture control_salto_arq of control_salto is
begin
    process(salto, condicion_salto)
    begin
        salta <= salto and condicion_salto;
    end process;
end control_salto_arq;