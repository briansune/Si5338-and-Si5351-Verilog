
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property IOSTANDARD LVCMOS15 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[0]}]
set_property PACKAGE_PIN K12 [get_ports {leds[7]}]
set_property PACKAGE_PIN L12 [get_ports {leds[6]}]
set_property PACKAGE_PIN J10 [get_ports {leds[5]}]
set_property PACKAGE_PIN J11 [get_ports {leds[4]}]
set_property PACKAGE_PIN K11 [get_ports {leds[3]}]
set_property PACKAGE_PIN K10 [get_ports {leds[2]}]
set_property PACKAGE_PIN J8 [get_ports {leds[1]}]
set_property PACKAGE_PIN J9 [get_ports {leds[0]}]

set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]
set_property PACKAGE_PIN D9 [get_ports sys_clk_p]
create_clock -period 5.000 -name sys_clk_p -waveform {0.000 2.500} [get_ports sys_clk_p]

set_property PACKAGE_PIN A7 [get_ports sys_nrst]
set_property IOSTANDARD LVCMOS15 [get_ports sys_nrst]

set_property PACKAGE_PIN P28 [get_ports SCL]
set_property IOSTANDARD LVCMOS33 [get_ports SCL]
set_property IOSTANDARD LVCMOS33 [get_ports SDA]
set_property PACKAGE_PIN N28 [get_ports SDA]

set_property IOSTANDARD LVCMOS33 [get_ports se_clk0]
set_property PACKAGE_PIN AA18 [get_ports se_clk0]
set_property IOSTANDARD LVCMOS33 [get_ports se_clk1]
set_property PACKAGE_PIN U26 [get_ports se_clk1]
set_property PACKAGE_PIN W8 [get_ports si5338_clk0_p]
set_property PACKAGE_PIN AC8 [get_ports si5338_clk2_p]