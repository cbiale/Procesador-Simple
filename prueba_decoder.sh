ghdl -a decoder.vhd
ghdl -a decoder_tb.vhd
ghdl -e decoder_tb
ghdl -r decoder_tb --wave=decoder_tb.ghw
gtkwave decoder_tb.ghw