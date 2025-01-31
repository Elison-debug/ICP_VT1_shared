module controller(
    input  clk,
    input  rst,
    input  ram_done,
    input  row_done,
    input  start_in,
    input  xload_done,
    input  aload_done,
    input  arithmetic_done,
    input  [2:0] count_mul,

    output input_load_en,
    output rom_start,
    output ALU_en,
    output ram_en,
    output web,
    output finish
);  
    //state
    reg [1:0] current_state;
    reg [1:0] state_next;
    //counter

    reg [1:0] count_col;
    reg [1:0] count_col_next;

    //wb en
    reg web_r;
    assign web = web_r;
    //input en 
    reg input_load_en_r;
    assign input_load_en=input_load_en_r;

    //output    
    reg    finish_next;
    assign finish = finish_next;

    //FSM state
    parameter IDLE = 2'b00;
    parameter shift_input = 2'b01;
    parameter multiply= 2'b10;
    parameter next_col = 2'b11;


always @(posedge clk or negedge rst) begin
    if(!rst) begin
        web_r <= 1'b0;
        //reset counter
        count_col   <= 2'b0;
        
        //reset state
        current_state <= 2'b0;
    end
    else begin
        //update state
        current_state <= state_next;
        //update counter
        count_col   <= count_col_next;
        
    end
end

//FSM for calculate
always @(*) begin
    state_next = current_state;
    //update state
    case (current_state) 
        IDLE        : state_next = (start_in   == 1'b1 ) ? shift_input:IDLE;//if start_in = 1 start shift
        shift_input : state_next = (xload_done && aload_done == 5'd31) ? multiply:shift_input;//if finish both A and X matrix input then start multiply
        multiply    : state_next = (count_mul == 3'd7 ) ? shift_input:IDLE;//if count_mul = 8 start next_col
        next_col    : state_next = (count_col == 2'd3 ) ? IDLE:multiply;   //if count_col = 3 go IDLE, else back to multiply next col
        default     : state_next = IDLE;//default IDLE
    endcase
end

//
always @(*) begin
    count_col_next = count_col;
    case(current_state)                                   
        IDLE :begin
            finish_next  = 1'b0;
            count_col_next = 2'b0;
        end
            
        shift_input :begin
            input_load_en_r = 1'b1;
        end
            
        multiply :begin 
            input_load_en_r = 1'b0;
        end
            
        next_col : begin

        end
    endcase 
end

endmodule