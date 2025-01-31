module ALU(
    input  clk,
    input  rst,

    input [13:0] A_input,
    input [63:0] X_reg1,
    input [63:0] X_reg2,
    input [63:0] X_reg3,  
    input [63:0] X_reg4,
    
    output X_shift,
    output reg [16:0] MU1,
    output reg [16:0] MU2,
    output reg [16:0] MU3,
    output reg [16:0] MU4,
    output [3:0] rom_addr,
    output [2:0] count_mul
);
    reg [16:0] MU1_next;
    reg [16:0] MU2_next;
    reg [16:0] MU3_next;
    reg [16:0] MU4_next;
    //
    reg [7:0]  matrix_coe1;
    reg [7:0]  matrix_coe2;
    reg [7:0]  matrix_coe1_next;
    reg [7:0]  matrix_coe1_next;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        MU1 <= 0;
        MU2 <= 0;
        MU3 <= 0;
        MU4 <= 0;
    end
    else begin

    end
end



endmodule