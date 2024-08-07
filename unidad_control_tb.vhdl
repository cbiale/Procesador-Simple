library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unidad_control_tb is
end entity unidad_control_tb;

architecture unidad_control_tb_arq of unidad_control_tb is

    -- Senales
    signal opcode : std_logic_vector(2 downto 0);
    signal re_habilitado : std_logic;
    signal leer_memoria : std_logic;
    signal escribir_memoria : std_logic;
    signal alu_memoria : std_logic;
    signal salto : std_logic;
    signal operacion : std_logic_vector(1 downto 0);

    -- Componente
    component unidad_control is
        port (
            opcode : in std_logic_vector(2 downto 0);
            re_habilitado : out std_logic;
            leer_memoria : out std_logic;
            escribir_memoria : out std_logic;
            alu_memoria : out std_logic;
            salto : out std_logic;
            operacion : out std_logic_vector(1 downto 0)
        );
    end component;

begin
    -- Instancia
    uut : unidad_control
     port map(
        opcode, re_habilitado, leer_memoria, escribir_memoria,
        alu_memoria, salto, operacion
    );

    process
    begin
            -- prueba suma (sum)
            opcode <= "000";
            wait for 5 ns;
            assert (
                operacion = "00" and
                re_habilitado = '1' and
                leer_memoria = '0' and
                escribir_memoria = '0' and
                alu_memoria = '0' and
                salto = '0')
            report "Error en suma" severity error;
            wait for 10 ns;

            -- resta (sub)            
            opcode <= "001";
            wait for 5 ns;
            assert (
                operacion = "01" and
                re_habilitado = '1' and
                leer_memoria = '0' and
                escribir_memoria = '0' and
                alu_memoria = '0' and
                salto = '0')
            report "Error en resta" severity error;
            wait for 10 ns;
            
            -- cargar de memoria (load)
            opcode <= "010";
            wait for 5 ns;
            assert (
                operacion = "00" and
                re_habilitado = '1' and
                leer_memoria = '1' and
                escribir_memoria = '0' and
                alu_memoria = '1' and
                salto = '0')
            report "Error en cargar memoria (load)" severity error;
            wait for 10 ns;

            -- guardar en memoria (store)
            opcode <= "011";
            wait for 5 ns;
            assert (
                operacion = "00" and
                re_habilitado = '0' and
                leer_memoria = '0' and
                escribir_memoria = '1' and
                alu_memoria = '0' and
                salto = '0')
            report "Error en guardar memoria (store)" severity error;
            wait for 10 ns;
            
            -- saltar por igualdad (je)
            opcode <= "100";
            wait for 5 ns;
            assert (
                operacion = "10" and
                re_habilitado = '0' and
                leer_memoria = '0' and
                escribir_memoria = '0' and
                alu_memoria = '0' and
                salto = '1')
            report "Error en salto por iguadad (je)" severity error;
            wait for 10 ns;
            
            -- saltar por no igualdad (jne)
            opcode <= "101";
            wait for 5 ns;
            assert (
                operacion = "11" and
                re_habilitado = '0' and
                leer_memoria = '0' and
                escribir_memoria = '0' and
                alu_memoria = '0' and
                salto = '1')
            report "Error en salto por no iguadad (je)" severity error;
            wait for 10 ns;
            
            -- entrada (in)
            opcode <= "110";
            wait for 5 ns;
            assert (
                operacion = "11" and
                re_habilitado = '0' and
                leer_memoria = '0' and
                escribir_memoria = '0' and
                alu_memoria = '0' and
                salto = '0')
            report "Error en entrada (in)" severity error;
            wait for 10 ns;
            
            -- salida (out)
            opcode <= "111";
            wait for 5 ns;
            assert (
                operacion = "11" and
                re_habilitado = '0' and
                leer_memoria = '0' and
                escribir_memoria = '0' and
                alu_memoria = '0' and
                salto = '0')
            report "Error en salida (out)" severity error;
            wait for 10 ns;
            wait;            
            
    end process;
end architecture;
