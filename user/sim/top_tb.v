`timescale 1ns / 1ps
module top_tb();
    parameter MAIN_FRE   = 100; //unit MHz

    localparam NUM_KEYS = 64;   //total data num    
    localparam INPUT_FILE = "input.txt";

    reg [6:0] memory [0:NUM_KEYS-1]; // 7 bit memory with 16 entries

    reg clk = 0;
    reg rst = 0;

    // test input signal

    reg start_in;
    reg valid_input;
    reg [6:0] X_load;

    

    always #(500/MAIN_FRE) clk = ~clk;


    initial begin

        $readmemh(INPUT_FILE, memory);

        rst = 1'b0;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        //in = 10110110;
        //in = input_A;
        rst = 1'b1;
        
        #100 start_in=1'b1;
        //#10000  b_Enter=1'b1;
        //#1000   b_Enter=1'b0;
        //#100    in = 00010110;


    end
    

// outports wire
wire       	finish;
wire       	P_out;

top_top u_top_top(
	.clk         	( clk          ),
	.rst         	( rst          ),
	.start_in    	( start_in     ),
	.valid_input 	( valid_input  ),
	.X_load      	( X_load       ),
	.finish      	( finish       ),
	.P_out       	( P_out        )
);



endmodule  //TOP
