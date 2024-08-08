library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
    Port (
        instruccion : in std_logic_vector(15 downto 0);
        -- va a la unidad de control
        opcode : out std_logic_vector(2 downto 0);
        -- va al banco de registros
        r1_direccion : out std_logic_vector(2 downto 0);
        r2_direccion : out std_logic_vector(2 downto 0);
        re_direccion : out std_logic_vector(2 downto 0);
        -- va al extensor de signo (manejo de inmediato)
        inmediato : out std_logic_vector(6 downto 0)
    );
end decoder;

architecture decoder_arq of decoder is
begin
    process(instruccion)
    begin
        -- Se extraen los campos de la instrucción
        -- los primeros 3 bits en opcode
        opcode <= instruccion(15 downto 13);
        -- los siguientes 3 bits en r1_direccion
        r1_direccion <= instruccion(12 downto 10);
        -- los siguientes 3 bits en r2_direccion
        r2_direccion <= instruccion(9 downto 7);
        -- los siguientes 3 bits en re_direccion
        re_direccion <= instruccion(6 downto 4);
        -- los últimos 7 bits en inmediato
        inmediato <= instruccion(6 downto 0);
    end process;
end architecture;