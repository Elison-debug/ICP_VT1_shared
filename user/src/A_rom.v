module A_rom(
    input  clk,
    input  rst,

    input  [3:0]  rom_addr,
    output [13:0] A_input
);

    parameter num_1_1 = 7'b1100011;
    parameter num_2_1 = 7'b1000000;
    parameter num_3_1 = 7'b0110110;
    parameter num_4_1 = 7'b1001110;
    parameter num_5_1 = 7'b1101101;
    parameter num_6_1 = 7'b1010101;
    parameter num_7_1 = 7'b1000011;
    parameter num_8_1 = 7'b0100110;

    parameter num_1_2 = 7'b1011010;
    parameter num_2_2 = 7'b0110000;
    parameter num_3_2 = 7'b1001000;
    parameter num_4_2 = 7'b1110001;
    parameter num_5_2 = 7'b1101011;
    parameter num_6_2 = 7'b1110011;
    parameter num_7_2 = 7'b1111000;
    parameter num_8_2 = 7'b1101000;

    parameter num_1_3 = 7'b0000000;
    parameter num_2_3 = 7'b0000000;
    parameter num_3_3 = 7'b0001011;
    parameter num_4_3 = 7'b0100001;
    parameter num_5_3 = 7'b0000010;
    parameter num_6_3 = 7'b0110110;
    parameter num_7_3 = 7'b0101011;
    parameter num_8_3 = 7'b1000101;

    parameter num_1_4 = 7'b1110110;
    parameter num_2_4 = 7'b0100110;
    parameter num_3_4 = 7'b0101011;
    parameter num_4_4 = 7'b1101110;
    parameter num_5_4 = 7'b0101011;
    parameter num_6_4 = 7'b0010001;
    parameter num_7_4 = 7'b1000000;
    parameter num_8_4 = 7'b1101101;

    reg [13:0] rom_out;
    reg [13:0] rom_out_next;
    assign A_input = rom_out;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rom_out <= 14'b0;
    end
    else begin
       rom_out <= rom_out_next;
    end
end

always @(*) begin
    case (rom_addr)
        //column 1
        4'b0000 : rom_out_next = {num_1_1 , num_2_1};
        4'b0001 : rom_out_next = {num_3_1 , num_4_1};
        4'b0010 : rom_out_next = {num_5_1 , num_6_1};
        4'b0011 : rom_out_next = {num_7_1 , num_8_1};
        //column 2
        4'b0100 : rom_out_next = {num_1_2 , num_2_2};
        4'b0101 : rom_out_next = {num_3_2 , num_4_2};
        4'b0110 : rom_out_next = {num_5_2 , num_6_2};
        4'b0111 : rom_out_next = {num_7_2 , num_8_2};
        //column 3
        4'b1000 : rom_out_next = {num_1_3 , num_2_3};
        4'b1001 : rom_out_next = {num_3_3 , num_4_3};
        4'b1010 : rom_out_next = {num_5_3 , num_6_3};
        4'b1011 : rom_out_next = {num_7_3 , num_8_3};
        //column 4
        4'b1100 : rom_out_next = {num_1_4 , num_2_4};
        4'b1101 : rom_out_next = {num_3_4 , num_4_4};
        4'b1110 : rom_out_next = {num_5_4 , num_6_4};
        4'b1111 : rom_out_next = {num_7_4 , num_8_4};
        default : rom_out_next = 14'b0;
    endcase
end

endmodule
