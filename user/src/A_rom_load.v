module A_rom_load(
    input  clk,
    input  rst,

    output w_addr,
    output aload_done,
    output [13:0] dataROM
);
    parameter num_1_1 = 7'd1; //format :row_col
    parameter num_2_1 = 7'd2; //column 1
    parameter num_3_1 = 7'd3;
    parameter num_4_1 = 7'd4;
    parameter num_5_1 = 7'd5;
    parameter num_6_1 = 7'd6;
    parameter num_7_1 = 7'd7;
    parameter num_8_1 = 7'd8;

    parameter num_1_2 = 7'd1; //column 2
    parameter num_2_2 = 7'd1;
    parameter num_3_2 = 7'd1;
    parameter num_3_2 = 7'd1;
    parameter num_4_2 = 7'd1;
    parameter num_5_2 = 7'd1;
    parameter num_6_2 = 7'd1;
    parameter num_7_2 = 7'd1;

    parameter num_1_3 = 7'd1; //column 3
    parameter num_2_3 = 7'd1;
    parameter num_3_3 = 7'd1;
    parameter num_3_3 = 7'd1;
    parameter num_4_3 = 7'd1;
    parameter num_5_3 = 7'd1;
    parameter num_6_3 = 7'd1;
    parameter num_7_3 = 7'd1;

    parameter num_1_4 = 7'd1; //column 4
    parameter num_2_4 = 7'd1;
    parameter num_3_4 = 7'd1;
    parameter num_3_4 = 7'd1;
    parameter num_4_4 = 7'd1;
    parameter num_5_4 = 7'd1;
    parameter num_6_4 = 7'd1;
    parameter num_7_4 = 7'd1;
    
    reg [3:0]  counter;
    reg [3:0]  counter_next;
    reg [13:0] dataROM_r;
    reg [13:0] dataROM_next;

    reg aload_done_r;
    
    assign w_addr     = counter; 
    assign dataROM    = dataROM_r;
    assign aload_done = aload_done_r;

//reset and update counter and rom
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        counter   <= 4'b0;
        dataROM_r <= 14'b0;
    end
    else begin
        dataROM_r = dataROM_next;
        counter   = counter_next;
    end
end

//calculate counter and data rom
always @(*) begin
    counter_next = counter;
    dataROM_next = dataROM_r;
    if(counter != 4'b15)begin
        counter_next = counter + 1'b1;
        case (counter)
            //column 1
            4'b0000 : dataROM_next = num_1_1 & num_2_1;
            4'b0001 : dataROM_next = num_3_1 & num_4_1;
            4'b0010 : dataROM_next = num_5_1 & num_6_1;
            4'b0011 : dataROM_next = num_7_1 & num_8_1;
            //column 1
            4'b0100 : dataROM_next = num_1_2 & num_2_2;
            4'b0101 : dataROM_next = num_3_2 & num_4_2;
            4'b0110 : dataROM_next = num_5_2 & num_6_2;
            4'b0111 : dataROM_next = num_7_2 & num_8_2;
            //column 1
            4'b1000 : dataROM_next = num_1_3 & num_2_3;
            4'b1001 : dataROM_next = num_3_3 & num_4_3;
            4'b1010 : dataROM_next = num_5_3 & num_6_3;
            4'b1011 : dataROM_next = num_7_3 & num_8_3;
            //column 1
            4'b1100 : dataROM_next = num_1_4 & num_2_4;
            4'b1101 : dataROM_next = num_3_4 & num_4_4;
            4'b1110 : dataROM_next = num_5_4 & num_6_4;
            4'b1111 : dataROM_next = num_7_4 & num_8_4;
            
            default : dataROM_next = 14'b0;
        endcase
    end  
    else begin 
        aload_done_r = 1'b1;
    end
end

endmodule