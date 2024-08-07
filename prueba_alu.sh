ghdl -a alu.vhdl
ghdl -a alu_tb.vhdl
ghdl -e alu_tb
ghdl -r alu_tb --wave=alu_tb.ghw
gtkwave alu_tb.ghw