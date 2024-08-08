ghdl -a multiplexor.vhd
ghdl -a multiplexor_tb.vhd
ghdl -e multiplexor_tb
ghdl -r multiplexor_tb --wave=multiplexor_tb.ghw
gtkwave multiplexor_tb.ghw