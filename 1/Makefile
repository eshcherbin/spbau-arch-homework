default: bcd2bin half_adder full_adder full_adder_8bit

bcd2bin: bcd2bin.v bcd2bin_test.v full_adder_8bit.v half_adder.v full_adder.v
	iverilog -o $@ $^

half_adder: half_adder.v
	iverilog -o $@ $^

full_adder: half_adder.v full_adder.v
	iverilog -o $@ $^

full_adder_8bit: half_adder.v full_adder.v full_adder_8bit.v
	iverilog -o $@ $^

.PHONY: clean
clean:
	rm -f bcd2bin half_adder full_adder full_adder_8bit
