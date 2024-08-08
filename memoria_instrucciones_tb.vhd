library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_instrucciones_tb is
end memoria_instrucciones_tb;

architecture memoria_instrucciones_tb_arq of memoria_instrucciones_tb is

    -- Se�ales internas
    signal direccion : std_logic_vector(15 downto 0);
    signal dato_leido : std_logic_vector(15 downto 0);

    -- Per�odo del reloj
    constant tiempo : time := 10 ns;

    component memoria_instrucciones is
        Port (
            direccion : in std_logic_vector(15 downto 0);
            dato_leido : out std_logic_vector(15 downto 0)
        );
        end component;

begin

    -- Instancia de la entidad memoria_datos
    uut: memoria_instrucciones
        port map (
            direccion, dato_leido
        );

    -- Proceso de est�mulos
    process
    begin
        -- Leer de la direcci�n 0
        direccion <= "0000000000000000";
        wait for tiempo;

        -- Leer de la direcci�n 1
        direccion <= "0000000000000001";
        wait for tiempo;

        wait;
    end process;

end memoria_instrucciones_tb_arq;