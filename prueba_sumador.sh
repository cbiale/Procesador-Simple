ghdl -a sumador.vhd
ghdl -a sumador_tb.vhd
ghdl -e sumador_tb
ghdl -r sumador_tb --wave=sumador_tb.ghw
gtkwave sumador_tb.ghw