module ALU(
    input  clk,
    input  rst,

    input [13:0] A_input,
    input [8:0] X_reg1,        // Input 8*8bit elemments per row of the input matrix 
    input [8:0] X_reg2,
    input [8:0] X_reg3,  
    input [8:0] X_reg4,
    input       ALU_en,
    
    output X_shift,            // sychronized the input resgister in the buffer. 
    output reg [17:0] MU1,     // output result for each mul-sum product seperately
    output reg [17:0] MU2,
    output reg [17:0] MU3,
    output reg [17:0] MU4,
    output [3:0] rom_addr,     // Read coe from the ROM to the ALU, calculate the address to indicate the coe that the ROM need.     
    output web,
    output ALU_done   
);
    // Reg for the mul op counter. 
    reg [6:0] counter, counter_next;
    assign rom_addr  = counter[6:1];

    // shift finish and web signal
    assign X_shift = ALU_en ? 1'b1 : 1'b0;
    assign ALU_done= ALU_en||(counter[4:0] == 5'd31);
    assign web     = ALU_en||(counter[2:0] == 3'd7);

    // MU Reg
    reg [17:0]  MU1_next;
    reg [17:0]  MU2_next;
    reg [17:0]  MU3_next;
    reg [17:0]  MU4_next;

    // signal connection
    wire [6:0]  data_odd = A_input [13:7];
    wire [6:0]  data_even = A_input [6:0];
    reg  [6:0]  A;
    wire [6:0]  A_NEXT;
    assign A_NEXT = (counter[0] == 1) ? data_odd : data_even;

    // cl and rst. 
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            MU1 <= 0; MU2 <= 0; MU3 <= 0; MU4 <= 0;
            counter <= 0; 
        end
        else begin
                counter <= counter_next;
                MU1 <= MU1_next; 
                MU2 <= MU2_next; 
                MU3 <= MU3_next; 
                MU4 <= MU4_next;
                A   <= A_NEXT;   
        end
    end

    // ALU
    always @(*) begin
        // Default value. 
        if (ALU_en) begin
            counter_next = counter + 1;
            MU1_next = A*X_reg1 + MU1;
            MU2_next = A*X_reg2 + MU2;
            MU3_next = A*X_reg3 + MU3;
            MU4_next = A*X_reg4 + MU4;
        end
        else begin
            // Finish the multiply and back to controller IDLE. Prepare to next input matrix.
            counter_next = 1'b0; 
            MU1_next = 18'b0; MU2_next = 18'b0; MU3_next = 18'b0; MU4_next = 18'b0; 
        end
    end 

endmodule
