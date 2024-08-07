library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador_tb is
end sumador_tb;


architecture sumador_tb_arq of sumador_tb is
    -- Senales
    signal valor : std_logic_vector(15 downto 0);
    signal direccion_entrada : std_logic_vector(15 downto 0);
    signal direccion_salida : std_logic_vector(15 downto 0);

    -- Componente
    component sumador is
        Port (
            valor : in std_logic_vector(15 downto 0);
            direccion_entrada : in std_logic_vector(15 downto 0);
            direccion_salida : out std_logic_vector(15 downto 0)
        );
    end component;
    
begin
    uut : sumador 
    port map
        (valor, direccion_entrada, direccion_salida
    );

    process
    begin
        -- para que funcione el assert he tenido que agregar una espera
        
        -- prueba incremento simple, con cp anterior = 10
        valor <= "0000000000000001";
        direccion_entrada <= "0000000000000010";
        wait for 5 ns;
        assert (direccion_salida = "0000000000000011") report "Error: Caso prueba incremento simple" severity error;
        wait for 10 ns;

        -- prueba incremento inmediato positivo, con cp anterior = 10
        valor <= "0000000000000011";
        direccion_entrada <= "0000000000000010";
        wait for 5 ns;
        assert (direccion_salida = "0000000000000101") report "Error: Caso prueba incremento inmediato positivo" severity error;
        wait for 10 ns;

        -- prueba incremento inmediato negativo, con cp anterior = 10
        valor <= "1111111111111111";
        direccion_entrada <= "0000000000000010";
        wait for 5 ns;
        assert (direccion_salida = "0000000000000001") report "Error: Caso prueba incremento inmediato negativo" severity error;
        wait for 10 ns;
        wait;
    end process;
end;