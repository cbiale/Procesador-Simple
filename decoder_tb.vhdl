library ieee;
use ieee.std_logic_1164.all;

entity decoder_tb is
end decoder_tb;

architecture decoder_tb_arq of decoder_tb is
    -- componente
    component decoder is
        Port (
            instruccion : in std_logic_vector(15 downto 0);
            opcode : out std_logic_vector(2 downto 0);
            r1_direccion : out std_logic_vector(2 downto 0);
            r2_direccion : out std_logic_vector(2 downto 0);
            re_direccion : out std_logic_vector(2 downto 0);
            inmediato : out std_logic_vector(6 downto 0)
        );
    end component;

    -- senales
    signal instruccion : std_logic_vector(15 downto 0);
    signal opcode : std_logic_vector(2 downto 0);
    signal r1_direccion : std_logic_vector(2 downto 0);
    signal r2_direccion : std_logic_vector(2 downto 0);
    signal re_direccion : std_logic_vector(2 downto 0);
    signal inmediato : std_logic_vector(6 downto 0);

begin
    -- Instanciación del decoder
    uut: decoder
        port map (
            instruccion, opcode, r1_direccion, r2_direccion, re_direccion, inmediato
        );

    -- estimulos
    process
    begin
        -- add r1, r2, r3 (r1 = r2 + r3)
        -- opcode = 000
        -- r1 (rd) = 001
        -- r2 (rf1) = 010
        -- r3 (rf2) = 011
        -- 000 010 011 001 0000
        instruccion <= "0000100110010000";
        wait for 10 ns;

        -- je r1, r2, 1000000
        -- opcode = 100
        -- r1 (rf1) = 001
        -- r2 (rf2) = 010
        -- 100 001 010 1000000
        instruccion <= "1000010101000000";
        wait for 10 ns;

        -- out r3
        -- opcode = 111
        -- r3 (rd) = 011
        instruccion <= "1110000000110000";
        wait for 10 ns;
        
        wait;

    end process;

end;