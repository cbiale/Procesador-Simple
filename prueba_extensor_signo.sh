ghdl -a extensor_signo.vhd
ghdl -a extensor_signo_tb.vhd
ghdl -e extensor_signo_tb
ghdl -r extensor_signo_tb --wave=extensor_signo_tb.ghw
gtkwave extensor_signo_tb.ghw