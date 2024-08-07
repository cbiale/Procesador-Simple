ghdl -a control_salto.vhdl
ghdl -a control_salto_tb.vhdl
ghdl -e control_salto_tb
ghdl -r control_salto_tb --wave=control_salto_tb.ghw
gtkwave control_salto_tb.ghw