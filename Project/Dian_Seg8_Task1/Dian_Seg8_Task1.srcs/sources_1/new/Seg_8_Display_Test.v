`timescale 1ns / 1ps

module Seg_8_Display_Test(
        clk ,
        Reset_n ,
        Seg_EN ,
        Seg_LED
    );
    // 引脚定义
    input clk ;
    input Reset_n ;
    output [7:0]  Seg_EN ;       // 数码管使能引脚,位选
    output [7:0] Seg_LED ;       // 数码管段选
    
    // 逻辑
    Seg8_Display(
        .clk(clk) ,
        .Reset_n(Reset_n) ,
        .Display_Data(32'h12345678) ,
        .Seg_EN(Seg_EN) ,
        .Seg_LED(Seg_LED)
    );
    
    
endmodule
