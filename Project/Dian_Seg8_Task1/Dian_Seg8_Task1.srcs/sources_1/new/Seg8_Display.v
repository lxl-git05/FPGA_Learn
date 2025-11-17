// 数码管展示字符函数
module Seg8_Display(
        clk ,
        Reset_n ,
        Display_Data ,
        Seg_EN ,
        Seg_LED
    );
    // 引脚定义
    input clk ;
    input Reset_n ;
    input [31:0] Display_Data ;       // 8位数码管展示的总内容
    output reg [7:0]  Seg_EN ;       // 数码管使能引脚,位选
    output reg [7:0] Seg_LED ;       // 数码管段选
    // 逻辑书写
    // 扫描编号
    reg [2:0] Seg_num ;
    // 定时计数器
    reg [27:0] cnt ;
    // 1. 统一同步块：计数器 + Seg_num + Seg_EN
    always @(posedge clk or negedge Reset_n)
        if (!Reset_n) begin
            cnt     <= 0 ;
            Seg_num <= 0 ;
            Seg_EN  <= 8'b1111_1111 ;
        end
        else begin
            // 计数器
            if (cnt == 50_000 - 1) begin      // 1ms
                cnt     <= 0 ;
                Seg_num <= Seg_num + 1'b1 ;   // 下一位
            end
            else
                cnt <= cnt + 1'b1 ;
            
            // 位选（低有效）
            case(Seg_num)
                3'd0 :  Seg_EN <= 8'b1111_1110 ;
                3'd1 :  Seg_EN <= 8'b1111_1101 ;
                3'd2 :  Seg_EN <= 8'b1111_1011 ;
                3'd3 :  Seg_EN <= 8'b1111_0111 ;
                3'd4 :  Seg_EN <= 8'b1110_1111 ;
                3'd5 :  Seg_EN <= 8'b1101_1111 ;
                3'd6 :  Seg_EN <= 8'b1011_1111 ;
                3'd7 :  Seg_EN <= 8'b0111_1111 ;
                default: Seg_EN <= 8'b1111_1111 ;
            endcase
        end    
    // 2. 字符选择 , 四位 , 从32位输入中取
    reg [3:0] Seg_Display ;
    always @(posedge clk or negedge Reset_n)
        if (!Reset_n)
            Seg_Display <= 0 ;
        else 
            case(Seg_num)
                3'd0 : Seg_Display <= Display_Data[ 3: 0] ;
                3'd1 : Seg_Display <= Display_Data[ 7: 4] ;
                3'd2 : Seg_Display <= Display_Data[11: 8] ;
                3'd3 : Seg_Display <= Display_Data[15:12] ;
                3'd4 : Seg_Display <= Display_Data[19:16] ;
                3'd5 : Seg_Display <= Display_Data[23:20] ;
                3'd6 : Seg_Display <= Display_Data[27:24] ;
                3'd7 : Seg_Display <= Display_Data[31:28] ;
                default : Seg_Display <= 4'd0 ;
            endcase 
    // 3. 数码管展示数据
    always @(posedge clk or negedge Reset_n)
        if (!Reset_n)
            Seg_LED <= 8'b1111_1111 ;
        else 
            case (Seg_Display)
                4'h0 : Seg_LED <= 8'b1100_0000; // 0
                4'h1 : Seg_LED <= 8'b1111_1001; // 1
                4'h2 : Seg_LED <= 8'b1010_0100; // 2
                4'h3 : Seg_LED <= 8'b1011_0000; // 3
                4'h4 : Seg_LED <= 8'b1001_1001; // 4
                4'h5 : Seg_LED <= 8'b1001_0010; // 5
                4'h6 : Seg_LED <= 8'b1000_0010; // 6
                4'h7 : Seg_LED <= 8'b1111_1000; // 7
                4'h8 : Seg_LED <= 8'b1000_0000; // 8
                4'h9 : Seg_LED <= 8'b1001_0000; // 9
                4'hA : Seg_LED <= 8'b1000_1000;   // A
                4'hB : Seg_LED <= 8'b1010_0011;   // o
                4'hC:  Seg_LED <= 8'b1000_1001;   // H
                4'hD:  Seg_LED <= 8'b1100_0111;   // L
                4'hE : Seg_LED <= 8'b1000_0110;   // E
                default : Seg_LED <= 8'b1111_1111; // 不显示
            endcase
endmodule

// hello : fffc_eddb
// hi    : ffff_ffc1
// haha  : ffff_caca
// hehea : fffc_ecea


