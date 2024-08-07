library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    Port (
        a : in std_logic_vector(15 downto 0);
        b : in std_logic_vector(15 downto 0);
        operacion : in std_logic_vector(1 downto 0); -- 00: suma, 01: resta, 10: igualdad
        resultado_alu : out std_logic_vector(15 downto 0);
        condicion_salto : out std_logic
    );
end alu;

architecture alu_arq of alu is
begin
    process(a, b, operacion)
    begin
        case operacion is
            -- Suma
            when "00" => 
                resultado_alu <= std_logic_vector(signed(a) + signed(b));
                condicion_salto <= '0';
            -- Resta
            when "01" =>
                resultado_alu <= std_logic_vector(signed(a) - signed(b));
                condicion_salto <= '0';
             -- Comparación por igualdad
            when "10" =>
                resultado_alu <= (others => '0');
                if a = b then
                    condicion_salto <= '1';
                else
                    condicion_salto <= '0';
                end if;
             -- Comparación por no igualdad
             when "11" =>
                resultado_alu <= (others => '0');
                if a = b then
                    condicion_salto <= '0';
                else
                    condicion_salto <= '1';
                end if;
            when others =>
                resultado_alu <= (others => '0');
                condicion_salto <= '0';
            end case;
    end process;
end architecture;