// 
module acc_controller(
    input clk, 
    input rst,
    input en_calculate, 
    input cal_done,
    input acc_done, 
    input shift_done,  
    input alu_done, 
    
    output ALU_en,
    output load_en,
    output shift_en, 
    output wb_en
    
);

localparam idle         = 2'd0;
localparam load         = 2'd1;
localparam calculate    = 2'd2;
localparam shift        = 2'd3;

reg [1:0]  state;
reg [1:0]  next_state;
assign wb_en    = (alu_done); 
assign load_en  = (state != idle);
assign ALU_en   = (state == calculate);
assign shift_en = (state == shift);             //enable shift once 1 convolution has done. 


always @(posedge clk or negedge rst) begin
    if (!rst) begin 
        state <= 2'd0;
    
    end
    else begin
        state <= next_state;

    end

end

always @(*) begin

    case (state)
    
        idle: begin 
        if (load_en) 
            next_state = load;
        end

        load: begin 
        if (en_calculate) 
            next_state = calculate;
        end

        calculate: begin 
        if (cal_done)  
            next_state = shift; 
        else if (acc_done)  
            next_state = idle; 
        end

        shift: begin
        if (shift_done)  
            next_state = calculate; 
        end 

        default: next_state = idle; 
        
    endcase 
end

endmodule

