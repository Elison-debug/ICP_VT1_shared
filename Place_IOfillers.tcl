#This is the design for the 1700*1700 size


#IO FILLER NORTH
deselectAll
selectInst PcornerUL
selectInst PGND4
selectInst spi_sdo2_pad
selectInst spi_sdo1_pad
selectInst clk_pad
selectInst spi_sdo3_pad
selectInst fetch_en_pad
selectInst rstn_pad
spaceIoInst -fixSide left -space 174
deselectAll
 
#IO FILLER EAST 9PADK

selectInst gpio8_pad
selectInst jtag_trstn_pad
selectInst jtag_tms_pad
selectInst PGND3
selectInst jtag_tdo_pad
selectInst jtag_tdi_pad
selectInst jtag_tck_pad
selectInst PVDD3
selectInst PcornerLR
spaceIoInst -fixSide bottom -space 149
deselectAll

#IO FILLER SOUTH 9PAD

selectInst PcornerLR
selectInst PVDD2
selectInst uart_tx_pad
selectInst uart_rx_pad
selectInst uart_rts_pad
selectInst uart_dtr_pad
selectInst spi_cs_pad
selectInst spi_clk_pad
selectInst PGND2
spaceIoInst -fixSide right -space 149
deselectAll

#IO FILLER WEST 10PAD 

selectInst spi_mode0_pad
selectInst spi_mode1_pad
selectInst spi_sdi0_pad
selectInst spi_sdi1_pad
selectInst spi_sdi2_pad
selectInst spi_sdi3_pad
selectInst spi_sdo0_pad
selectInst PVDD1
selectInst PGND1
selectInst PcornerUL
spaceIoInst -fixSide top -space 128
deselectAll

#ADD IO fillers
addIoFiller -cell PADSPACE_74x1u PADSPACE_74x2u PADSPACE_74x4u PADSPACE_74x8u PADSPACE_74x16u -prefix IO_FILLER -side n
addIoFiller -cell PADSPACE_74x1u PADSPACE_74x2u PADSPACE_74x4u PADSPACE_74x8u PADSPACE_74x16u -prefix IO_FILLER -side s
addIoFiller -cell PADSPACE_74x1u PADSPACE_74x2u PADSPACE_74x4u PADSPACE_74x8u PADSPACE_74x16u -prefix IO_FILLER -side w
addIoFiller -cell PADSPACE_74x1u PADSPACE_74x2u PADSPACE_74x4u PADSPACE_74x8u PADSPACE_74x16u -prefix IO_FILLER -side e








