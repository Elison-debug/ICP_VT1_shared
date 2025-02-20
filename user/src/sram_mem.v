module sram_mem(
    input         clk,
    input         rst,  
    input         we_n,
    input         read_n,
    input  [7:0]  w_addr,  
    input  [7:0]  r_addr,
    input  [31:0] write_data,

    output ry,
    output [8:0] data_out
);

    wire        cs_n;
    wire [7:0]  addr;
    wire [31:0] sram_data;
    assign addr = we_n ? w_addr : r_addr;
    assign cs_n = !(read_n||we_n);


    localparam IDLE      = 2'd0;
    localparam READ_DATA = 2'd1;
    localparam OUT_NEXT  = 2'd2;

    reg [8:0] data_out_wire;
    assign data_out=data_out_wire;

    reg [1:0] state, next_state;
    reg [31:0] data_reg;  // data from SRAM

    // update state and data
    always @(posedge clk) begin
        if (rst) begin
            state     <= IDLE;
            data_reg  <= 32'b0;
        end else begin
            state     <= next_state;
            if (state == IDLE)
                data_reg <= sram_data;
        end
    end
    //FSM
    always @(*) begin
        case(state)
            IDLE:      next_state = (read_n&&ry) ? READ_DATA : IDLE;
            READ_DATA: next_state = OUT_NEXT;
            OUT_NEXT:  next_state = IDLE;
            default:   next_state = IDLE;
        endcase
    end

    always @(*) begin
        case(state)
            IDLE: begin
                data_out_wire = 9'd0;
            end
            READ_DATA: begin
                data_out_wire = data_reg[8:0];
            end
            OUT_NEXT: begin
                data_out_wire <= data_reg[17:9];
            end
            default: begin
                data_out_wire <= 9'd0;
            end
        endcase
    end

    sram_wrapper u_sram (
    .clk        (clk        ),
    .cs_n       (cs_n       ),     
    .we_n       (we_n       ),       
    .address    (addr       ),
    .write_data (write_data ), 
    .read_data  (sram_data  ),
    .ry         (ry         )
    );

endmodule
