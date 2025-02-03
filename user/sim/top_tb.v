`timescale 1ns / 1ps
module top_tb();
    parameter MAIN_FRE   = 100; //unit MHz

    localparam matrix_num = 2;   //total matrix number       
    localparam NUM_KEYS = matrix_num*32;   //total data num

    localparam INPUT_FILE = "X_input.txt";
    reg [6:0] memory [0:NUM_KEYS-1]; // 7 bit memory with 32 * matrix_num entries

    //FSM state
    parameter IDLE = 2'b00;
    parameter X_input = 2'b01;
    parameter next_input = 2'b10;

    reg [1:0] state;
    reg [1:0] state_next;

    //clock
    reg clk = 0;
    reg rst = 0;

    // test input signal
    reg start_in;
    reg valid_input;
    reg [6:0] X_load;
    reg [6:0] X_load_next;
    
    reg [matrix_num+4:0] matrix_count;
    reg [matrix_num+4:0] matrix_count_next;

    // outports wire
    wire       	finish; 

always #(500/MAIN_FRE) clk = ~clk;


initial begin
    $readmemh(INPUT_FILE, memory);
    rst = 1'b0;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    rst = 1'b1;

    #100 start_in=1'b1;

end
    
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        X_load <= 7'b0; 
        state  <= IDLE;
        matrix_count <= 0; 
    end
    else begin
        X_load <= X_load_next; 
        state <= state_next;
        matrix_count <= matrix_count_next; 
    end
end

always @(*) begin
    X_load_next = X_load;
    state_next = state;
    matrix_count_next = matrix_count;
    case (state)
        IDLE       : begin state_next = start_in ? X_input : IDLE;  end
        X_input    : begin state_next = (matrix_count[4:0]==5'd31) ? next_input : X_input; 
            start_in = 0;
            valid_input = 1'b1;            
            X_load_next = memory[matrix_count];
            matrix_count_next = matrix_count + 1'b1;
        end
        next_input : begin
            if(matrix_count[matrix_num+4:5]==matrix_num)
                state_next = IDLE;
            else if (finish)
                state_next = X_input;
                start_in   =1'b1;
            endif
        end
    endcase
end



top_top_test u_top_top_test(
	.clk         	( clk          ),
	.rst         	( rst          ),
    .cs_n           ( cs_n         ),
	.start_in    	( start_in     ),
	.valid_input 	( valid_input  ),
	.X_load      	( X_load       ),
    .ry             ( ry           ),
    .read_data      ( read_data    ),
	.finish      	( finish       )
);

endmodule  //TOP
