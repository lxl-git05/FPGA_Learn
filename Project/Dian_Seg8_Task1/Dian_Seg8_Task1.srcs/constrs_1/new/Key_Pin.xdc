# 时钟引脚 clk
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]

# 使能引脚 Seg_Enable
set_property IOSTANDARD LVCMOS33 [get_ports Reset_n]
set_property PACKAGE_PIN J15 [get_ports Reset_n]

# 按键
set_property IOSTANDARD LVCMOS33 [get_ports Sw_1]
set_property PACKAGE_PIN P17 [get_ports Sw_1]

# LED
set_property IOSTANDARD LVCMOS33 [get_ports LED]
set_property PACKAGE_PIN K15 [get_ports LED]
