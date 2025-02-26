`timescale 1 ns / 1 ns
module top_tb();
    parameter MAIN_FRE   = 100; //unit MHz

    localparam matrix_num = 2;   //total matrix number       
    localparam NUM_KEYS = matrix_num*32;   //total data num

    localparam INPUT_FILE = "X_input.txt";
    localparam RESULT_FILE = "result.txt";
    reg [7:0] memory [0:NUM_KEYS-1]; // 8 bit memory with 32 * matrix_num entries
    reg [17:0] result_data [0:matrix_num*16-1]; // 18 bit result with 16 * matrix_num entries
    reg [17:0] result_data_ALU [0:matrix_num*16-1]; // 18 bit result with 16 * matrix_num entries

    //FSM state
    parameter IDLE = 2'b00;
    parameter X_input = 2'b01;
    parameter next_input = 2'b10;

    reg [7:0] r_addr;
    reg [1:0] state;
    reg [1:0] state_next;
    wire [7:0] r_addr_pad;
    assign r_addr_pad = r_addr;

    //clock
    reg clk = 0;
    reg rst = 0;
    wire clk_pad,rst_pad;
    assign clk_pad = clk;
    assign rst_pad = rst;

    // test input signal
    reg start_in;
    reg read_n=1'b1;
    wire start_in_pad,read_n_pad;
    assign start_in_pad = start_in;
    assign read_n_pad = read_n;

    reg [matrix_num+4:0] matrix_count;
    reg [matrix_num+4:0] matrix_count_next;

    wire ry;
    wire valid_input;
    
    wire [7:0] X_load;
    assign valid_input = (state == X_input);
    assign X_load =(state == X_input)? memory[matrix_count]:0;

    // outports wire
    wire       	finish; 
    wire [8:0]  data_out;

always #(500/MAIN_FRE) clk = ~clk;
integer i=0;

initial begin
    $readmemb(INPUT_FILE, memory);
    $readmemb(RESULT_FILE, result_data);
    start_in = 0;
    rst = 1'b0;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    rst = 1'b1;
    r_addr    = 0;
    #100 start_in=1'b1;

    #3000
    for (i = 0; i < matrix_num*16; i = i + 1) begin
            @(posedge clk);
            r_addr = i;
            read_n = 1'b0;
            @(posedge clk);
            read_n = 1'b1;
            repeat (2) @(posedge clk);
            result_data_ALU[i] [8:0] = data_out;
            @(posedge clk);
            result_data_ALU[i] [17:9] = data_out;
            if(result_data_ALU[i] != result_data[i])begin
                $display("Error: result_data[%d] = %b, result_data_ALU[%d] = %b", i, result_data[i], i, result_data_ALU[i]);
                $finish;
            end
            $display("Time %0t: Address = %d, data_out_ALU = %b", $time, i, result_data_ALU[i]);
        end

        #50;
        $display("Time %0t: Congratulations!! results are all correct!!", $time);
        
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
            if(matrix_count[matrix_num+4:5]==matrix_num)begin
                state_next = IDLE;
            end
            else if (finish) begin
                @(negedge clk);
                @(negedge clk);
                @(negedge clk);
		#100
                start_in =1'b1;
                @(negedge clk);
 		@(posedge clk);
                start_in =1'b0;
                state_next = X_input;
            end
        end
        default : state  <= IDLE;
    endcase
end

top_top u_top_top(
	.clk_pad         	( clk_pad          ),
	.rst_pad        	( rst_pad          ),
    .read_n_pad         ( read_n_pad       ),
	.start_in_pad    	( start_in_pad     ),
	.valid_input_pad 	( valid_input  ),
    .r_addr_pad         ( r_addr_pad       ),
	.X_load_pad      	( X_load       ),
    .ry_pad             ( ry           ),
    .read_data_pad       ( data_out     ),
	.finish_pad      	( finish       )
);



endmodule  //TOP
