ghdl -a extensor_signo.vhdl
ghdl -a extensor_signo_tb.vhdl
ghdl -e extensor_signo_tb
ghdl -r extensor_signo_tb --wave=extensor_signo_tb.ghw
gtkwave extensor_signo_tb.ghw