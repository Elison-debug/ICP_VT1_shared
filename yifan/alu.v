// Assume that there's 9 multiplexer available. 
module alu(
    input clk,
    input rst, 
    input ALU_en, 
    input [71:0] filter,        // 3*3 input filter.   a b c 
    input [23:0] line1,         //                     d e f 
    input [23:0] line2,         //                     g h i
    input [23:0] line3,

    output [19:0] result,       // Convolutional result.  
    output reg wb,
    output reg alu_done

);
    reg wb_next; 
    reg [15:0] product_1, product_1_next ;
    reg [15:0] product_2, product_2_next ; 
    reg [15:0] product_3, product_3_next;
    reg [15:0] product_4, product_4_next;
    reg [15:0] product_5, product_5_next;
    reg [15:0] product_6, product_6_next;
    reg [15:0] product_7, product_7_next;
    reg [15:0] product_8, product_8_next;
    reg [15:0] product_9, product_9_next;
    reg [16:0] sum1, sum2, sum3, sum4;
    reg [17:0] sum5, sum6, sum7;  
    reg [18:0] sum8, sum9; 
    reg [19:0] sum10;    
    reg alu_done_next;   

    always @(posedge clk or negedge rst) begin 
        if (rst) begin 
            product_1 <= 0; product_2 <= 0; product_3 <= 0; product_4 <= 0; product_5 <= 0; 
            product_6 <= 0; product_7 <= 0; product_8 <= 0; product_9 <= 0; wb <= 0; alu_done <= 0; 
        end
        else begin 
            wb <= wb_next; 
            product_1 <= product_1_next;
            product_2 <= product_2_next;
            product_3 <= product_3_next;
            product_4 <= product_4_next;
            product_5 <= product_5_next; 
            product_6 <= product_6_next;
            product_7 <= product_7_next;
            product_8 <= product_8_next;
            product_9 <= product_9_next;
            alu_done  <= alu_done_next; 
        end
    end

    always @(*) begin
        sum1 = product_1 + product_2;
        sum2 = product_3 + product_4;
        sum3 = product_5 + product_6;
        sum4 = product_7 + product_8;
        sum5 = sum1 + sum2;
        sum6 = sum3 + sum4;
        sum7 = sum5 + sum6;
        sum8 = sum7 + product_9;
        if (ALU_en) begin 
            wb_next = 1; 
            product_1_next = filter[7:0]  *line1[7:0];
            product_2_next = filter[15:8] *line1[15:8];
            product_3_next = filter[23:16]*line1[23:16];
            product_4_next = filter[31:24]*line2[7:0];
            product_5_next = filter[39:32]*line2[15:8];
            product_6_next = filter[47:40]*line2[23:16];
            product_7_next = filter[55:48]*line3[7:0];
            product_8_next = filter[63:56]*line3[15:8];
            product_9_next = filter[71:64]*line3[23:16];
            alu_done_next = 1; 
        end
        else begin 

            product_1_next = 0; product_2_next = 0; product_3_next = 0; product_4_next = 0; product_5_next = 0; 
            product_6_next = 0; product_7_next = 0; product_8_next = 0; product_9_next = 0; wb_next = 1; 
        end             

    end
    
endmodule //ALU


