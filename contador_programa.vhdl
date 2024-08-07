library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- registro contador del programa
entity contador_programa is
    port (
        clk : in std_logic;
        direccion_entrada : in std_logic_vector(15 downto 0);
        direccion_salida : out std_logic_vector(15 downto 0)
    );
end contador_programa;

architecture contador_programa_arq of contador_programa is
    signal valor : std_logic_vector(15 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then        
            valor <= direccion_entrada;
        end if;
    end process;
    direccion_salida <= valor;
end contador_programa_arq;