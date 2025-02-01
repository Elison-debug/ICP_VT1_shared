module top_top(
    input  clk,
    input  rst,
    input  start_in,
    input  valid_input,
    input  [7:0] X_load,
    output finish,
    output P_out
);

    reg [3:0] address_1_current;
    reg [3:0] address_2_current;
    reg [3:0] address_3_current;
    reg [3:0] address_4_current;

// outports wire
wire       	input_load_en;
wire       	rom_start;
wire       	ALU_en;
wire       	ram_en;
wire       	web;

controller #(
	.IDLE        	( 00  ),
	.shift_input 	( 01  ),
	.multiply    	( 10  ),
	.next_col    	( 11  ))
u_controller(
	.clk             	( clk              ),
	.rst             	( rst              ),
	.ram_done        	( ram_done         ),
	.row_done        	( row_done         ),
	.start_in        	( start_in         ),
	.xload_done      	( xload_done       ),
	.aload_done      	( aload_done       ),
	.arithmetic_done 	( arithmetic_done  ),
	.count_mul       	( count_mul        ),
	.input_load_en   	( input_load_en    ),
	.rom_start       	( rom_start        ),
	.ALU_en          	( ALU_en           ),
	.ram_en          	( ram_en           ),
	.web             	( web              ),
	.finish          	( finish           )
);

// // outports wire
// wire       	P_out;
// wire       	ram_done;
// wire       	row_done;
// wire [2:0] 	count_mul;
// wire       	xload_done;
// wire       	aload_done;
// wire       	arithmetic_done;

logic_top u_logic_top(
	.clk             	( clk              ),
	.rst             	( rst              ),
	.input_load_en   	( input_load_en    ),
	.rom_start       	( rom_start        ),
	.AU_en           	( AU_en            ),
	.avgmax_en       	( avgmax_en        ),
	.ram_en          	( ram_en           ),
	.P_s             	( P_s              ),
	.X_load         	( X_load           ),
	.valid_input     	( valid_input      ),
	.P_out           	( P_out            ),
	.ram_done        	( ram_done         ),
	.row_done        	( row_done         ),
	.count_mul       	( count_mul        ),
	.xload_done      	( xload_done       ),
	.aload_done      	( aload_done       ),
	.arithmetic_done 	( arithmetic_done  )
);



endmodule