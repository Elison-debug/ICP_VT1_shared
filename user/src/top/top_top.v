module top_top(
    input  clk,
    input  rst,
    input  start_in,
    input  valid_input,
    input  [7:0] X_load,
    output finish
);

// outports wire
wire [2:0] 	count_mul;
wire        ALU_done;
wire       	xload_done;
wire       	aload_done;
wire       	input_load_en;


controller #(
	.IDLE        	( 00  ),
	.shift_input 	( 01  ),
	.multiply    	( 10  ),
	.next_col    	( 11  ))
u_controller(
	.clk             	( clk              ),
	.rst             	( rst              ),
	.start_in        	( start_in         ),
	.ALU_done 	        ( ALU_done         ),
	.xload_done      	( xload_done       ),
	.aload_done      	( aload_done       ),
	.count_mul       	( count_mul        ),
	.ALU_en             ( ALU_en           ),
	.input_load_en   	( input_load_en    ),
	.finish          	( finish           )
);

// // outports wire
// wire       	P_out;

// wire       	arithmetic_done;

logic_top u_logic_top(
	.clk             	( clk              ),
	.rst             	( rst              ),
	.ALU_en             ( ALU_en           ),
	.X_load         	( X_load           ),
	.valid_input     	( valid_input      ),
	.input_load_en   	( input_load_en    ),
	
	.count_mul       	( count_mul        ),
	.xload_done      	( xload_done       ),
	.aload_done      	( aload_done       ),
	.ALU_done 	        ( ALU_done         )
);



endmodule