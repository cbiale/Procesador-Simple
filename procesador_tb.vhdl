library ieee;
use ieee.std_logic_1164.all;

entity procesador_tb is
end entity;

architecture procesador_tb_arq of procesador_tb is
    component procesador is
        port (
            clk : in std_logic
        );
    end component;

    signal clk : std_logic := '0';
    constant tiempo : time := 100 ns;

begin
    -- instancia del procesador
    dut : procesador
        port map (clk);

    -- reloj
    -- proceso que activa el reloj (funciona)
    process
    begin
        while now < 300 ns loop
            clk <= '0';
            wait for (tiempo / 2);
            clk <= '1';
            wait for (tiempo / 2);
        end loop;
        wait;
    end process;


end architecture;