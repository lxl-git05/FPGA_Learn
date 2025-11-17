`timescale 1ns / 1ns

module Seg_8_Display_tb;
    // 引脚
    reg clk ;
    reg Reset_n ;
    reg [31:0] Display_Data ; // 数码管展示的数据
    wire [7:0] Seg_EN ;       // 数码管使能引脚,位选
    wire [7:0] Seg_LED ;      // 数码管段选
    
    // 绑定引脚
    Seg8_Display Seg8_Display_1(
        .clk(clk) ,
        .Reset_n(Reset_n) ,
        .Display_Data(Display_Data) ,
        .Seg_EN(Seg_EN) ,
        .Seg_LED(Seg_LED)
    );
    
    // 编写仿真逻辑
    initial begin 
        clk = 0 ;
        Reset_n = 0 ;
        #21
        Reset_n = 1 ;
        Display_Data = 32'h1234abcd ;
        #2000000 ;
        $stop ;
    end
    
    always #10 clk = !clk ;
endmodule
