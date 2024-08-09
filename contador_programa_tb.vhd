library ieee;
use ieee.std_logic_1164.all;

entity contador_programa_tb is
end contador_programa_tb;

architecture contador_programa_tb_arq of contador_programa_tb is

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal direccion_entrada : std_logic_vector(15 downto 0) := (others => '0');
    signal direccion_salida : std_logic_vector(15 downto 0);

    component contador_programa
        port (
            clk : in std_logic;
            rst : in std_logic;
            direccion_entrada : in std_logic_vector(15 downto 0);
            direccion_salida : out std_logic_vector(15 downto 0)
        );
    end component;

begin
    -- Instantiate the DUT
    uut: contador_programa
        port map (
            clk, rst, direccion_entrada, direccion_salida
        );

        
    process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    process
    begin
        rst <= '0';
        wait for 10 ns;
        direccion_entrada <= "0000000000000001";
        wait for 10 ns;
        direccion_entrada <= "0000000000000011";
        wait for 10 ns;
        wait;
    end process;

end contador_programa_tb_arq;