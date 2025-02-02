module controller(
    input  clk,
    input  rst,
    input  start_in,
    input  ALU_done,
    input  xload_done,
    input  aload_done,
    input  [2:0] count_mul,

    output input_load_en,
    output ALU_en,
    output finish
);  
    //FSM state
    parameter IDLE = 2'b00;
    parameter shift_input = 2'b01;
    parameter multiply= 2'b10;
    parameter next_col = 2'b11;
    
    //state
    reg [1:0] current_state;
    reg [1:0] state_next;

    //counter
    reg [1:0] count_col;
    reg [1:0] count_col_next;

    //enable signal
    assign ALU_en=(current_state == multiply) ? 1'b1 : 1'b0;
    assign input_load_en=(current_state == shift_input) ? 1'b1 : 1'b0;;

    //finish output    
    assign finish = ALU_done;



always @(posedge clk or negedge rst) begin
    if(!rst) begin
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
    count_col_next = count_col;
    state_next = current_state;
    //update state
    case (current_state) 
        IDLE        : begin state_next = (start_in   == 1'b1 ) ? shift_input:IDLE; count_col_next  = 2'b0; end//if start_in = 1 start shift
        shift_input : state_next = (xload_done && aload_done) ? multiply:shift_input;//if finish both A and X matrix input then start multiply
        multiply    : state_next = (count_mul == 3'd7 ) ? next_col:multiply;//if count_mul = 8 start next_col
        next_col    : begin state_next = (count_col == 2'd3 ) ? IDLE:multiply; count_col_next = count_col + 1'b1; end //if count_col = 3 go IDLE, else back to multiply next col
        default     : state_next = IDLE;//default IDLE
    endcase
end

//control signal
// always @(*) begin
//     count_col_next = count_col;

//     case(current_state)                                   
//         IDLE :begin
//             count_col_next  = 2'b0;

//         end
            
//         shift_input :begin

//         end
            
//         multiply :begin 

//         end
            
//         next_col : begin
//             count_col_next = count_col + 1'b1;
//         end

//         default : begin
//             state_next = IDLE;
//         end
//     endcase 
// end

endmodule