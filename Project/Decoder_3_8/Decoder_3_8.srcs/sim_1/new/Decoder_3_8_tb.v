`timescale 1ns / 1ns

module Decoder_3_8_tb ;
       
    // 1定义激励和输出
    reg s_a ;
    reg s_b ;
    reg s_c ;
    wire [7:0]s_out ;
    
    // 2放上模块
    Decoder_3_8 Decoder_3_8(
        // 端口列表
        .a(s_a) , 
        .b(s_b) , 
        .c(s_c) , 
        .out(s_out) 
    );
    
    // 3连线
    initial begin
        s_a = 0 ; s_b = 0 ; s_c = 0 ;
        #200;
        s_a = 0 ; s_b = 0 ; s_c = 1 ;
        #200;
        s_a = 0 ; s_b = 1 ; s_c = 0 ;
        #200;
        s_a = 0 ; s_b = 1 ; s_c = 1 ;
        #200;
        s_a = 1 ; s_b = 0 ; s_c = 0 ;
        #200;
        s_a = 1 ; s_b = 0 ; s_c = 1 ;
        #200;
        s_a = 1 ; s_b = 1 ; s_c = 0 ;
        #200;
        s_a = 1 ; s_b = 1 ; s_c = 1 ;
        #200;   
        $stop ;
    end

endmodule 