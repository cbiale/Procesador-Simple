library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unidad_control is
    port (
        opcode : in std_logic_vector(2 downto 0);
        -- banco de registro
        re_habilitado : out std_logic;
        -- memoria de datos
        leer_memoria : out std_logic;
        escribir_memoria : out std_logic;
        -- multiplexor que determina si se escribe dato de la alu o memoria
        alu_memoria : out std_logic;
        -- determina si es una instruccion de salto
        salto : out std_logic;
        -- operacion de la alu
        operacion : out std_logic_vector(1 downto 0)
    );
end entity unidad_control;

architecture unidad_control_arq of unidad_control is
begin
    process(opcode)
    begin
        case opcode is
            -- suma (sum)
            when "000" =>
                operacion <= "00";
                re_habilitado <= '1';
                leer_memoria <= '0';
                escribir_memoria <= '0';
                alu_memoria <= '0';
                salto <= '0';
            -- resta (sub)            
            when "001" =>
                operacion <= "01";
                re_habilitado <= '1';
                leer_memoria <= '0';
                escribir_memoria <= '0';
                alu_memoria <= '0';
                salto <= '0';
            -- cargar de memoria (load)
            when "010" =>
                operacion <= "00"; -- suma
                re_habilitado <= '1';
                leer_memoria <= '1';
                escribir_memoria <= '0';
                alu_memoria <= '1'; 
                salto <= '0';
            -- guardar en memoria (store)
            when "011" =>
                operacion <= "00"; -- suma
                re_habilitado <= '0';
                leer_memoria <= '0';
                escribir_memoria <= '1';
                alu_memoria <= '0';
                salto <= '0';
            -- saltar por igualdad (je)
            when "100" =>
                operacion <= "10"; -- igualdad
                re_habilitado <= '0';
                leer_memoria <= '0';
                escribir_memoria <= '0';
                alu_memoria <= '0';
                salto <= '1';
            -- saltar por no igualdad (jne)
            when "101" =>
                operacion <= "11"; -- no igualdad
                re_habilitado <= '0';
                leer_memoria <= '0';
                escribir_memoria <= '0';
                alu_memoria <= '0';
                salto <= '1';
            -- entrada (in)
            when "110" =>
                operacion <= "11"; -- no se usa
                re_habilitado <= '0';
                leer_memoria <= '0';
                escribir_memoria <= '0';
                alu_memoria <= '0';
                salto <= '0';
            -- salida (out)
            when "111" =>
                operacion <= "11"; -- no se usa
                re_habilitado <= '0';
                leer_memoria <= '0';
                escribir_memoria <= '0';
                alu_memoria <= '0'; -- no me interesa (pongo cero)
                salto <= '0';
            when others =>
                operacion <= "00";
                re_habilitado <= '0';
                leer_memoria <= '0';
                escribir_memoria <= '0';
                alu_memoria <= '0'; -- no me interesa (pongo cero)
                salto <= '0';
        end case;
    end process;
end architecture;
