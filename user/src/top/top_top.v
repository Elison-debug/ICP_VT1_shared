module top_top (
    inout             clk_pad,         // clock pad
    inout             rst_pad,         // reset pad
    inout             read_n_pad,      // read_n pad
    inout             start_in_pad,    // start_in pad
    inout             valid_input_pad, // valid_input pad
    inout      [7:0]  r_addr_pad,      // 8-bit address pad
    inout      [7:0]  X_load_pad,      // 8-bit X_load pad
    inout             ry_pad,          // output pad for ry
    inout      [8:0]  read_data_pad,   // 9-bit read_data pad
    inout             finish_pad       // finish pad (ALU_done)
);

  wire        clk_core;
  wire        rst_core;
  wire        read_n_core;
  wire        start_in_core;
  wire        valid_input_core;
  wire [7:0]  r_addr_core;
  wire [7:0]  X_load_core;
  wire        ry_core;
  wire [8:0]  read_data_core;
  wire        ALU_done_core;

  CPAD_S_74x50u_IN clk_pad_inst (
      .COREIO(clk_core),
      .PADIO(clk_pad)
  );

  CPAD_S_74x50u_IN rst_pad_inst (
      .COREIO(rst_core),
      .PADIO(rst_pad)
  );

  CPAD_S_74x50u_IN read_n_pad_inst (
      .COREIO(read_n_core),
      .PADIO(read_n_pad)
  );

  CPAD_S_74x50u_IN start_in_pad_inst (
      .COREIO(start_in_core),
      .PADIO(start_in_pad)
  );

  CPAD_S_74x50u_IN valid_input_pad_inst (
      .COREIO(valid_input_core),
      .PADIO(valid_input_pad)
  );

  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : r_addr_pad_gen
      CPAD_S_74x50u_IN u_r_addr_pad (
          .COREIO(r_addr_core[i]),
          .PADIO(r_addr_pad[i])
      );
    end
  endgenerate

  generate
    for (i = 0; i < 8; i = i + 1) begin : X_load_pad_gen
      CPAD_S_74x50u_IN u_X_load_pad (
          .COREIO(X_load_core[i]),
          .PADIO(X_load_pad[i])
      );
    end
  endgenerate

  CPAD_S_74x50u_OUT ry_pad_inst (
      .COREIO(ry_core),
      .PADIO(ry_pad)
  );

  generate
    for (i = 0; i < 9; i = i + 1) begin : read_data_pad_gen
      CPAD_S_74x50u_OUT u_read_data_pad (
          .COREIO(read_data_core[i]),
          .PADIO(read_data_pad[i])
      );
    end
  endgenerate

  CPAD_S_74x50u_OUT finish_pad_inst (
      .COREIO(ALU_done_core),
      .PADIO(finish_pad)
  );

  top core_inst (
      .clk         (clk_core),
      .rst         (rst_core),
      .read_n      (read_n_core),
      .start_in    (start_in_core),
      .valid_input (valid_input_core),
      .r_addr      (r_addr_core),
      .X_load      (X_load_core),
      .ry          (ry_core),
      .read_data   (read_data_core),
      .ALU_done    (ALU_done_core)
  );

endmodule
