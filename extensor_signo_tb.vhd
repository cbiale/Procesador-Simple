library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extensor_signo_tb is
end extensor_signo_tb;

architecture extensor_signo_tb_arq of extensor_signo_tb is

    -- Senales
    signal inmediato : std_logic_vector(6 downto 0);
    signal resultado_extensor : std_logic_vector(15 downto 0);

    -- componente
    component extensor_signo is
        Port (
            inmediato : in std_logic_vector(6 downto 0);
            resultado_extensor : out std_logic_vector(15 downto 0)
        );    
    end component;

begin
    -- instancia
    uut : extensor_signo 
        port map (inmediato, resultado_extensor);

    process
    begin
        -- prueba negativo
        inmediato <= "1000001";
        assert (resultado_extensor = "1111111111000001") report "Error: Caso negativo fallido" severity error;
        wait for 10 ns;

        -- prueba positivo
        inmediato <= "0000001";
        assert (resultado_extensor = "0000000000000001") report "Error: Caso positivo fallido" severity error;
        wait for 10 ns;
        wait;
    end process;
end architecture;