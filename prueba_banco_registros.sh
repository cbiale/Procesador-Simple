ghdl -a banco_registros.vhdl
ghdl -a banco_registros_tb.vhdl
ghdl -e banco_registros_tb
ghdl -r banco_registros_tb --wave=banco_registros_tb.ghw
gtkwave banco_registros_tb.ghw