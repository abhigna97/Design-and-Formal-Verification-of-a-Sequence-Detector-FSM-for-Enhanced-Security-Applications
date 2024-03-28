#Winter 2024 ECE582- Project4
#Abhigna Bheemineni, Mounica Chaganti
set_fml_appmode COV

set design seq_detector

read_file -top $design -format sverilog -sva -vcs {../Design/seq_detector.sv} -cov all

#Creating clock and reset signals
create_clock clk -period 100
create_reset RESET -sense low

#Running a reset simulation
sim_run -stable
sim_save_reset

#Running check command
check_fv_setup