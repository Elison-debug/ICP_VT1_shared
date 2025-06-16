module top (
    input                        HCLK,
    input                        HRESETn,
    input                 [13:0] PADDR,
    input                 [31:0] PWDATA,
    input                        PWRITE,
    input                        PSEL,
    input                        PENABLE,
    output                [31:0] PRDATA,
    output                       PREADY,
    output                       PSLVERR
);

wire load_en, Mal_valid, filter_valid; 
assign Mal_valid = (PWRITE && PSEL && PENABLE) && (PADDR == )   // prepheral mapping of the maltrix input writting
assign filter_valid = (PWRITE && PSEL && PENABLE) && (PADDR == )   // prepheral mapping of the filter input writting




Reg_sram u_Reg_sram(
	.clk          	( HCLK          ),
	.rst          	( HRESETn       ),
	.load_en      	( load_en       ),
	.Mal_valid    	( Mal_valid     ),
	.filter_valid 	( filter_valid  ),
	.result       	( result        ),
	.Mal_in       	( Mal_in        ),
	.shift_en     	( shift_en      ),
	.wb_en        	( wb_en         ),
	.row_counter  	( row_counter   ),
	.line1        	( line1         ),
	.line2        	( line2         ),
	.line3        	( line3         )
);









endmodule