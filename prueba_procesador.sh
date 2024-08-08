ghdl -a alu.vhd
ghdl -a banco_registros.vhd
ghdl -a contador_programa.vhd
ghdl -a control_salto.vhd
ghdl -a decoder.vhd
ghdl -a extensor_signo.vhd
ghdl -a memoria_datos.vhd
ghdl -a memoria_instrucciones.vhd
ghdl -a multiplexor.vhd
ghdl -a sumador.vhd
ghdl -a unidad_control.vhd
ghdl -a procesador.vhd
ghdl -a procesador_tb.vhd
ghdl -e procesador_tb
ghdl -r procesador_tb --wave=procesador_tb.ghw
gtkwave procesador_tb.ghw