module top_top(
    input  clk,
    input  rst,
	input  read_n,
    input  start_in,
    input  valid_input,
    input  [7:0] X_load,
    
    output ry,
	output [8:0]read_data,
    output finish
);

// outports wire
wire        ALU_done;
wire       	xload_done;
wire       	input_load_en;


controller u_controller(
	.clk             	( clk              ),
	.rst             	( rst              ),
	.start_in        	( start_in         ),
	.web                ( web              ),
	.xload_done      	( xload_done       ),
	.ALU_en             ( ALU_en           ),
	.input_load_en   	( input_load_en    )
);

logic_top u_logic_top(
	.clk             	( clk              ),
	.rst             	( rst              ),
	.read_n             ( read_n           ),
	.ALU_en             ( ALU_en           ),
	.X_load         	( X_load           ),
	.valid_input     	( valid_input      ),
	.input_load_en   	( input_load_en    ),
	
	.web                ( web              ),
	.xload_done      	( xload_done       ),
	.ry                 ( ry               ),
    .read_data          ( read_data        ),
	.ALU_done 	        ( ALU_done         )
);

endmodule