`timescale 1ns / 1ns

module Seg_8_Display_tb;
    // 引脚声明
    reg clk;
    reg Reset_n;
    reg  [31:0] Display_Data;   // 仿真需要展示的数据
    wire [7:0]  Seg_EN ;        // 位选
    wire [7:0]  Seg_LED ;       // 段选

    // 例化
    Seg8_Display Seg_8_Display_1(
        .clk(clk) ,
        .Reset_n(Reset_n)  ,
        .Display_Data(Display_Data)  ,
        .Seg_EN(Seg_EN)  ,
        .Seg_LED(Seg_LED) 
    );

    // 仿真逻辑
    initial begin
        clk = 0;
        Reset_n = 0;
        Display_Data = 32'hffff_ffff;
        #100 Reset_n = 1;
        Display_Data = 32'h1234_5678;
        # 1000_000_000 ;
        $stop;
    end 

    always #5 clk = ~clk;   // 100MHz频率,所以5ns翻转一次

endmodule