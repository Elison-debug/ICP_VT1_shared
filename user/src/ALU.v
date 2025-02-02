module ALU(
    input  clk,
    input  rst,

    input [13:0] A_input,
    input [63:0] X_reg1,                                    // Input 8*8bit elemments per row of the input matrix 
    input [63:0] X_reg2,
    input [63:0] X_reg3,  
    input [63:0] X_reg4,
    input        ALU_en,
    
    output reg X_shift,                                     // sychronized the input resgister in the buffer. 
    output reg [17:0] MU1,                                  // output result for each mul-sum product seperately
    output reg [17:0] MU2,
    output reg [17:0] MU3,
    output reg [17:0] MU4,
    output reg [3:0] rom_addr,                                  // Read coe from the ROM to the ALU, calculate the address to indicate the coe that the ROM need.     
    output reg [2:0] count_mul,
    output reg four_results_ready,
    output reg all_results_ready    
);
    // Reg for the mul op counter. 
    reg [2:0]   count_mul_next;
    reg [4:0]   global_counter, global_counter_next;
    // 
    reg         X_shift_next; 
    // MU Reg
    reg [17:0]  MU1_r_next;
    reg [17:0]  MU2_r_next;
    reg [17:0]  MU3_r_next;
    reg [17:0]  MU4_r_next;
    reg [3:0]   rom_addr_next;

    // signal connection
    wire [6:0]  data_odd = A_input [13:7];
    wire [6:0]  data_even = A_input [6:0];
     

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            MU1 <= 0; MU2 <= 0; MU3 <= 0; MU4 <= 0;
            X_shift <= 0; 
            rom_addr <= 0;
            count_mul <= 0;
            global_counter <= 0; 
            four_results_ready <= 0;
            all_results_ready <= 0; 
        end
        else begin
                count_mul <= count_mul_next;
                global_counter <= global_counter_next;
                X_shift <= X_shift_next;
                rom_addr <= rom_addr_next;
                MU1 <= MU1_r_next; 
                MU2 <= MU2_r_next; 
                MU3 <= MU3_r_next; 
                MU4 <= MU4_r_next; 
        end
    end

    123;
    always @(*) begin 
        if (ALU_en == 1) begin
            X_shift_next = X_shift + 1; 
            count_mul_next = count_mul + 1;
            global_counter_next = global_counter + 1;   
            if ((count_mul[0]) == 1) begin
                rom_addr_next = rom_addr + 1; 
                MU1_r_next = data_even*X_reg1[63:56] + MU1;
                MU2_r_next = data_even*X_reg2[63:56] + MU2;
                MU3_r_next = data_even*X_reg3[63:56] + MU3;
                MU4_r_next = data_even*X_reg4[63:56] + MU4; 
                if (count_mul == 3'd7) begin
                    four_results_ready = 1; 
                    if (global_counter == 5'd31) begin
                        all_results_ready = 1;
                    end
                    else begin
                        all_results_ready = 0; 
                    end
                end
                else begin
                    four_results_ready = 0; 
                end 
            end
            else begin
                all_results_ready = 0; 
                four_results_ready = 0;
                MU1_r_next = data_odd*X_reg1[63:56] + MU1;
                MU2_r_next = data_odd*X_reg2[63:56] + MU2;
                MU3_r_next = data_odd*X_reg3[63:56] + MU3;
                MU4_r_next = data_odd*X_reg4[63:56] + MU4;
            end
        end
        else begin
            // Finish the multiply and back to controller IDLE. Prepare to next input matrix.. 
            global_counter_next = 0; 
            count_mul_next = 0;  
            four_results_ready = 0;
            all_results_ready = 0;
            MU1_r_next = 0; MU2_r_next = 0; MU3_r_next = 0; MU4_r_next = 0; 
        end
    end 

endmodule
