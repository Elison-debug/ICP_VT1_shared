module A_rom_top(
    input  clk,
    input  rst,
    
    input  rom_addr,
    output aload_done,
    output [13:0] A_input
);

// outports wire
wire [13:0] 	dataROM;
wire [ 3:0]     w_addr;


A_rom_load #(
	.num_1_1 	( 1  ),//column 1
	.num_2_1 	( 2  ),
	.num_3_1 	( 3  ),
	.num_4_1 	( 4  ),
	.num_5_1 	( 5  ),
	.num_6_1 	( 6  ),
	.num_7_1 	( 7  ),
	.num_8_1 	( 8  ),
	.num_1_2 	( 1  ),//column 2
	.num_2_2 	( 2  ),
	.num_3_2 	( 3  ),
	.num_4_2 	( 4  ),
	.num_5_2 	( 5  ),
	.num_6_2 	( 6  ),
	.num_7_2 	( 7  ),
	.num_8_2 	( 8  ),
	.num_1_3 	( 1  ),//column 3
	.num_2_3 	( 2  ),
	.num_3_3 	( 3  ),
	.num_4_3 	( 4  ),
	.num_5_3 	( 5  ),
	.num_6_3 	( 6  ),
	.num_7_3 	( 7  ),
	.num_8_3 	( 8  ),
	.num_1_4 	( 1  ),//column 4
	.num_2_4 	( 2  ),
	.num_3_4 	( 3  ),
	.num_4_4 	( 4  ),
	.num_5_4 	( 5  ),
	.num_6_4 	( 6  ),
	.num_7_4 	( 7  ),
	.num_8_4 	( 8  ))
u_A_rom_load(
	.clk     	( clk      ),
	.rst     	( rst      ),
    .w_addr     ( w_addr   ),
    .dataROM 	( dataROM  ),
    .aload_done ( aload_done)
);

A_rom u_A_rom(
	.clk      	( clk       ),
	.rst      	( rst       ),
	.w_addr   	( w_addr    ),
	.rom_addr 	( rom_addr  ),
	.dataROM  	( dataROM   ),
	.A_input  	( A_input   )
);


endmodule