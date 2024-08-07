library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_instrucciones is
    Port (
        clk : in std_logic;
        direccion : in std_logic_vector(15 downto 0);
        dato_leido : out std_logic_vector(15 downto 0)
    );
end memoria_instrucciones;

architecture memoria_instrucciones_arq of memoria_instrucciones is
    type memoria_instrucciones_array is array (0 to 65535) of std_logic_vector(15 downto 0);
    signal memoria : memoria_instrucciones_array := (
        0 => "0100000000000000", -- load r0, r0, r0 (010 000 000 000 0000)
        1 => "0100010000010000", -- load r1, r1, r0 (010 001 000 001 0000)
        2 => "0000000010100000", -- add r2, r0, r1  (000 000 001 010 0000)
        others => (others => '0')
    );

begin
    process(clk)
    begin
        if rising_edge(clk) then
            dato_leido <= memoria(to_integer(unsigned(direccion)));
        end if;
    end process;
end architecture;