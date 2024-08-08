library ieee;
use ieee.std_logic_1164.all;

-- procesador implementado
entity procesador is
    port (
        clk : in std_logic;
        rst : in std_logic
    );
end entity;

architecture procesador_arq of procesador is
    -- Declaración del componente contador_programa
    component contador_programa is
        port (
            clk : in std_logic;
            rst : in std_logic;
            direccion_entrada : in std_logic_vector(15 downto 0);
            direccion_salida : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Declaración del componente memoria de instrucciones
    component memoria_instrucciones is
        port (
            direccion : in std_logic_vector(15 downto 0);
            dato_leido : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Declaración del componente del decoder
    component decoder is
        port (
            instruccion : in std_logic_vector(15 downto 0);
            opcode : out std_logic_vector(2 downto 0);
            r1_direccion : out std_logic_vector(2 downto 0);
            r2_direccion : out std_logic_vector(2 downto 0);
            re_direccion : out std_logic_vector(2 downto 0);
            inmediato : out std_logic_vector(6 downto 0)    
        );
        end component;
        
    -- Declaración del componente de la unidad de control
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

    -- Declaración de extensor_signo
    component extensor_signo is
        port (
            inmediato : in std_logic_vector(6 downto 0);
            resultado_extensor : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Declaración del banco de registros
    component banco_registros is
        Port ( 
                clk : in std_logic;
                r1_direccion : in std_logic_vector(2 downto 0);
                r1_datos : out std_logic_vector(15 downto 0);
                r2_direccion : in std_logic_vector(2 downto 0);
                r2_datos : out std_logic_vector(15 downto 0);
                re_habilitado : in std_logic;
                re_direccion : in std_logic_vector(2 downto 0);
                re_escribir : in std_logic_vector(15 downto 0);
                dato_escribir : out std_logic_vector(15 downto 0)
            );
    end component;
    
    -- Declaración de la ALU
    component alu is
        Port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            operacion : in std_logic_vector(1 downto 0); -- 00: suma, 01: resta, 10: igualdad
            resultado_alu : out std_logic_vector(15 downto 0);
            condicion_salto : out std_logic
        );
    end component;

    -- Declaración de la memoria de datos
    component memoria_datos is
        Port (
            clk : in std_logic;
            direccion : in std_logic_vector(15 downto 0);
            leer_memoria : in std_logic;
            escribir_memoria : in std_logic;
            dato_escribir : in std_logic_vector(15 downto 0);
            dato_leido : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Declaración de control de salto
    component control_salto is
        Port (
            salto : in std_logic;
            condicion_salto : in std_logic;
            salta : out std_logic
        );
    end component;    

    -- Declaración de sumandor
    -- usado en 1 + contador de programa
    -- usado en inmediato + contador de programa
    component sumador is
        Port (
            valor : in std_logic_vector(15 downto 0);
            direccion_entrada : in std_logic_vector(15 downto 0);
            direccion_salida : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Declaración de multiplexor
    -- usado en alu y memoria datos
    -- usado en valores de contador de programa 
    component multiplexor is
        Port (
            selector : in std_logic;
            valor_1 : in std_logic_vector(15 downto 0);
            valor_2 : in std_logic_vector(15 downto 0);
            valor : out std_logic_vector(15 downto 0)
        );
    end component;

    signal direccion_entrada : std_logic_vector(15 downto 0) := (others => '0');
    signal direccion_salida : std_logic_vector(15 downto 0);
    signal instruccion : std_logic_vector(15 downto 0);
    signal opcode : std_logic_vector(2 downto 0);
    signal r1_direccion : std_logic_vector(2 downto 0);
    signal r2_direccion : std_logic_vector(2 downto 0);
    signal re_direccion : std_logic_vector(2 downto 0);
    signal inmediato : std_logic_vector(6 downto 0);
    signal re_habilitado : std_logic;
    signal leer_memoria : std_logic;
    signal escribir_memoria : std_logic;
    signal alu_memoria : std_logic;
    signal salto : std_logic;
    signal operacion : std_logic_vector(1 downto 0);
    signal resultado_extensor : std_logic_vector(15 downto 0);
    signal r1_datos : std_logic_vector(15 downto 0);
    signal r2_datos : std_logic_vector(15 downto 0);
    signal resultado_alu : std_logic_vector(15 downto 0);
    signal condicion_salto : std_logic;
    signal direccion_nueva_1 : std_logic_vector(15 downto 0);
    signal direccion_nueva_inmediato : std_logic_vector(15 downto 0);
    signal dato_escribir : std_logic_vector(15 downto 0);
    signal dato_leido : std_logic_vector(15 downto 0);
    signal re_escribir : std_logic_vector(15 downto 0);
    signal salta : std_logic;

begin
    -- Instanciación del componente contador_programa
    instancia_contador_programa : contador_programa
        port map (clk, rst, direccion_entrada, direccion_salida
    );

    -- Instanciación del componente memoria de instrucciones
    instancia_memoria_instrucciones : memoria_instrucciones
        port map (direccion_salida, instruccion
    );

    -- Instanciación del componente decoder
    instancia_decoder : decoder
        port map (instruccion, opcode, r1_direccion, r2_direccion, re_direccion, inmediato
    );

    -- Instanciación del componente unidad_control
    instancia_unidad_control : unidad_control
        port map (opcode, re_habilitado, leer_memoria, escribir_memoria, alu_memoria, salto, operacion
    );

    -- Instanciación del componente extensor_signo
    instancia_extensor_signo : extensor_signo
        port map (inmediato, resultado_extensor
    );

    -- Instanciación del banco de registros
    instancia_banco_registros : banco_registros
        port map(
            clk, r1_direccion, r1_datos, r2_direccion, r2_datos, re_habilitado, re_direccion, re_escribir, dato_escribir   
    );

    -- Instanciación de la ALU
    instancia_alu : alu
        port map(r1_datos, r2_datos, operacion, resultado_alu, condicion_salto
    );

    -- Instanciación de la memoria de datos
    instancia_memoria_datos : memoria_datos
        port map(clk, resultado_alu, leer_memoria, escribir_memoria, dato_escribir, dato_leido
    );

    -- Instanciación de control de salto
    instancia_control_salto : control_salto
        port map(salto, condicion_salto, salta
    );

    -- Instanciación de sumandor 1 y contador de programa
    instancia_sumador_1 : sumador
        port map("0000000000000001", direccion_salida, direccion_nueva_1
    );

    -- Instanciación de sumador de inmediato y contador de programa
    instancia_sumador_inmediato : sumador
        port map(resultado_extensor, direccion_salida, direccion_nueva_inmediato
    );

    -- Instanciación de multiplexor alu y memoria datos
    instancia_multiplexor_alu_memoria : multiplexor
        port map(alu_memoria, resultado_alu, dato_leido, re_escribir
    );

    -- Instanciación de multiplexor contador de programa
    instancia_multiplexor_contador_programa : multiplexor
        port map(salta, direccion_nueva_1, direccion_nueva_inmediato, direccion_entrada
    );

end architecture;