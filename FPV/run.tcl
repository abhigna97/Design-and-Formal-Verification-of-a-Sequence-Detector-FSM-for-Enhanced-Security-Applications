#Winter 2024 ECE582- Project4
#Abhigna Bheemineni, Mounica Chaganti
set_fml_appmode FPV

set design seq_detector

#Run -aep all analysis on module "seq_detector" in the file /Design/seq_detector.sv
#set_fml_var fml_aep_unique_name true
read_file -top $design -format sverilog -sva -vcs {../Design/seq_detector.sv +define+INLINE_SVA}

#Creating clock and reset signals
create_clock clk -period 100
create_reset RESET -sense low

#Running a reset simulation
sim_run -stable
sim_save_reset

#Running check command
check_fv_setup