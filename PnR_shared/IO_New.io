
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
Pad: PGND4                             N CPAD_S_74x50u_GND
Pad: clk_pad                           N CPAD_S_74x50u_IN
Pad: fetch_en_pad                      N CPAD_S_74x50u_IN
Pad: rstn_pad                          N CPAD_S_74x50u_IN

# # ------------------------------------------------ #
# # WEST 
# # ------------------------------------------------ #
Pad: spi_mode0_pad                     W CPAD_S_74x50u_IN
Pad: spi_mode1_pad                     W CPAD_S_74x50u_IN
Pad: spi_sdi0_pad                      W CPAD_S_74x50u_IN
Pad: spi_sdi1_pad                      W CPAD_S_74x50u_IN
Pad: spi_sdi2_pad                      W CPAD_S_74x50u_IN
Pad: spi_sdi3_pad                      W CPAD_S_74x50u_IN
Pad: spi_sdo0_pad                      W CPAD_S_74x50u_IN
Pad: spi_sdo0_pad                      W CPAD_S_74x50u_IN
Pad: PVDD1    	                       W CPAD_S_74x50u_VDD
Pad: PGND1                             W CPAD_S_74x50u_GND

# # ------------------------------------------------ #
# # SOUTH
# # ------------------------------------------------ #
Pad: PGND2                             S CPAD_S_74x50u_GND
Pad: spi_sdo0_pad                      S CPAD_S_74x50u_IN
Pad: spi_sdo0_pad                      S CPAD_S_74x50u_IN
Pad: spi_clk_pad                       S CPAD_S_74x50u_IN
Pad: spi_cs_pad                        S CPAD_S_74x50u_IN
Pad: uart_dtr_pad                      S CPAD_S_74x50u_OUT
Pad: uart_rts_pad                      S CPAD_S_74x50u_OUT
Pad: uart_rx_pad                       S CPAD_S_74x50u_IN
Pad: uart_tx_pad                       S CPAD_S_74x50u_OUT
Pad: PVDD2    	                       S CPAD_S_74x50u_VDD
# # ------------------------------------------------ #
# # EAST 
# # ------------------------------------------------ #
Pad: PVDD3    	                       E CPAD_S_74x50u_VDD
Pad: jtag_tck_pad                      E CPAD_S_74x50u_IN
Pad: jtag_tdi_pad 	    	       E CPAD_S_74x50u_IN
Pad: jtag_tdo_pad 		       E CPAD_S_74x50u_OUT
Pad: PGND3                             E CPAD_S_74x50u_GND
Pad: jtag_tms_pad 		       E CPAD_S_74x50u_IN
Pad: jtag_trstn_pad 		       E CPAD_S_74x50u_IN
Pad: gpio8_pad                         E CPAD_S_74x50u_OUT





