module logic_top(
    input  clk,
    input  rst,
    input  input_load_en,
    input  rom_start,
    input  AU_en,
    input  avgmax_en,
    input  P_s,
    input  [7:0] X_load,
    input  valid_input,

    output P_out,
    output ram_done,
    output row_done,
    output [2:0] count_mul,
    output xload_done,
    output aload_done,
    output arithmetic_done
);

// outports wire
wire [63:0] 	X_reg1;
wire [63:0] 	X_reg2;
wire [63:0] 	X_reg3;
wire [63:0] 	X_reg4;

X_buffer u_X_buffer(
	.clk           	( clk            ),
	.rst           	( rst            ),
	.valid_input   	( valid_input    ),
	.input_load_en 	( input_load_en  ),
	.X_load        	( X_load         ),
	.X_shift       	( X_shift        ),
	.X_reg1        	( X_reg1         ),
	.X_reg2        	( X_reg2         ),
	.X_reg3        	( X_reg3         ),
	.X_reg4        	( X_reg4         ),
	.xload_done    	( xload_done     )
);

// outports wire
wire [13:0] 	A_input;

A_rom_top u_A_rom_top(
	.clk     	( clk      ),
	.rst     	( rst      ),
	.rom_addr   ( rom_addr ),
	.A_input 	( A_input  )
);

// outports wire
wire [16:0] 	MU1;
wire [16:0] 	MU2;
wire [16:0] 	MU3;
wire [16:0] 	MU4;
wire [3:0] 	    rom_adr;

ALU u_ALU(
	.clk       	( clk        ),
	.rst       	( rst        ),
	.A_input   	( A_input    ),
	.X_reg1    	( X_reg1     ),
	.X_reg2    	( X_reg2     ),
	.X_reg3    	( X_reg3     ),
	.X_reg4    	( X_reg4     ),
	.X_shift   	( X_shift    ),
	.MU1       	( MU1        ),
	.MU2       	( MU2        ),
	.MU3       	( MU3        ),
	.MU4       	( MU4        ),
    .rom_addr   ( rom_addr   ),
	.count_mul 	( count_mul  )
);


// wb outports wire

wire [7:0]      address;
wire [31:0] 	dataRAM;

wb #(
	.wb_IDLE  	( 0  ),
	.wb_start 	( 1  ))
u_wb(
	.clk     	( clk      ),
	.rst     	( rst      ),
	.web     	( web      ),
	.MU1     	( MU1      ),
	.MU2     	( MU2      ),
	.MU3     	( MU3      ),
	.MU4     	( MU4      ),
	.ram_en  	( ram_en   ),
	.address 	( address  ),
	.dataRAM 	( dataRAM  ) 
);

wire 	     ry;
wire [31:0]  read_data;
sram_wrapper u_sram_wrapper(
    .clk        (clk       ),
    .cs_n       (cs_n      ),
    .we_n       (ram_en    ),
    .address    (address   ),
    .write_data (dataRAM   ),
    .ry         (ry        ),
    .read_data  (read_data )
);

endmodule