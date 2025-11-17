module Key(
    input clk,
    input Reset_n,
    input Sw_1,      // 按键输入，低有效
    output reg LED   // LED 输出
);

always @(posedge clk or negedge Reset_n) begin
    if (!Reset_n) 
        LED <= 1'b0;           // 异步复位，LED 熄灭
    else if (Sw_1 == 1'b0)     
        LED <= 1'b1;           // 按下 LED 点亮
    else
        LED <= 1'b0;           // 松开 LED 熄灭
end

endmodule
