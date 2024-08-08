library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end entity alu_tb;

architecture alu_tb_arq of alu_tb is

    -- declaraci�n de se�ales de prueba
    signal a, b : std_logic_vector(15 downto 0);
    signal operacion : std_logic_vector(1 downto 0);
    signal resultado_alu : std_logic_vector(15 downto 0);
    signal condicion_salto : std_logic;

    -- componente a probar
    component alu
        Port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            operacion : in std_logic_vector(1 downto 0); -- 00: suma, 01: resta, 10: igualdad
            resultado_alu : out std_logic_vector(15 downto 0);
            condicion_salto : out std_logic
        );
    end component;

begin
    -- Instanciaci�n de la ALU
    dut: alu port map (a, b, operacion, resultado_alu, condicion_salto);

    -- Proceso de est�mulo
    process
    begin
        -- Est�mulo 1
        a <= "0000000000000001";
        b <= "0000000000000010";
        operacion <= "00"; -- Operaci�n de suma
        wait for 10 ns;

        -- Est�mulo 2
        a <= "0000000000000100";
        b <= "0000000000000011";
        operacion <= "01"; -- Operaci�n de resta
        wait for 10 ns;

        -- Est�mulo 3
        a <= "0000000000000001";
        b <= "0000000000000010";
        operacion <= "10"; -- Operaci�n de igualdad
        wait for 10 ns;

        a <= "0000000000000011";
        b <= "0000000000000011";
        operacion <= "10"; -- Operaci�n de igualdad
        wait for 10 ns;
    
        wait;
    end process;
end architecture;