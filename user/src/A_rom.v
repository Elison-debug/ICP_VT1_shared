module A_rom(
    input  clk,
    input  rst,

    input  [3:0]  w_addr,
    input  [3:0]  rom_addr,
    input  [13:0] dataROM,
    output [13:0] A_input
);

reg [13:0] ROM [15:0];
assign A_input = ROM[rom_addr];

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        ROM[0] <= 14'b0;
        ROM[1] <= 14'b0;
        ROM[2] <= 14'b0;
        ROM[3] <= 14'b0;
        ROM[4] <= 14'b0;
        ROM[5] <= 14'b0;
        ROM[6] <= 14'b0;
        ROM[7] <= 14'b0;
        ROM[8] <= 14'b0;
        ROM[10] <= 14'b0;
        ROM[11] <= 14'b0;
        ROM[12] <= 14'b0;
        ROM[13] <= 14'b0;
        ROM[14] <= 14'b0;
        ROM[15] <= 14'b0;
    end
    else begin
        ROM[w_addr] <= dataROM;
    end
end


endmodule