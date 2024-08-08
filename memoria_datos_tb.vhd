library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_datos_tb is
end memoria_datos_tb;

architecture memoria_datos_tb_arq of memoria_datos_tb is

    -- Señales internas
    signal clk : std_logic := '0';
    signal direccion : std_logic_vector(15 downto 0);
    signal leer_memoria : std_logic;
    signal escribir_memoria : std_logic;
    signal dato_escribir : std_logic_vector(15 downto 0);
    signal dato_leido : std_logic_vector(15 downto 0);

    -- Período del reloj
    constant tiempo : time := 10 ns;

    component memoria_datos is
        Port (
            clk : in std_logic;
            direccion : in std_logic_vector(15 downto 0);
            leer_memoria : in std_logic;
            escribir_memoria : in std_logic;
            dato_escribir : in std_logic_vector(15 downto 0);
            dato_leido : out std_logic_vector(15 downto 0)
        );
    end component;

begin

    -- Instancia de la entidad memoria_datos
    uut: memoria_datos
        port map (
            clk, direccion, leer_memoria, 
            escribir_memoria, dato_escribir, dato_leido
        );

    -- Generación del reloj
    process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for (tiempo / 2);
            clk <= '1';
            wait for (tiempo / 2);
        end loop;
        wait;
    end process;

    -- Proceso de estímulos
    process
    begin
        -- Inicialización
        direccion <= (others => '0');
        leer_memoria <= '0';
        escribir_memoria <= '0';
        dato_escribir <= (others => '0');
        wait for 10 ns;

        -- Escribir en la dirección 0
        direccion <= "0000000000000000";
        dato_escribir <= "0000000000001010"; -- valor 10
        escribir_memoria <= '1';
        wait for tiempo;
        escribir_memoria <= '0';
        wait for tiempo;

        -- Leer de la dirección 0
        leer_memoria <= '1';
        wait for tiempo;
        leer_memoria <= '0';
        wait for tiempo;

        -- Escribir en la dirección 1
        direccion <= "0000000000000001";
        dato_escribir <= "0000000000001111"; -- valor 15
        escribir_memoria <= '1';
        wait for tiempo;
        escribir_memoria <= '0';
        wait for tiempo;

        -- Leer de la dirección 1
        leer_memoria <= '1';
        wait for tiempo;
        leer_memoria <= '0';
        wait for tiempo;

        wait;
    end process;

end memoria_datos_tb_arq;