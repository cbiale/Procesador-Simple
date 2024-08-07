ghdl -a decoder.vhdl
ghdl -a decoder_tb.vhdl
ghdl -e decoder_tb
ghdl -r decoder_tb --wave=decoder_tb.ghw
gtkwave decoder_tb.ghw