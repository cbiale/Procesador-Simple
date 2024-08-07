ghdl -a multiplexor.vhdl
ghdl -a multiplexor_tb.vhdl
ghdl -e multiplexor_tb
ghdl -r multiplexor_tb --wave=multiplexor_tb.ghw
gtkwave multiplexor_tb.ghw