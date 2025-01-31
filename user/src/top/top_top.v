module top_top(
    input  clk,
    input  rst,
    input  X_load,
    input  start_in,
    input  valid_input,
    output finish,
    output P_out
);

    reg [3:0] address_1_current;
    reg [3:0] address_2_current;
    reg [3:0] address_3_current;
    reg [3:0] address_4_current;


controller controller(
    .clk(clk),
    .rst(rst),
    .ram_done(ram_done),
    .row_done(row_done),
    .start_in(start_in),
    .xload_done(xload_done),
    .aload_done(aload_done),
    .arithmetic_done(arithmetic_done),
    .count_mul(count_mul),
    
    .P_s(P_s),
    .AU_en(AU_en),
    .finish(finish),
    .avgmax_en(avgmax_en),
    .rom_start(rom_start),
    .input_load_en(input_load_en)
);

logic_top logic_top(
    .clk(clk),
    .rst(rst),
    .P_s(P_s),
    .AU_en(AU_en),
    .ram_en(ram_en),
    .valid_input(valid_input),
    .rom_start(rom_start),
    .avgmax_en(avgmax_en),
    .input_load_en(input_load_en),

    .count_mul(count_mul),
    .ram_done(ram_done),
    .row_done(row_done),
    .xload_done(xload_done),
    .aload_done(aload_done),
    .arithmetic_done(arithmetic_done)
);





endmodule