#Winter 2024 ECE582- Project4
#Abhigna Bheemineni, Mounica Chaganti
set_fml_appmode FXP

#Run -fxp all analysis on module "seq_detector" in the file /Design/seq_detector.sv
read_file -top seq_detector -format sverilog -sva -vcs {../Design/seq_detector.sv}

#Automatically show the rootcause of falsified properties
set_fml_var fxp_compute_rootcause_auto true

#Creating clock and reset signals
create_clock clk -period 100
create_reset RESET -sense low

#Running a reset simulation
sim_run -stable
sim_save_reset

#Run the Formal X-Propagation Analysis
fxp_generate

#Running check command
check_fv_setup