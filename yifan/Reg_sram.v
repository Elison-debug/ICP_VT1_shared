module Reg_sram(
    input clk, 
    input rst,
    input load_en, 
    input Mal_valid,
    input filter_valid,
    input [19:0] result,
    input [31:0] Mal_in,
    input shift_en,
    input wb_en, 
    input [5:0]r_addr,                      // for apb read, 6 bits address, 2:0 for select pixel in one row, 5:3 for select rows. 

    output reg [4:0]    row_counter,        // Count how many matrix pixels has been loaded into Reg
    output [23:0]   line1,
    output [23:0]   line2,
    output [23:0]   line3,
    output [23:0]   apb_read,
    output [71:0]   filter_out
    );
    wire row_sel, pixel_sel;
    assign row_sel   = r_addr[5:3];
    assign pixel_sel = r_addr[2:0];  
    
    reg [4:0]   cal_count_next, cal_count;         // calculate how many shift has done. 
    reg [1:0]   filter_count, filter_count_next; 
    reg [239:0] mal      [29:0];    // Reg files for matrix input of 30*30
    reg [239:0] mal_next [29:0];
    reg [19:0] res      [27:0];    // Reg files for result matrix of 28*28
    assign apb_read = res[row_sel][pixel_sel*8 +: 32];
    reg [19:0] res_next [27:0];    
    reg [71:0]  filter;             // Filter of 3*3 
    reg [71:0]  filter_next;  
    reg [4:0]   pixel_counter_next;
    reg [4:0]   pixel_counter;
    reg [4:0]   row_nr, cal_row, wb_nr, wb_row_nr, cal_row_next, row_nr_next, wb_nr_next,wb_row_nr_next;
    
    
    assign line1 = mal_next[cal_row][23:0];
    assign line2 = mal_next[cal_row+1][23:0];
    assign line3 = mal_next[cal_row+2][23:0];
    assign filter_out = filter;

always @(posedge clk or negedge rst) begin
    if (!rst) begin 
        row_nr            <= 0;
        filter            <= 0;
        filter_count      <= 0; 
        filter_count_next <= 0; 
        wb_nr             <= 0; 
        wb_row_nr         <= 0;
    end
    else begin 
        mal[row_nr]       <= mal_next[row_nr];                                // Only update the current loading row.  
        mal[cal_row]      <= mal_next[cal_row];                               // only update three current shifting row. 
        mal[cal_row+1]    <= mal_next[cal_row+1];
        mal[cal_row+2]    <= mal_next[cal_row+2];
        row_nr            <= row_nr_next;
        filter            <= filter_next;
        filter_count      <= filter_count_next; 
        filter_count_next <= filter_count; 
        wb_nr             <= wb_nr_next; 
        wb_row_nr         <= wb_row_nr_next;
    end 
end

// load into filter and matrix into registers 
always @(*) begin 
    row_nr_next        = row_nr;
    mal_next[row_nr]   = mal[row_nr]; 
    pixel_counter_next = pixel_counter;
    filter_next        = filter;
    if (pixel_counter == 5'd30) begin 
        row_nr_next = row_nr + 1;                  // update the row_nr when one row is load done
    end
    if (load_en & Mal_valid) begin
        mal_next[row_nr]   = {Mal_in, mal[row_nr][239:32]};
        pixel_counter_next = pixel_counter + 1'b1; 
    end
    if (load_en & filter_valid) begin
        if (filter_count != 2'd2) begin
        filter_next = {Mal_in, filter[71:32]};
        end
        else begin 
        filter_next = {Mal_in[7:0], filter[71:8]};
        end
        filter_count_next = filter_count + 1'b1; 
    end
end

// shift once when one convolution is done, shift 3 times when one row calculation is done. 
always @(*) begin
    if (shift_en) begin 
        cal_count_next    = cal_count +1'b1; 
        mal_next[cal_row]   = {mal_next[cal_row][7:0], mal_next[cal_row][239:8]};
        mal_next[cal_row+1] = {mal_next[cal_row+1][7:0], mal_next[cal_row+1][239:8]};
        mal_next[cal_row+2] = {mal_next[cal_row+2][7:0], mal_next[cal_row+2][239:8]};
    end
    else if (cal_count == 5'd28) begin                  // stride for 28 times, can not stride anymore in one row
        cal_row_next        = cal_row + 1; 
        mal_next[cal_row]   = {mal_next[cal_row][23:0], mal_next[cal_row][239:24]};
        mal_next[cal_row+1] = {mal_next[cal_row+1][23:0], mal_next[cal_row+1][239:24]};
        mal_next[cal_row+2] = {mal_next[cal_row+2][23:0], mal_next[cal_row+2][239:24]};
    end
end

// write back to the result register
always @(*) begin
    res_next[wb_row_nr] = res[wb_row_nr];
    wb_nr_next = wb_nr;
    if (wb_en) begin 
        res_next[wb_row_nr]   = {result, res[wb_row_nr][wb_nr]};
        wb_nr_next = wb_nr + 1; 
    end
    if (wb_nr == 28) begin
        wb_nr_next = 0;
        wb_row_nr_next = wb_row_nr + 1;   
    end
end





endmodule





















// module Reg_sram (
//     input             clk,
//     input             enable,         
    // input             CSN,       // (active low)
    // input             WEN,       // (active low)
    // input      [8:0]  A,         // address
    // input      [31:0] D,         // data in
    // output reg [31:0] Q,         // data out
    // output reg        RY,        // ready signal

// );


//     // 
//     reg [31:0] mem [423:0];  // Maltrix,filter,Result. 

//     // 
//     always @(posedge clk) begin
//         if (CSN) begin
//             RY <= 1'b0;
//             Q  <= 32'd0;
//         end else begin
//             RY <= 1'b1;
//             if (!WEN) begin
//                 mem[A] <= D;    // Read Data. 
//             end else begin
//                 Q <= mem[A];    // Write result
//             end
//         end
//     end

//     always @(*) begin 
        

//     end


// endmodule
