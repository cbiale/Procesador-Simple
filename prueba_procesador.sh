ghdl -a alu.vhdl
ghdl -a banco_registros.vhdl
ghdl -a contador_programa.vhdl
ghdl -a control_salto.vhdl
ghdl -a decoder.vhdl
ghdl -a extensor_signo.vhdl
ghdl -a memoria_datos.vhdl
ghdl -a memoria_instrucciones.vhdl
ghdl -a multiplexor.vhdl
ghdl -a sumador.vhdl
ghdl -a unidad_control.vhdl
ghdl -a procesador.vhdl
ghdl -a procesador_tb.vhdl
ghdl -e procesador_tb
ghdl -r procesador_tb --wave=procesador_tb.ghw
gtkwave procesador_tb.ghw