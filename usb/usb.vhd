library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity usb_interface is
    port (
        clk : in std_logic;
        rst : in std_logic;
        direccion_entrada : in std_logic_vector(15 downto 0);
        usb_tx : out std_logic_vector(7 downto 0)
    );
end usb_interface;

architecture Behavioral of usb_interface is
    signal data_to_send : std_logic_vector(15 downto 0);
    signal send_enable : std_logic;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            data_to_send <= (others => '0');
            send_enable <= '0';
        elsif rising_edge(clk) then
            data_to_send <= direccion_entrada;
            send_enable <= '1';
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if send_enable = '1' then
                usb_tx <= data_to_send(7 downto 0); -- Enviar byte bajo
                wait for 10 ns;
                usb_tx <= data_to_send(15 downto 8); -- Enviar byte alto
                send_enable <= '0';
            end if;
        end if;
    end process;
end Behavioral;