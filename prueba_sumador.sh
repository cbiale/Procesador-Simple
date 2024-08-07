ghdl -a sumador.vhdl
ghdl -a sumador_tb.vhdl
ghdl -e sumador_tb
ghdl -r sumador_tb --wave=sumador_tb.ghw
gtkwave sumador_tb.ghw