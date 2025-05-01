
version: 3

Orient: R270
Pad: PcornerLL SW PADSPACE_C_74x74u_CH
Orient: R0x3
Pad: PcornerLR SE PADSPACE_C_74x74u_CH
Orient: R90
Pad: PcornerUR NE PADSPACE_C_74x74u_CH
Orient: R180
Pad: PcornerUL NW PADSPACE_C_74x74u_CH

# # ------------------------------------------------ #
# # NORTH
# # ------------------------------------------------ #
Pad: PGND1    N CPAD_S_74x50u_GND
Pad: read_data_pad_gen[0].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: read_data_pad_gen[1].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: read_data_pad_gen[2].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: read_data_pad_gen[3].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: read_data_pad_gen[4].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: r_addr_pad_gen[0].u_r_addr_pad           N CPAD_S_74x50u_IN
Pad: r_addr_pad_gen[1].u_r_addr_pad           N CPAD_S_74x50u_IN
Pad: read_data_pad_gen[5].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: read_data_pad_gen[6].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: read_data_pad_gen[7].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: read_data_pad_gen[8].u_read_data_pad     N CPAD_S_74x50u_OUT
Pad: clk_pad_inst			      N CPAD_S_74x50u_IN
Pad: ry_pad_inst  			      N CPAD_S_74x50u_OUT
# # ------------------------------------------------ #
# # WEST 
# # ------------------------------------------------ #
Pad: valid_input_pad_inst                     W CPAD_S_74x50u_IN
Pad: r_addr_pad_gen[2].u_r_addr_pad           W CPAD_S_74x50u_IN
Pad: r_addr_pad_gen[3].u_r_addr_pad           W CPAD_S_74x50u_IN
# # ------------------------------------------------ #
# # SOUTH
# # ------------------------------------------------ #
Pad: PVDD1    				      S CPAD_S_74x50u_VDD
Pad: finish_pad_inst 			      S CPAD_S_74x50u_OUT
Pad: X_load_pad_gen[0].u_X_load_pad           S CPAD_S_74x50u_IN
Pad: X_load_pad_gen[1].u_X_load_pad 	      S CPAD_S_74x50u_IN
Pad: X_load_pad_gen[2].u_X_load_pad 	      S CPAD_S_74x50u_IN
Pad: rst_pad_inst 			      S CPAD_S_74x50u_IN
Pad: r_addr_pad_gen[4].u_r_addr_pad           S CPAD_S_74x50u_IN
Pad: r_addr_pad_gen[5].u_r_addr_pad           S CPAD_S_74x50u_IN
Pad: X_load_pad_gen[3].u_X_load_pad 	      S CPAD_S_74x50u_IN
Pad: X_load_pad_gen[4].u_X_load_pad 	      S CPAD_S_74x50u_IN
Pad: X_load_pad_gen[5].u_X_load_pad 	      S CPAD_S_74x50u_IN
Pad: X_load_pad_gen[6].u_X_load_pad 	      S CPAD_S_74x50u_IN
Pad: X_load_pad_gen[7].u_X_load_pad 	      S CPAD_S_74x50u_IN
Pad: r_addr_pad_gen[6].u_r_addr_pad           S CPAD_S_74x50u_IN 
# # ------------------------------------------------ #
# # EAST 
# # ------------------------------------------------ #
Pad: r_addr_pad_gen[7].u_r_addr_pad           E CPAD_S_74x50u_IN
Pad: read_n_pad_inst 			      E CPAD_S_74x50u_IN
Pad: start_in_pad_inst 			      E CPAD_S_74x50u_IN


