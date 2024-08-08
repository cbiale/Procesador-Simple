library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_datos is
    Port (
        clk : in std_logic;
        direccion : in std_logic_vector(15 downto 0);
        leer_memoria : in std_logic;
        escribir_memoria : in std_logic;
        dato_escribir : in std_logic_vector(15 downto 0);
        dato_leido : out std_logic_vector(15 downto 0)
    );
end memoria_datos;

architecture memoria_datos_arq of memoria_datos is
    type memoria_datos_array is array (0 to 65535) of std_logic_vector(15 downto 0);
    signal memoria : memoria_datos_array := (
        0 => "0000000000000001", -- valor 1
        1 => "0000000000000010", -- valor 2
        -- resto
        others => (others => '0')
    );
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if escribir_memoria = '1' then
                memoria(to_integer(unsigned(direccion))) <= dato_escribir;
            end if;
        end if;
    end process;

    process(clk, leer_memoria, direccion)
    begin
        if leer_memoria = '1' then
            dato_leido <= memoria(to_integer(unsigned(direccion)));
        else
            dato_leido <= "0000000000000000"; 
        end if;
    end process;

end architecture;
