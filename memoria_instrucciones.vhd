library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_instrucciones is
    Port (
        direccion : in std_logic_vector(15 downto 0);
        dato_leido : out std_logic_vector(15 downto 0)
    );
end memoria_instrucciones;

architecture memoria_instrucciones_arq of memoria_instrucciones is
    type memoria_instrucciones_array is array (0 to 65535) of std_logic_vector(15 downto 0);
    signal memoria : memoria_instrucciones_array := (
        0 => "0100000000000000", -- load r0, r0, r0  carga en r0 el valor 1 de MD[0]
        1 => "0100010000010000", -- load r1, r2, r0  carga en r1 el valor 2 de MD[1]
        2 => "0000000010100000", -- add r2, r0, r1   almacena en r2 la suma de r0 y r1 es decir 3
        3 => "0110101000100000", -- store r2, r2, r0 almacena en MD[4] el valor de r2
        4 => "1000010010000000", -- je r1, r1, 0     salta a la dirección PC + 0 si r1 es igual a r1 (simula HALT)
        others => (others => '0')
    );

begin
    dato_leido <= memoria(to_integer(unsigned(direccion)));
end architecture;