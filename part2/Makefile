.PHONY: clean

top_tb.sim: tb/top_tb.sv src/top.sv src/decoder.sv src/adder.sv
	mkdir -p build
	iverilog -g2012 -o build/\$@ \$^
	vvp build/\$@
	gtkwave build/top.vcd &

top.bin: src/top.sv src/decoder.sv src/adder.sv top.pcf
	mkdir -p build
	yosys -p "read_verilog -sv src/top.sv src/decoder.sv src/adder.sv; synth_ice40 -top top -json build/top.json"
	nextpnr-ice40 --up5k --package sg48 --json build/top.json --pcf top.pcf --asc build/top.asc --freq 12
	icepack build/top.asc build/top.bin

clean:
	rm -rf build
