module Seg_8_Display_Task2_Up(
        clk ,
        Reset_n ,
        Seg_EN  ,
        Seg_LED
    );
    // 引脚定义
    input clk ;
    input Reset_n ;
    output [7:0]  Seg_EN ;       // 数码管使能引脚,位选
    output [7:0] Seg_LED ;       // 数码管段选
    
    // 逻辑编写: 计时器定时展示四个字符
    reg [31:0] Seg_Display ;    // 数码管展示字符
    reg [35:0] cnt ;            // 计时器
    // 定时器
    always @(posedge clk or negedge Reset_n)
    if (!Reset_n) begin
        cnt <= 0;
    end
    else if (cnt == 400_000_000 - 1)    // 100_000_000 -> 1s
        cnt <= 0;
    else
        cnt <= cnt + 1;
    // 定时显示字符
    always @(*) begin
        if (cnt < 100_000_000 && cnt > 0)
            Seg_Display = 32'hffff_ffc1;  // hi
        else if (cnt < 200_000_000 && cnt > 100_000_000)
            Seg_Display = 32'hffff_caca;  // haha
        else if (cnt < 300_000_000 && cnt > 200_000_000)
            Seg_Display = 32'hfffc_eddb;  // hello
        else
            Seg_Display = 32'hfffc_ecea;  // hehea
    end
    // 数码管显示
    Seg8_Display Seg8_Display_Up_1(
        .clk(clk) ,
        .Reset_n(Reset_n) ,
        .Display_Data(Seg_Display) ,
        .Seg_EN(Seg_EN) ,
        .Seg_LED(Seg_LED)
    );
    
    
endmodule
