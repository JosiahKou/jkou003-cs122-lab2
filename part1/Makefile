.PHONY: clean

top_tb.sim: tb/top_tb.sv src/top.sv
	mkdir -p build
	iverilog -g2012 -o build/$@ $^
	vvp build/$@
	gtkwave build/top.vcd

%.bin: src/%.sv top.pcf
	mkdir -p build
	yosys -p "read_verilog -sv $<; synth_ice40 -top $* -json build/$*.json"
	nextpnr-ice40 --up5k --package sg48 --json build/$*.json --pcf top.pcf --asc build/$*.asc --freq 12
	icepack build/$*.asc build/$*.bin

clean:
	rm -rf build