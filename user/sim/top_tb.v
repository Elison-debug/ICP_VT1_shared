`timescale 1ns / 1ps
module top_tb();
    parameter MAIN_FRE   = 100; //unit MHz

    localparam matrix_num = 2;   //total matrix number       
    localparam NUM_KEYS = matrix_num*32;   //total data num

    localparam INPUT_FILE = "X_input.txt";

    parameter IDLE = 2'b00;
    parameter X_input = 2'b01;
    parameter next_input = 2'b10;

    reg [6:0] memory [0:NUM_KEYS-1]; // 7 bit memory with 16 entries

    reg clk = 0;
    reg rst = 0;

    //FSM state
    reg [1:0] state;

    // test input signal
    reg start_in;
    reg valid_input;
    reg [6:0] X_load;

    reg [1:0] matrix_count;

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
        state <= IDLE;
    end
    else begin
        case(state)
            IDLE   : state = (start_in==1'b1) ? X_input :IDLE
            X_input:begin
                 
            end
        endcase
    end
end

// outports wire
wire       	finish;

top_top u_top_top(
	.clk         	( clk          ),
	.rst         	( rst          ),
	.start_in    	( start_in     ),
	.valid_input 	( valid_input  ),
	.X_load      	( X_load       ),
	.finish      	( finish       )
);



endmodule  //TOP
