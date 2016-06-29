# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {adder_1bit.sv adder_nbit.sv adder_16bit.sv}
elaborate adder_16bit -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/adder_16bit.rep
report_area >> reports/adder_16bit.rep
report_power -hier >> reports/adder_16bit.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/adder_16bit.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
