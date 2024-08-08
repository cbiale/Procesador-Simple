ghdl -a control_salto.vhd
ghdl -a control_salto_tb.vhd
ghdl -e control_salto_tb
ghdl -r control_salto_tb --wave=control_salto_tb.ghw
gtkwave control_salto_tb.ghw