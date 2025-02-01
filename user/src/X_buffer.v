module X_buffer(
    input  clk,
    input  rst,
    input  valid_input,
    input  input_load_en,
    input  [7:0] X_load,//iniput data
    //input  ram_en,
    input  X_shift,
    
    output [63:0] X_reg1,
    output [63:0] X_reg2,
    output [63:0] X_reg3,
    output [63:0] X_reg4,
    output xload_done
);
    //counter
    reg [4:0] count;
    reg [4:0] count_next;

    reg [1:0] count_shift;
    reg [1:0] count_shift_next;

    // four X buffer
    reg [63:0] s_reg1;
    reg [63:0] s_reg2;
    reg [63:0] s_reg3;
    reg [63:0] s_reg4;

    reg [63:0] s_reg1_next;
    reg [63:0] s_reg2_next;
    reg [63:0] s_reg3_next;
    reg [63:0] s_reg4_next;
    
    // X buffer output
    assign x_reg1 = s_reg1;
    assign x_reg2 = s_reg2;
    assign x_reg3 = s_reg3;
    assign x_reg4 = s_reg4;
    //load done flag
    assign xload_done = (count == 5'd31)? 1'b1:1'b0;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        count       <= 4'b0;
        count_shift <= 2'b0;
    end
    else begin
        //update counter
        count       <= count_next;
        count_shift <= count_shift_next;
        s_reg1      <= s_reg1_next;
        s_reg2      <= s_reg2_next;
        s_reg3      <= s_reg3_next;
        s_reg4      <= s_reg4_next;
    end
end

//shift buffer
always @(*) begin
    count_next     = count;
    s_reg1_next    = s_reg1;
    s_reg2_next    = s_reg2;
    s_reg3_next    = s_reg3;
    s_reg4_next    = s_reg4;
    count_shift_next = count_shift;

    if(input_load_en && valid_input)begin
        case(count_shift)
        2'b00 : s_reg1_next = s_reg1_next<<8 & X_load ;
        2'b01 : s_reg2_next = s_reg2_next<<8 & X_load ;
        2'b10 : s_reg3_next = s_reg3_next<<8 & X_load ;
        2'b11 : s_reg4_next = s_reg4_next<<8 & X_load ;
        //default
        endcase
        count_next       = count_next + 1'b1; 
        count_shift_next = count_shift_next + 1'b1;
    end
    else if(X_shift) begin
        s_reg1_next = s_reg1_next<<8 & s_reg1_next[63:56];
        s_reg2_next = s_reg2_next<<8 & s_reg1_next[63:56];
        s_reg3_next = s_reg3_next<<8 & s_reg1_next[63:56];
        s_reg4_next = s_reg4_next<<8 & s_reg1_next[63:56];
    end
end


endmodule