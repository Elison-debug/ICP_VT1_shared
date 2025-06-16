module acc_top (
    input                        HCLK,
    input                        HRESETn,
    input                 [11:0] PADDR,
    input                 [31:0] PWDATA,
    input                        PWRITE,
    input                        PSEL,
    input                        PENABLE,
    output                [31:0] PRDATA,
    output                       PREADY,
    output                       PSLVERR
);

wire load_en, Mal_valid, filter_valid; 
assign load_en   = (PWRITE && PSEL && PENABLE) && (PADDR == 12'hff0) && (PWDATA == 12'd1);
assign Mal_valid = (PWRITE && PSEL && PENABLE) && (PADDR == 12'hff8) ;  // prepheral mapping of the maltrix input writting
assign filter_valid = (PWRITE && PSEL && PENABLE) && (PADDR == 12'hff4);   // prepheral mapping of the filter input writting
assign PSLVERR = 1'b0; 
assign PREADY  = 1'b0; 
// outports wire
wire [4:0]  	row_counter;
wire [23:0] 	line1;
wire [23:0] 	line2;
wire [23:0] 	line3;
wire [23:0] 	apb_read;
wire [71:0] 	filter;
wire [19:0] 	result; 
wire   			shift_en;
wire   			wb_en;
wire [5:0] r_addr;
Reg_sram u_Reg_sram(
	.clk          	( HCLK          ),
	.rst          	( HRESETn       ),
	.load_en      	( load_en       ),
	.Mal_valid    	( Mal_valid     ),
	.filter_valid 	( filter_valid  ),
	.result       	( result        ),
	.Mal_in       	( PWDATA        ),
	.shift_en     	( shift_en      ),
	.wb_en        	( wb_en         ),
	.r_addr       	( r_addr        ),
	.row_counter  	( row_counter   ),
	.line1        	( line1         ),
	.line2        	( line2         ),
	.line3        	( line3         ),
	.apb_read     	( apb_read      ),
	.filter_out     ( filter        )
);


// outports wire

wire        	wb;
wire        	alu_done;
wire   	ALU_en;

alu u_alu(
	.clk      	( HCLK      ),
	.rst      	( HRESETn   ),
	.ALU_en   	( ALU_en    ),
	.filter   	( filter    ),
	.line1    	( line1     ),
	.line2    	( line2     ),
	.line3    	( line3     ),
	.result   	( result    ),
	.wb       	( wb        ),
	.alu_done 	( alu_done  )
);

// outports wire
acc_controller u_acc_controller(
	.clk          	( HCLK          ),
	.rst          	( HRESETn       ),
	.en_calculate 	( en_calculate  ),
	.cal_done     	( cal_done      ),
	.acc_done     	( acc_done      ),
	.shift_done   	( shift_done    ),
	.alu_done     	( alu_done      ),
	.ALU_en       	( ALU_en        ),
	.load_en      	( load_en       ),
	.shift_en     	( shift_en      ),
	.wb_en        	( wb_en         )
);
endmodule
