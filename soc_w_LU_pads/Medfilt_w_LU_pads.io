
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
Pad: read_data_pad_inst[0].read_data_pad_gen N CPAD_S_74x50u_OUT
Pad: read_data_pad_inst[1].read_data_pad_gen N CPAD_S_74x50u_OUT
Pad: read_data_pad_inst[2].read_data_pad_gen N CPAD_S_74x50u_OUT
Pad: read_data_pad_inst[3].read_data_pad_gen N CPAD_S_74x50u_OUT
Pad: read_data_pad_inst[4].read_data_pad_gen N CPAD_S_74x50u_OUT
Pad: PGND2    N CPAD_S_74x50u_GND
# # ------------------------------------------------ #
# # WEST 
# # ------------------------------------------------ #
Pad: read_data_pad_inst[5].read_data_pad_gen  W CPAD_S_74x50u_OUT
Pad: read_data_pad_inst[6].read_data_pad_gen  W CPAD_S_74x50u_OUT
Pad: read_data_pad_inst[7].read_data_pad_gen  W CPAD_S_74x50u_OUT
Pad: read_data_pad_inst[8].read_data_pad_gen  W CPAD_S_74x50u_OUT
Pad: ry_pad_inst  W CPAD_S_74x50u_OUT
# # ------------------------------------------------ #
# # SOUTH
# # ------------------------------------------------ #
Pad: PVDD1    S CPAD_S_74x50u_VDD
Pad: finish_pad_inst S CPAD_S_74x50u_OUT
Pad: X_load_pad_inst[0].X_load_pad_gen S CPAD_S_74x50u_IN
Pad: X_load_pad_inst[1].X_load_pad_gen S CPAD_S_74x50u_IN
Pad: X_load_pad_inst[2].X_load_pad_gen S CPAD_S_74x50u_IN
Pad: PVDD2    S CPAD_S_74x50u_VDD
# # ------------------------------------------------ #
# # EAST 
# # ------------------------------------------------ #
Pad: X_load_pad_inst[3].X_load_pad_gen E CPAD_S_74x50u_IN
Pad: X_load_pad_inst[4].X_load_pad_gen E CPAD_S_74x50u_IN
Pad: X_load_pad_inst[5].X_load_pad_gen E CPAD_S_74x50u_IN
Pad: X_load_pad_inst[6].X_load_pad_gen E CPAD_S_74x50u_IN
Pad: X_load_pad_inst[7].X_load_pad_gen E CPAD_S_74x50u_IN


