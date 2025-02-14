module wb(
    input  clk,
    input  rst,
    input  web,
    input  [17:0] MU1,
    input  [17:0] MU2,
    input  [17:0] MU3,
    input  [17:0] MU4,

    output ram_en,
    output [7:0]  address,
    output [31:0] dataRAM
);
    //state
    reg wb_next;
    reg wb_state;

    parameter wb_IDLE  = 1'b0;
    parameter wb_start = 1'b1;

    //ram address
    reg [3:0] ram_addr;
    reg [3:0] ram_addr_next;
    assign address = {4'b0 , ram_addr};

    //result buffer
    reg [17:0] result [2:0];
    reg [17:0] result_next [2:0];

    //dataRAM and ram enable signal
    wire [1:0] count;
    assign count = ram_addr[1:0];
    assign dataRAM[31:18] = 14'b0;
    assign dataRAM[17: 0] = wb_state ? MU1 : result[count-2'b1];//(wb_state == wb_start) but wb_start=1
    assign ram_en = wb_state||web;//(wb_state == wb_start) but wb_start=1

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        ram_addr    <= 4'b0;
        result [0]  <= 17'b0;
        result [1]  <= 17'b0;
        result [2]  <= 17'b0;
        wb_state    <= wb_IDLE;
    end
    else begin
        //update result register
        result [0] <= result_next[0];
        result [1] <= result_next[1];
        result [2] <= result_next[2];
        //update state
        wb_state  <= wb_next;
        ram_addr  <= ram_addr_next;

    end
end

always @(*) begin
    wb_next = wb_state;
    ram_addr_next  = web ? ram_addr + 4'b1 : ram_addr; //if ram en then count else wait
    result_next[0] = web ? MU2 : result[0];
    result_next[1] = web ? MU3 : result[1];
    result_next[2] = web ? MU4 : result[2];
    case(wb_state)                                   
        wb_IDLE  : wb_next = web ? wb_start : wb_IDLE;//if web = 1 start wb            
        wb_start : wb_next = (count == 2'b00) ? wb_start : wb_IDLE;//if web = 1 start wb
    endcase 
end

endmodule