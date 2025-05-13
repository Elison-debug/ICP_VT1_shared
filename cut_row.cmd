#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed May  7 14:47:59 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v16.13-s045_1 (64bit) 10/03/2016 04:28 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 16.13-s045_1 NR160923-1039/16_13-UB (database version 2.30, 351.6.1) {superthreading v1.30}
#@(#)CDS: AAE 16.13-s013 (64bit) 10/03/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 16.13-s013_1 () Sep 28 2016 05:49:12 ( )
#@(#)CDS: SYNTECH 16.13-s008_1 () Sep 15 2016 11:59:01 ( )
#@(#)CDS: CPE v16.13-s039
#@(#)CDS: IQRC/TQRC 15.2.5-s542 (64bit) Thu Aug 25 18:41:43 PDT 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set conf_ioOri R0
set conf_row_height 2.6
set dcgHonorSignalNetNDR 1
set defHierChar /
set delaycal_input_transition_delay 0.1ps
set distributed_client_message_echo 1
set distributed_mmmc_disable_reports_auto_redirection 0
set floorplan_default_site CORE
set fpIsMaxIoHeight 0
set fp_core_height 538.2
set fp_core_to_bottom 0.1
set fp_core_to_left 0.1
set fp_core_width 542.345
set init_gnd_net GND
set init_io_file source_files/IO_New.io
set init_lef_file {/usr/local-eit/cad2/cmpstm/stm065v536/EncounterTechnoKit_cmos065_7m4x0y2z_AP@5.3.1/TECH/cmos065_7m4x0y2z_AP_Worst.lef /usr/local-eit/cad2/cmpstm/stm065v536/CORE65LPLVT_5.1/CADENCE/LEF/CORE65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/CLOCK65LPLVT_3.1/CADENCE/LEF/CLOCK65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/stm065v536/PRHS65_7.0.a/CADENCE/LEF/PRHS65_soc.lef /usr/local-eit/cad2/cmpstm/dicp18/lu_pads_65nm/PADS_Jun2013.lef /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHDL100909-40446@1.0/CADENCE/LEF/SPHDL100909_soc.lef}
set init_mmmc_file MMMC.view
set init_oa_search_lib {}
set init_pwr_net VDD
set init_top_cell pulpino_top_rtl_w_pads
set init_verilog source_files/pulpino_top_rtl_w_pads.v
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set spgLimitedSearchRadius 1
set trgGlbOverflowPctV 0.0242894
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CORE -s 1700 1700 20 20 20 20
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site CORE -s 1700.0 1700.0 20.0 20.0 20.0 20.0
uiSetTool select
getIoFlowFlag
fit
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -orient R90 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[3].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -orient R90 -ref_type core_boundary -bbox both -horizontal_edge_separate {2 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[3].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -orient R90 -ref_type core_boundary -bbox both -horizontal_edge_separate {2 -600 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[3].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -orient R180 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {0 550 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -orient R180 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -orient R180 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[3].sram_2k1} -orient R180 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -orient R270 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 -0 3}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[3].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -orient R270 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 600 0} -vertical_edge_separate {3 -0 3}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[3].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -orient R270 -ref_type core_boundary -bbox both -horizontal_edge_separate {2 0 1} -vertical_edge_separate {3 -0 3}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[3].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -orient R0 -ref_type core_boundary -bbox both -horizontal_edge_separate {1 0 1} -vertical_edge_separate {0 600 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -orient R0 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -orient R0 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[3].sram_2k1} -orient R0 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -orient R90 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[3].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -orient R90 -ref_type core_boundary -bbox both -horizontal_edge_separate {2 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[3].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -orient R90 -ref_type core_boundary -bbox both -horizontal_edge_separate {2 -600 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[3].sram_2k1} -orient R90 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -orient R180 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {0 550 0}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -orient R180 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -orient R180 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[3].sram_2k1} -orient R180 -ref_type object -ref {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -orient R270 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 -0 3}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[3].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -orient R270 -ref_type core_boundary -bbox both -horizontal_edge_separate {0 600 0} -vertical_edge_separate {3 -0 3}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[3].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {1 0 3} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -orient R270 -ref_type core_boundary -bbox both -horizontal_edge_separate {2 0 1} -vertical_edge_separate {3 -0 3}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[3].sram_2k1} -orient R270 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -orient R0 -ref_type core_boundary -bbox both -horizontal_edge_separate {1 0 1} -vertical_edge_separate {0 600 0}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -orient R0 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -orient R0 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
create_relative_floorplan -place {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[3].sram_2k1} -orient R0 -ref_type object -ref {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1} -bbox both -horizontal_edge_separate {0 0 0} -vertical_edge_separate {3 0 1}
pan -80.108 -139.544
addHaloToBlock {10 10 10 10} -allBlock
addHaloToBlock {10 10 10 10} -allBlock
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[1].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[2].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/ram_row[3].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[0].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[0].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[0].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[3].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[1].ram_byte[0].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[3].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[2].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[1].sram_2k1}
selectInst {top/core_region_i/data_mem/sp_ram_i/ram_row[2].ram_byte[0].sram_2k1}
cutRow -selected
cutRow -selected
deselectAll
