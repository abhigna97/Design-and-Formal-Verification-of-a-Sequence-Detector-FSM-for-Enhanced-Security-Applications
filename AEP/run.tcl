#Winter 2024 ECE582- Project4
#Abhigna Bheemineni, Mounica Chaganti
set_fml_appmode AEP

#Run -aep all analysis on module "seq_detector" in the file /Design/seq_detector.sv
set_fml_var fml_aep_unique_name true
read_file -top seq_detector -format sverilog -aep all -vcs {../Design/seq_detector.sv}

#Creating clock and reset signals
create_clock clk -period 100
create_reset RESET -sense low

#Running a reset simulation
sim_run -stable
sim_save_reset

#Running check command
check_fv_setup