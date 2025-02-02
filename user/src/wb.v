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
    assign address = 4'b0 & ram_addr;
    
    //wb counter
    reg [1:0]  count;
    reg [1:0]  count_next;

    //result buffer
    reg [17:0] result [2:0];
    reg [17:0] result_next [2:0];

    //dataRAM and ram enable signal
    assign ram_en  =(wb_state==wb_start) ? 1'b1:1'b0;
    assign dataRAM[31:18] = 14'b0;
    assign dataRAM =(wb_state == wb_start) ? MU1 :result[count];

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        //RAM [0]     <= 1'b0;
        count       <= 2'b0;
        ram_addr    <= 4'b0;
        //count_wb    <= 2'b0;
        wb_state    <= 1'b0;
        result [0]  <= 17'b0;
        result [1]  <= 17'b0;
        result [2]  <= 17'b0;
    end
    else begin
        //update result register
        result [0] <= result_next[0];
        result [1] <= result_next[1];
        result [2] <= result_next[2];
        //update state
        wb_state  <= wb_next;
        count     <= count_next;
        ram_addr  <= ram_addr_next;

    end
end

always @(*) begin
    //RAM_next[0] = RAM[0];
    wb_next    = wb_state;
    count_next = count ;
    ram_addr_next = ram_addr;
    result_next[0] = result[0];
    result_next[1] = result[1];
    result_next[2] = result[2];
    case(wb_state)                                   
        wb_IDLE :begin
            wb_next = (web == 1'b1) ? wb_start:wb_IDLE;//if web = 1 start wb
            if(web == 1'b1) begin
                //RAM_next[ram_addr]  = MU1;
                count_next = 0;
                result_next[0] = MU2;
                result_next[1] = MU3;
                result_next[2] = MU4;
                
                ram_addr_next = ram_addr_next+1'b1;
            end
        end
            
        wb_start :begin
            count_next = count_next+ 1'b1;
            ram_addr_next = ram_addr_next + 1'b1;
            wb_next = (count == 2'd3 ) ? wb_IDLE:wb_start;//if count=3 end wb
        end

        default  :begin 
            wb_next = wb_IDLE;//default IDLE
        end

    endcase 
end

endmodule