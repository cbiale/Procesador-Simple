library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- sumador 
-- se usa al sumar el contador del programa con 1 o
-- al sumar el contador de programa con el inmediato
entity sumador is
    Port (
        -- valor se usa para el 1 o el inmediato
        valor : in std_logic_vector(15 downto 0);
        direccion_entrada : in std_logic_vector(15 downto 0);
        direccion_salida : out std_logic_vector(15 downto 0)
    );
end sumador;

architecture sumador_arq of sumador is
begin
    process(valor, direccion_entrada)
    begin
        direccion_salida <= std_logic_vector(signed(direccion_entrada) + signed(valor));
    end process;
end sumador_arq;