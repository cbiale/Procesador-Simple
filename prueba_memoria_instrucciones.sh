ghdl -a memoria_instrucciones.vhd
ghdl -a memoria_instrucciones_tb.vhd
ghdl -e memoria_instrucciones_tb
ghdl -r memoria_instrucciones_tb --wave=memoria_instrucciones_tb.ghw
gtkwave memoria_instrucciones_tb.ghw