ghdl -a memoria_datos.vhd
ghdl -a memoria_datos_tb.vhd
ghdl -e memoria_datos_tb
ghdl -r memoria_datos_tb --wave=memoria_datos_tb.ghw
gtkwave memoria_datos_tb.ghw