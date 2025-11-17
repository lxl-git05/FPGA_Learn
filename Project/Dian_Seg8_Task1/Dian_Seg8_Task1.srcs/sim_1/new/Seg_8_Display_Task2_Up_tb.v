`timescale 1ns / 1ns

module Seg_8_Display_Task2_Up_tb;
    // 引脚
    reg clk ;
    reg Reset_n ;
    wire [7:0] Seg_EN ;       // 数码管使能引脚,位选
    wire [7:0] Seg_LED ;      // 数码管段选
    
    // 绑定引脚
    Seg_8_Display_Task2_Up Seg_8_Display_Task2_Up_tb_1(
        .clk(clk) ,
        .Reset_n(Reset_n) ,
        .Seg_EN(Seg_EN)  ,
        .Seg_LED(Seg_LED)
    );
    
    // 编写仿真逻辑
    initial begin 
        clk = 0 ;
        Reset_n = 0 ;
        #21
        Reset_n = 1 ;
        #2000_000_000 ;
        $stop ;
    end
    
    always #10 clk = !clk ;
endmodule
