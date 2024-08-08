ghdl -a unidad_control.vhd
ghdl -a unidad_control_tb.vhd
ghdl -e unidad_control_tb
ghdl -r unidad_control_tb --wave=unidad_control_tb.ghw
gtkwave unidad_control_tb.ghw