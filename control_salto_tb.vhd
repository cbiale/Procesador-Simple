library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_salto_tb is
end control_salto_tb;

architecture control_salto_tb_arq of control_salto_tb is
    -- Señales
    signal salto : std_logic := '0';
    signal condicion_salto : std_logic := '0';
    signal salta : std_logic;

    -- Componente
    component control_salto
        Port (
            salto : in std_logic;
            condicion_salto : in std_logic;
            salta : out std_logic
        );
    end component;

begin
    -- Instancia
    uut: control_salto
        port map (
            salto, condicion_salto, salta
        );

    -- Proceso de estímulo (prueba de asserts)
    process
    begin
        -- Caso 1: salto = '0', condicion_salto = '0'
        salto <= '0';
        condicion_salto <= '0';
        wait for 10 ns;
        assert (salta = '0') report "Error: Caso 1 fallido" severity error;

        -- Caso 2: salto = '0', condicion_salto = '1'
        salto <= '0';
        condicion_salto <= '1';
        wait for 10 ns;
        assert (salta = '0') report "Error: Caso 2 fallido" severity error;

        -- Caso 3: salto = '1', condicion_salto = '0'
        salto <= '1';
        condicion_salto <= '0';
        wait for 10 ns;
        assert (salta = '0') report "Error: Caso 3 fallido" severity error;

        -- Caso 4: salto = '1', condicion_salto = '1'
        salto <= '1';
        condicion_salto <= '1';
        wait for 10 ns;
        assert (salta = '1') report "Error: Caso 4 fallido" severity error;

        -- Finalizar simulación
        wait;
    end process;
end;