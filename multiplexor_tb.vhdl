library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexor_tb is
end multiplexor_tb;

architecture multiplexor_tb_arq of multiplexor_tb is

    -- Senales
    signal selector : std_logic;
    signal valor_1 : std_logic_vector(15 downto 0);
    signal valor_2 : std_logic_vector(15 downto 0);
    signal valor : std_logic_vector(15 downto 0);

    -- Componente
    component multiplexor is
        Port (
            selector : in std_logic;
            valor_1 : in std_logic_vector(15 downto 0);
            valor_2 : in std_logic_vector(15 downto 0);
            valor : out std_logic_vector(15 downto 0)
        );
    end component;
    
begin

    uut : multiplexor
    port map(
        selector, valor_1, valor_2, valor
    );

    process
    begin
        -- Prueba selector en 0, sale valor_1
        selector <= '0';
        valor_1 <= "0000000000000001";
        valor_2 <= "1111111111111110";
        assert (valor = "0000000000000001") report "Error: Caso selector en 0" severity error;
        wait for 10 ns;

        -- Prueba selector en 1, sale valor_2
        selector <= '1';
        valor_1 <= "0000000000000001";
        valor_2 <= "1111111111111110";
        assert (valor = "1111111111111110") report "Error: Caso selector en 1" severity error;
        wait for 10 ns;
        wait;

    end process;
end;