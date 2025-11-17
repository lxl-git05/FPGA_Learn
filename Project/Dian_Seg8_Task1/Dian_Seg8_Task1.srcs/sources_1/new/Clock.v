// 数字钟
/*
要求:
1. 显示小时 , 分钟 , 秒钟 , 都使用数码管:从00:00:00开始
2. 能调整小时,分钟的时间:3-8译码器调整时间
*/
module Clock(
        clk ,
        Reset_n ,
        Key1 ,
        Key2 ,
        Key3,
        Seg_EN  ,
        Seg_LED
    );
    // 引脚定义
    input clk ;
    input Reset_n ;
    input Key1 ;             // 按键调控时间
    input Key2 ;             // 按键调控时间
    input Key3 ;             // 按键调控小时进制
    output [7:0]  Seg_EN ;       // 数码管使能引脚,位选
    output [7:0]  Seg_LED ;      // 数码管段选
    
    // 逻辑
    // 1. 小时进制调节
    reg Hour_Style ;
    always @(posedge clk or negedge Reset_n)
    if (!Reset_n) begin
        Hour_Style <= 0 ;
    end
    else if (Key3 == 0)
        Hour_Style <= 0 ;   // 默认进制:24进制
    else if (Key3 == 1)
        Hour_Style <= 1 ;   // 第2种进制:12进制
    
    // 2. 定时器->1s周期 + 秒针 + 时针 + 分针
    reg [35:0] cnt ;
    reg [7:0] cnt_s ;   // 秒针
    reg [7:0] cnt_m ;   // 分针
    reg [7:0] cnt_h ;   // 时针
    // 按键参数
    reg  Key1_Before ;  // 按键上次状态
    reg  Key1_Now ;     // 按键本次状态
    reg  Key2_Before ;  // 按键上次状态
    reg  Key2_Now ;     // 按键本次状态
    // 定时器
    always @(posedge clk or negedge Reset_n)
    if (!Reset_n) begin
        cnt   <= 0 ;
        cnt_s <= 0 ;
        cnt_m <= 0 ;
        cnt_h <= 0 ;
        Key1_Before <= 0 ;
        Key1_Now <= 0 ;
        Key2_Before <= 0 ;
        Key2_Now <= 0 ;
    end
    else if (cnt == 100_000_000 - 1) begin    // 100_000_000 -> 1s
        cnt <= 0;               // 再次计数
        cnt_s <= cnt_s + 1 ;    // 秒针+1
    end
    else if (cnt_s == 8'd60) begin 
            cnt_s <= 0 ;        // 一分钟,秒针清零
            cnt_m <= cnt_m + 1 ;//分针+1
    end
    else if (cnt_m == 8'd60) begin 
            cnt_m <= 0 ;    // 60min(1h),分针清零
            cnt_h <= cnt_h + 1 ;    // 时针+1
    end
    else if (cnt_h == 8'd24)
        cnt_h <= 0 ;    // 满24h,清零
    else begin 
        cnt <= cnt + 1;
        // 按键1状态记录
        Key1_Before <= Key1_Now ;
        Key1_Now <= Key1 ;
        // 按键2状态记录
        Key2_Before <= Key2_Now ;
        Key2_Now <= Key2 ;
        // 按键状态判断
        if (Key1_Before != Key1_Now)
            cnt_m <= cnt_m + 1 ;
        if (Key2_Before != Key2_Now)
            cnt_h <= cnt_h + 1 ;
    end
    
    // 3. 数码管显示
    reg [31:0] Display_Data ;
    always @(posedge clk or negedge Reset_n)
    if (!Reset_n) begin
        Display_Data <= 32'hffff_ffff;
    end
    else begin
        // 秒针
        Display_Data[3:0] = cnt_s % 10 ;
        Display_Data[7:4] = cnt_s / 10 ;
        // 分针
        Display_Data[11: 8] = cnt_m % 10 ;
        Display_Data[15:12] = cnt_m / 10 ;
        // 时针,进行进制转换
        if (Hour_Style == 0) begin 
            Display_Data[19:16] = cnt_h % 10 ;
            Display_Data[23:20] = cnt_h / 10 ;
        end
        else if (Hour_Style == 1)begin 
            if (cnt_h < 12) begin 
                Display_Data[19:16] = cnt_h % 10 ;
                Display_Data[23:20] = cnt_h / 10 ;
            end
            else if (cnt_h == 12) begin 
                Display_Data[19:16] = 2 ;
                Display_Data[23:20] = 1 ;
             end
            else begin 
                Display_Data[19:16] = (cnt_h - 12) % 10 ;
                Display_Data[23:20] = (cnt_h - 12) / 10 ;
            end
        end
    end
    Seg8_Display Seg8_Display_Clock_1(
        .clk(clk) ,
        .Reset_n(Reset_n) ,
        .Display_Data(Display_Data) ,
        .Seg_EN(Seg_EN) ,
        .Seg_LED(Seg_LED)
    );
endmodule
