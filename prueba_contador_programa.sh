ghdl -a contador_programa.vhd
ghdl -a contador_programa_tb.vhd
ghdl -e contador_programa_tb
ghdl -r contador_programa_tb --wave=contador_programa_tb.ghw
gtkwave contador_programa_tb.ghw