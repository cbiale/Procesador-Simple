library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

-- entidad registros
entity banco_registros is
    Port ( 
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
end banco_registros;

-- arquitectura
architecture banco_registro_arq of banco_registros is
    -- banco de registros
    type registros_array is array (0 to 7) of std_logic_vector(15 downto 0);
    signal registros : registros_array := (others => (others => '0')); -- inicializacion de registros en cero;
        
begin
    -- proceso que maneja los registros, se estimula por el reloj
    process(clk)
    begin
        if rising_edge(clk) then
            -- escritura en registros
            if re_habilitado = '1' then
                registros(to_integer(unsigned(re_direccion))) <= re_escribir;
            end if;
        end if;
    end process;

    -- salida de valores de registros
    r1_datos <= registros(to_integer(unsigned(r1_direccion)));
    r2_datos <= registros(to_integer(unsigned(r2_direccion)));
    -- solo me interesa por el store
    dato_escribir <= registros(to_integer(unsigned(re_direccion)));

end architecture;
