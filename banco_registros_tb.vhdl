library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_registros_tb is
end entity banco_registros_tb;

architecture banco_registros_tb_arq of banco_registros_tb is

    component banco_registros
        port (
            clk : in std_logic;

            -- manejo de registro 1
            r1_direccion : in std_logic_vector(2 downto 0);
            r1_datos : out std_logic_vector(15 downto 0);

            -- manejo de registro 2
            r2_direccion : in std_logic_vector(2 downto 0);
            r2_datos : out std_logic_vector(15 downto 0);

            -- manejo de escritura
            re_habilitado : in std_logic;
            re_direccion : in std_logic_vector(2 downto 0);
            re_escribir : in std_logic_vector(15 downto 0);
            
            -- manejo de escritura en memoria
            dato_escribir : out std_logic_vector(15 downto 0)
        );
    end component;

    constant tiempo : time := 10 ns;
    
    signal r1_direccion, r2_direccion, re_direccion : std_logic_vector(2 downto 0) := (others => '0');
    signal r1_datos, r2_datos, re_escribir, dato_memoria_escribir : std_logic_vector(15 downto 0) := (others => '0');
    signal clk, re_habilitado : std_logic := '0';
    
begin
    dut : banco_registros
        port map (
            clk, r1_direccion, r1_datos, r2_direccion, r2_datos, re_habilitado, re_direccion, re_escribir, dato_memoria_escribir
        );

    -- proceso que activa el reloj (funciona)
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

    -- proceso que genera los estímulos
    process
    begin
        -- espero un tiempo de reloj
        wait for tiempo;

        -- Estimulo 1 (se escibe en el registro 2 (r2))
        r1_direccion <= "000";
        r2_direccion <= "000";
        re_direccion <= "010";
        re_habilitado <= '1';
        re_escribir <= "0000000000000001";
        -- las salidas (r1_datos y r2_datos) deben ser cero
        wait for tiempo;

        -- Estimulo 2 (se escibe en el registro 3 (r3))
        r1_direccion <= "000";
        r2_direccion <= "000";
        re_direccion <= "011";
        re_habilitado <= '1';
        re_escribir <= "0000000000000010";
        -- las salidas (r1_datos y r2_datos) deben ser cero
        wait for tiempo;
        
        -- Estimulo 3 (se escibe en el registro 3 (r3), pero habilitado en cero)
        r1_direccion <= "000";
        r2_direccion <= "000";
        re_direccion <= "011";
        re_habilitado <= '0';
        re_escribir <= "0000000000000000";
        -- las salidas (r1_datos y r2_datos) deben ser cero
        wait for tiempo;

        -- Estimulo 4 (se lee el registro 2 (r2) y el registro 3 (r3), habilitado en cero)
        r1_direccion <= "010";
        r2_direccion <= "011";
        re_direccion <= "000";
        re_habilitado <= '0';
        re_escribir <= "0000000000000000";        
        -- las salidas (r1_datos y r2_datos) deben ser 1 y 2        
        wait for tiempo;

        -- Estimulo 5 (se lee y escribe el registro 2 (r2) y el registro 3 (r3), habilitado en uno)
        r1_direccion <= "010";
        r2_direccion <= "011";
        re_direccion <= "010";
        re_habilitado <= '1';
        re_escribir <= "0000000000000111";        
        -- las salidas (r1_datos y r2_datos) deben ser 7 y 2        
        wait for tiempo;
        
        wait;

    end process;

end architecture;