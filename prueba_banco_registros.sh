ghdl -a banco_registros.vhd
ghdl -a banco_registros_tb.vhd
ghdl -e banco_registros_tb
ghdl -r banco_registros_tb --wave=banco_registros_tb.ghw
gtkwave banco_registros_tb.ghw