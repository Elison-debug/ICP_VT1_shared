module top_tb();
    parameter MAIN_FRE   = 100; //unit MHz

    localparam matrix_num = 2;   //total matrix number       
    localparam NUM_KEYS = matrix_num*32;   //total data num

    localparam INPUT_FILE = "X_input.txt";
    reg [7:0] memory [0:NUM_KEYS-1]; // 8 bit memory with 32 * matrix_num entries

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
    reg start_in=0;
   
    reg [matrix_num+4:0] matrix_count;
    reg [matrix_num+4:0] matrix_count_next;

    wire ry;
    wire valid_input;
    wire [7:0] r_addr;
    wire [7:0] X_load;
    assign valid_input = (state == X_input);
    assign X_load =(state == X_input)? memory[matrix_count]:0;

    // outports wire
    wire       	finish; 
    wire [8:0] read_data;

always #(500/MAIN_FRE) clk = ~clk;


initial begin
    $readmemb(INPUT_FILE, memory);
    rst = 1'b0;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    rst = 1'b1;

    #100 start_in=1'b1;

end
    
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        state  <= IDLE;
        matrix_count <= 0; 
    end
    else begin
        state <= state_next;
        matrix_count <= matrix_count_next; 
    end
end

always @(*) begin
    state_next = state;
    matrix_count_next = matrix_count;
    case (state)
        IDLE       : begin state_next = start_in ? X_input : IDLE;  end
        X_input    : begin state_next = (matrix_count[4:0]==5'd31) ? next_input : X_input; 
            start_in = 0; 

            matrix_count_next = matrix_count + 1'b1;
        end
        next_input : begin
            if(matrix_count[matrix_num+4:5]==matrix_num)
                state_next = IDLE;
                

            else if (finish) begin
                @(negedge clk);
                @(negedge clk);
                @(negedge clk);
                start_in =1'b1;
                @(negedge clk);
                start_in =1'b0;
                state_next = X_input;
            end
        end
        default : state  <= IDLE;
    endcase
end



top u_top(
	.clk         	( clk          ),
	.rst         	( rst          ),
    .read_n         ( read_n       ),
	.start_in    	( start_in     ),
	.valid_input 	( valid_input  ),
    .r_addr         ( r_addr       ),
	.X_load      	( X_load       ),
    .ry             ( ry           ),
    .read_data      ( read_data    ),
	.finish      	( finish       )
);

endmodule  //TOP
