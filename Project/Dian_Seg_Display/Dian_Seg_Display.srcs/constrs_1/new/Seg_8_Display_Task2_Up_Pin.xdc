# 时钟引脚 clk
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]

# 使能引脚 Seg_Enable
set_property IOSTANDARD LVCMOS33 [get_ports Reset_n]
set_property PACKAGE_PIN J15 [get_ports Reset_n]


# 数码管使能引脚和七段+小数点引脚
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_LED[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg_EN[0]}]

set_property PACKAGE_PIN T10 [get_ports {Seg_LED[0]}]
set_property PACKAGE_PIN R10 [get_ports {Seg_LED[1]}]
set_property PACKAGE_PIN K16 [get_ports {Seg_LED[2]}]
set_property PACKAGE_PIN K13 [get_ports {Seg_LED[3]}]
set_property PACKAGE_PIN P15 [get_ports {Seg_LED[4]}]
set_property PACKAGE_PIN T11 [get_ports {Seg_LED[5]}]
set_property PACKAGE_PIN L18 [get_ports {Seg_LED[6]}]
set_property PACKAGE_PIN H15 [get_ports {Seg_LED[7]}]

set_property PACKAGE_PIN J17 [get_ports {Seg_EN[0]}]
set_property PACKAGE_PIN J18 [get_ports {Seg_EN[1]}]
set_property PACKAGE_PIN T9 [get_ports  {Seg_EN[2]}]
set_property PACKAGE_PIN J14 [get_ports {Seg_EN[3]}]
set_property PACKAGE_PIN P14 [get_ports {Seg_EN[4]}]
set_property PACKAGE_PIN T14 [get_ports {Seg_EN[5]}]
set_property PACKAGE_PIN K2 [get_ports  {Seg_EN[6]}]
set_property PACKAGE_PIN U13 [get_ports {Seg_EN[7]}]

