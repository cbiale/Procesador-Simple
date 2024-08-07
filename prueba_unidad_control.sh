ghdl -a unidad_control.vhdl
ghdl -a unidad_control_tb.vhdl
ghdl -e unidad_control_tb
ghdl -r unidad_control_tb --wave=unidad_control_tb.ghw
gtkwave unidad_control_tb.ghw